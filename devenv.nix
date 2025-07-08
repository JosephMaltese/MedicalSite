{ pkgs, ... }:
let
  db_user = "postgres";
  db_host = "localhost";
  db_port = 5432;
  db_name = "db";
  django_port = "8000";
in
{
  packages = [ pkgs.git pkgs.postgresql_14  ];

  languages.python = {
    enable = true;
    directory = "./backend";
    version = "3.11";
    venv.enable = true;
    venv.requirements = ./backend/requirements.txt;
  };

  languages.javascript = {
      enable = true;
      directory = "./frontend";
      npm = {
        enable = true;
        install.enable = true;
      };
  };

  env = {
    DATABASE_URL = "postgresql://${db_user}@${db_host}:${builtins.toString db_port}/${db_name}";
    DEBUG = true;
    STATIC_ROOT = "/tmp/static";
  };

  enterShell = ''
  '';

  services.postgres = {
    enable = true;
    initialScript = "CREATE USER ${db_user} SUPERUSER;";
    initialDatabases = [{ name = db_name; }];
    listen_addresses = "127.0.0.1";
    package = pkgs.postgresql_14;
    port = db_port;
  };

  processes = {
    backend.exec = ''
      wait-for-db || exit 1 # if wait-for-db fails, exit!
      dj runserver
    '';
    frontend.exec = ''
    cd frontend
    npm run dev
    '';

  };

  scripts = {
    dj.exec = ''
      python ./backend/manage.py $@
    '';
    start-services-in-background.exec = ''
      if ! nc -z ${db_host} ${builtins.toString db_port};
      then
        printf "Starting database in background ...\n"
        nohup devenv up > /tmp/devenv.log 2>&1 &
      fi
    '';
    kill-services.exec = ''
      printf "Killing background services ...\n"
      fuser -k ${builtins.toString db_port}/tcp
      fuser -k ${django_port}/tcp
    '';
    wait-for-db.exec = ''
      printf "Waiting for database to start ...\n"
      printf "(if wait exceeds 100 percent then check /tmp/devenv.log for errors)\n"

      # wait up to 20s for the database to launch ...
      n_loops=20;
      timer=0;
      while true;
      do
        if nc -z ${db_host} ${builtins.toString db_port}; then
          printf "\nDatabase is running!\n\n"
          exit 0
        elif [ $timer -gt $n_loops ]; then
          printf "\nDatabase failed to launch!\n\n"
          exit 1
        else
          sleep 1
          let timer++
          percent=$((timer*100/n_loops))
          bar+="#"
          printf "\r[%-100s] %d%%" "$bar" "$percent"
        fi
      done
    '';
    launch-django.exec = ''
      interrupt_handler() {
        kill-services
        exit 1
      }

      trap 'interrupt_handler' SIGINT

      launch_django() {
        printf "Launching Django ...\n\n"
        start-services-in-background
        wait-for-db || exit 1 # if wait-for-db fails, exit!
        dj runserver ${django_port}
      }

      launch_django
    '';
    test-all.exec = ''
      interrupt_handler() {
        kill-services
        exit 1
      }

      trap 'interrupt_handler' SIGINT

      run_tests() {
        printf "Running tests...\n\n"
        start-services-in-background
        wait-for-db || exit 1 # if wait-for-db fails, exit!
        dj collectstatic --noinput
        dj test $@
        kill-services
        exit 0
      }

      run_tests
    '';
  };
}

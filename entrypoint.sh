#!/bin/bash
set -e

run() {
    if [ ! -f spigot-*.jar ]; then
        curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
        java -jar BuildTools.jar --rev $MINECRAFT_VERSION
    fi
    echo 'eula=true' > eula.txt
    java -jar spigot-*.jar
}

case "$1" in
"run")
    echo "Run"
    run
    ;;
*)
    echo "Custom command : $@"
    exec "$@"
    ;;
esac

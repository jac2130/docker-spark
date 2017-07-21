if [[ -z $DOCKER_SPARK_BRANCH ]]; then
    export DOCKER_SPARK_BRANCH="master"
fi
git clone -b "$DOCKER_SPARK_BRANCH" docker-spark:jac2130/docker-spark.git

apache2ctl -D FOREGROUND

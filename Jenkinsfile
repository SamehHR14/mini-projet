pipeline {
agent any
tools{ jdk 'JDK17' }
environment {

JAVA_HOME = '/usr/lib/jvm/java-17-openjdk-amd64'
DOCKER_TAG = getVersion()

}
stages {
stage ('Clone Stage') {
steps {
git https://gitlab.com/jmlhmd/datacamp_docker_angular.git'
}
}
stage ('Docker Build') {
steps {
sh 'docker build -t sameh010/aston-villa1:${DOCKER_TAG}.'
}
}

}
}
def getVersion(){
def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
return version
}
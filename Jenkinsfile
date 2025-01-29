pipeline {
    agent any
    tools { jdk 'JDK17' }

    environment {
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk-amd64'
        // Définir la variable d'environnement mais pas sa valeur ici
        DOCKER_TAG = getVersion()
    }

    stages {
        stage ('Clone Stage') {
            steps {
                script {
                    // Cloner le dépôt Git
                    git 'https://github.com/SamehHR14/mini-projet.git'
                    // Initialiser DOCKER_TAG après avoir cloné le dépôt
                }
            }
        }
    stage ('Docker Build') {
            steps {
                sh 'docker build -t sameh010/aston-villa1:${DOCKER_TAG} .'
            }
        }


    }
}

def getVersion() {
    def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return version.trim()
}
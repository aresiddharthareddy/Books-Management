pipeline {
    agent any

    environment {
        IMAGE_NAME = 'books-management-app'
        CONTAINER_NAME = 'books-app'
        PORT = '9000'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/aresiddharthareddy/Books-Management.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop & Remove Existing Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p $PORT:9000 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }
}

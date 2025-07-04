pipeline {
    agent any

    environment {
        IMAGE_NAME = 'books-management-app'
        CONTAINER_NAME = 'books-app'
    }

    stages {

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container Locally') {
            steps {
                sh 'docker run -d -p 8081:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }
}

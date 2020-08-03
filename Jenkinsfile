#!groovy
pipeline{
    agent any
    stages{
        stage("Create docker image") {
            steps {
                echo "================= start building image ================="
                sh 'docker build . -t task4'
            }
        }
        stage("Copying SimplePHP files from docker") {
            steps {
                echo "================= start container ================="
                sh 'docker create -it --name app_simple_php task4'
                sh 'docker cp app_simple_php:/var/www/html/simplephpapp .'
                sh 'docker rm -f app_simple_php'
                sh 'ls -lah' 
            }
        }
        }
    }
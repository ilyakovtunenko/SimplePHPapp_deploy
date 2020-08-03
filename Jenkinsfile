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
                echo "================= start container and copy file ================="
                sh 'docker create -it --name app_simple_php task4'
                sh 'docker cp app_simple_php:/var/www/html/simplephpapp .'
                sh 'docker rm -f app_simple_php'
                sh 'ls -lah' 
            }
        }
        stage("Deploy with the use Ansistrano ") {
            steps {
                echo "================= start building image ================="
                sh 'ansible --version'
                withCredentials([sshUserPrivateKey(credentialsId: "jenkins-ssh-credential", keyFileVariable: 'keyfile')]) {
                    sh 'ansible-playbook deploy.yml --private-key ${keyfile}'
                }
            }
        }
    } 
}

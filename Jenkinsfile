pipeline {
  environment {
    registry = "goku95/projet-devops-m2"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  agent any

  stages {
    stage('Git checkout') {
      steps {
         checkout scm
      }
    }
    
    stage('Building image') {
      steps{
          dir ( 'app'){
          script {
           dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }}
    }
    stage('Publish Image ') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push("latest")
          }
           echo "trying to push Docker Build to DockerHub"
        }
      }
    }

    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    stage('Deploy K8s') {
      steps{
          dir ( 'app'){	  
	   script {
        kubernetesDeploy(configs: "deployment-apache.yml", "service-apache.yml")
      }
				}
				}
    }
}
  
}
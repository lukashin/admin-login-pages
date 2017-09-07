pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        timeout(unit: 'MINUTES', time: 10) {
          retry(count: 2) {
            timestamps() {
              sh 'echo \'screw you!\''
            }
            
          }
          
        }
        
      }
    }
  }
}
pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        timeout(unit: 'MINUTES', time: 20) {
          catchError() {
            echo 'Shame!'
          }
          
          timestamps() {
            ws(dir: 'build_number') {
              sh 'echo \'some useful stuff\''
            }
            
          }
          
        }
        
      }
    }
  }
}
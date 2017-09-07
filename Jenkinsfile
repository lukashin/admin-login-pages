pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        timestamps() {
          timeout(unit: 'MINUTES', time: 20) {
            ws(dir: 'some_workspace') {
              retry(count: 3) {
                sh 'echo "hi there!"'
                error 'panic!'
                catchError() {
                  cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, deleteDirs: true)
                  sh 'echo "booooo!"'
                  
                  currentBuild.result = 'SUCCESS'
                }
                
              }
              
            }
            
          }
          
        }
        
      }
    }
  }
}

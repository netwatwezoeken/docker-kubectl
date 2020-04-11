def withPod(body) {
  podTemplate(cloud: 'kubernetes', label: 'build', containers: [
      containerTemplate(name: 'kaniko', image: 'gcr.io/kaniko-project/executor:debug', command: '/busybox/cat', ttyEnabled: true)
    ],
    volumes: [
	  secretVolume(secretName: 'dockerhub', mountPath: '/cred')
    ]
 ) { body() }
}

withPod {
	node('build') {
		checkout scm		
        container('kaniko') {
            stage('Build image') {
                sh("cp /cred/.dockerconfigjson /kaniko/.docker/config.json")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.16 --single-snapshot --build-arg k8sversion=v1.16.8")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.16 --single-snapshot --build-arg k8sversion=v1.16.8")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.17 --single-snapshot --build-arg k8sversion=v1.17.4")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.17 --single-snapshot --build-arg k8sversion=v1.17.4")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.18 --single-snapshot --build-arg k8sversion=v1.18.0")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.18 --single-snapshot --build-arg k8sversion=v1.18.0")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug --single-snapshot --build-arg k8sversion=v1.18.0")
                sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:latest --single-snapshot --build-arg k8sversion=v1.18.0")
			}	
		}
	}
}
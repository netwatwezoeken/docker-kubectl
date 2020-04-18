def withPod(body) {
  podTemplate(cloud: 'kubernetes', label: 'build', containers: [
      containerTemplate(name: 'kaniko', image: 'gcr.io/kaniko-project/executor:debug', command: '/busybox/cat', ttyEnabled: true)
    ],
    volumes: [
	  secretVolume(secretName: 'dockerhub', mountPath: '/cred')
    ]
 ) { body() }
}

def createImage(dockerfile, tag, version){
    sh('echo "${dockerfile}, ${dockerfile}, ${dockerfile}"')
	//sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.16 --single-snapshot --build-arg k8sversion=v1.16.9")
}

withPod {
	node('build') {
		checkout scm		
        container('kaniko') {
            stage('Build image') {
                sh("cp /cred/.dockerconfigjson /kaniko/.docker/config.json")
				createImage("Dockerfile-debug", "debug-v1.16", "v1.16.9")
				createImage("Dockerfile", "v1.16", "v1.16.9")
				createImage("Dockerfile-debug", "debug-v1.17", "v1.17.5")
				createImage("Dockerfile", "debug-v1.17", "v1.17.5")
				createImage("Dockerfile-debug", "debug-v1.18", "v1.18.2")
				createImage("Dockerfile", "debug-v1.18", "v1.18.2")
				createImage("Dockerfile-debug", "debug", "v1.18.2")
				createImage("Dockerfile", "latest", "v1.18.2")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.16 --single-snapshot --build-arg k8sversion=v1.16.9")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.16 --single-snapshot --build-arg k8sversion=v1.16.9")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.17 --single-snapshot --build-arg k8sversion=v1.17.5")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.17 --single-snapshot --build-arg k8sversion=v1.17.5")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug-v1.18 --single-snapshot --build-arg k8sversion=v1.18.2")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:v1.18 --single-snapshot --build-arg k8sversion=v1.18.2")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile-debug --destination=joshendriks/kubectl:debug --single-snapshot --build-arg k8sversion=v1.18.2")
                //sh("executor --context=`pwd` --dockerfile=`pwd`/Dockerfile --destination=joshendriks/kubectl:latest --single-snapshot --build-arg k8sversion=v1.18.2")
			}	
		}
	}
}
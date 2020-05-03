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
	sh("executor --context=`pwd` --dockerfile=`pwd`/${dockerfile} --destination=joshendriks/kubectl:${tag} --single-snapshot --build-arg k8sversion=${version}")
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
				createImage("Dockerfile", "v1.17", "v1.17.5")
				createImage("Dockerfile-debug", "debug-v1.18", "v1.18.2")
				createImage("Dockerfile", "v1.18", "v1.18.2")
				createImage("Dockerfile-debug", "debug", "v1.18.2")
				createImage("Dockerfile", "latest", "v1.18.2")
			}	
		}
	}
}
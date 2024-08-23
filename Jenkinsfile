@Library("jenkins-shared-library") _

SPAJavaPipeline(
    portMapping  : '8070:8080',
    appMemory    : '500m',
    appCpu       : '0.5',
    credentials  : [
        [
            "credentialsId": "RUKULA_APP_POSTGRES",
            "usernameVariable": "RUKULA_APP_POSTGRES_USERNAME",
            "passwordVariable": "RUKULA_APP_POSTGRES_PASSWORD",
        ]
    ],
    variables    : ['RUKULA_APP_POSTGRES_URL']
)
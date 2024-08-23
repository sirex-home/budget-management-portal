@Library("jenkins-shared-library") _

SPAJavaPipeline(
    portMappings  : [ '8070:8080' ],
    appMemory    : '500m',
    appCpu       : '0.5',
    network      : 'rukula_app_network',
    credentials  : [
        [
            "credentialsId": "RUKULA_APP_POSTGRES",
            "usernameVariable": "RUKULA_APP_POSTGRES_USERNAME",
            "passwordVariable": "RUKULA_APP_POSTGRES_PASSWORD",
        ]
    ],
    variables    : ['RUKULA_APP_POSTGRES_URL']
)

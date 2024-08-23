@Library("jenkins-shared-library") _

SPAJavaPipeline(
    portMapping  : '8070:8080',
    appMemory    : '500m',
    appCpu       : '0.5',
    credentials  : ['RUKULA_APP_POSTGRES'],
    variables    : ['RUKULA_APP_POSTGRES_URL']
)
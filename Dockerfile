FROM openjdk:24-oraclelinux9 as builder

WORKDIR /app

RUN mkdir fe-dist
COPY budget-management-be/build/libs/app.jar app.jar

RUN java -Djarmode=layertools -jar app.jar extract

FROM openjdk:24-oraclelinux9

WORKDIR /app

COPY --from=builder app/dependencies/ ./
COPY --from=builder app/spring-boot-loader ./
COPY --from=builder app/snapshot-dependencies/ ./
COPY --from=builder app/application/ ./

COPY budget-management-fe/dist ./fe-dist

ENV SPRING_WEB_RESOURCES_STATIC_LOCATIONS=/app/fe-dist

EXPOSE 8080

ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]

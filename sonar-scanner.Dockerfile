FROM openjdk:8-jre-alpine

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG NODEJS_HOME=/opt/nodejs

ENV SONAR_SCANNER_HOME=${SONAR_SCANNER_HOME} \
    SONAR_SCANNER_VERSION=4.0.0.1744

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}/bin

WORKDIR /opt

RUN apk add --no-cache --update wget git jq unzip tar xz

RUN wget -U "sonar-scanner-github-action" -q -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
    && unzip sonar-scanner-cli.zip \
    && rm sonar-scanner-cli.zip \
    && mv sonar-scanner-${SONAR_SCANNER_VERSION} ${SONAR_SCANNER_HOME}

RUN apk del wget git jq unzip tar xz

RUN apk add --no-cache --update nodejs nodejs-npm
RUN npm install -g typescript
FROM alpine:3.9

ARG GIT_BRANCH
ARG GIT_COMMIT_ID
ARG GIT_BUILD_TIME
ARG GITHUB_RUN_NUMBER
ARG GITHUB_RUN_ID

LABEL git.branch=${GIT_BRANCH}
LABEL git.commit.id=${GIT_COMMIT_ID}
LABEL git.build.time=${GIT_BUILD_TIME}
LABEL git.run.number=${GITHUB_RUN_NUMBER}
LABEL git.run.id=${TRAVIS_BUILD_WEB_URL}

RUN apk update && apk --no-cache add openssl socat

COPY code/ LICENSE /opt/nuvlabox/

WORKDIR /opt/nuvlabox/

VOLUME /srv/nuvlabox/shared

ONBUILD RUN ./license.sh

ENTRYPOINT ["./api.sh"]

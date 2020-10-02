FROM alpine:3.9

ARG GIT_BRANCH
ARG GIT_COMMIT_ID
ARG GIT_DIRTY
ARG GIT_BUILD_TIME
ARG TRAVIS_BUILD_NUMBER
ARG TRAVIS_BUILD_WEB_URL

LABEL git.branch=${GIT_BRANCH}
LABEL git.commit.id=${GIT_COMMIT_ID}
LABEL git.dirty=${GIT_DIRTY}
LABEL git.build.time=${GIT_BUILD_TIME}
LABEL travis.build.number=${TRAVIS_BUILD_NUMBER}
LABEL travis.build.web.url=${TRAVIS_BUILD_WEB_URL}

RUN apk update && apk --no-cache add openssl socat

COPY code/ LICENSE /opt/nuvlabox/

WORKDIR /opt/nuvlabox/

VOLUME /srv/nuvlabox/shared

ONBUILD RUN ./license.sh

ENTRYPOINT ["./api.sh"]

FROM gliderlabs/alpine:3.3
RUN apk --no-cache add alpine-sdk coreutils \
  && adduser -G abuild -g "Alpine Package Builder" -s /bin/sh -D builder \
  && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY /abuilder /bin/
USER builder
ENTRYPOINT ["abuilder", "-r"]
WORKDIR /home/builder/package
ENV PACKAGER_PRIVKEY /home/builder/abuild.rsa

FROM alpine:3.10

RUN apk add --no-cache git tinyssh ucspi-tcp &&\
    tinysshd-makekey /etc/tinyssh/sshkeydir &&\
    adduser git --disabled-password --shell /usr/bin/git-shell &&\
    mkdir /home/git/.ssh &&\
    chown git:git /home/git/.ssh &&\
    mkdir /srv/git &&\
    chown git:git /srv/git
VOLUME ["/home/git/.ssh", "/srv/git"]
COPY entrypoint.sh /
RUN chmod o+x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

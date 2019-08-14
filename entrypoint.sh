#!/bin/sh

if [ "$1" == "adduser" ]; then
  cat - >> /home/git/.ssh/authorized_keys
elif [ "$1" == "init"  ]; then
  su git -s /bin/sh -c "mkdir -p /srv/git/$2.git &&
	  git init --bare --shared /srv/git/$2.git"
else	
  tcpserver -HRDl0 0.0.0.0 22 /usr/sbin/tinysshd -v /etc/tinyssh/sshkeydir
fi

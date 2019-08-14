A lightweight git server docker image based on tinyssh

# Basic Usage

## Build and Run Git Server

```
docker build -t git-server  https://github.com/artkoda/tinygits.git
docker run -d -p 2222:22 --name gits git-server
```

## Generate SSH Key and Send it to the Server

```
ssh-keygen -t ed25519
docker run -i --rm --volumes-from gits git-server adduser < ~/.ssh/id_ed25519.pub
```

## Create an Empty Git Repository and Play around with it

```
# create an empty project named 'myproject'
docker run -i --rm --volumes-from gits git-server init myporject 
```

```
mkdir myproject
cd myproject
git init
touch README.md
git add .
git commit -m "Initial Commit"
git remote add origin ssh://git@localhost:2222/srv/git/myproject.git
git push origin master
```

Assume there is another user named Tim:

```
# in ther server side
docker run -i --rm --volumes-from gits git-server adduser < ~/.ssh/id_ed25519.tim.pub
```

```
# then in Tim's computer
git clone ssh://git@<ServerAddress>:2222/srv/git/myporject.git
```

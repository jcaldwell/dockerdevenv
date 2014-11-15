### Docker Dev Env ###

The idea is that I want to be able to have a well-configured 
development environment anywhere I go.  I love i3 Window Manager, and hate to be without it. 

### Layers Like an Ogre ###
These docker images represent layers that you can build from to create a dev environment that
suits you.

#### Layer 0 ####
ubuntu

#### Layer 1 ####
bketelsen/osbase 

This layer adds openssh-server.  Not using it yet.  May never need it.  But it's there.

#### Layer 2 ####
bketelsen/commandbase

This layer adds development tools and command tools.

```
RUN apt-get update && apt-get install -y ca-certificates curl unzip tar python-pip build-essential git-core mercurial bzr cmake zsh
RUN curl -Ls https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz | tar xvzf - -C /usr/local/go --strip-components=1
```

#### Layer 3 ####
bketelsen/uibase

This layer adds the i3 window manager, a VNC server and the tools needed to be comfortable in i3.

```
RUN apt-get update && apt-get install -y i3 terminator feh dmenu dunst connman-ui rox-filer hexchat tightvncserver vim-gtk 
RUN easy_install supervisor
```

#### Layer 4 ####
bketelsen/devenv

This is the final layer, the container that you'll want to run when it's all built.  It adds your personalized configurations.
Work in Progress here.

Right now, it's only adding the supervisord.conf file that starts vncserver.  Future steps:

* clone dotfiles
* symlink dotfiles
* git pull dotfiles at runtime to get latest

To run you should attach a local volume.  Although the entire home directory is exported as a volume, you shouldn't attach
an entire local home dir or you'll overwrite your own config files.  Instead, selectively attach folders like this:

`docker run -d -P -v /Users/bketelsen/src:/home/bketelsen/src bketelsen/devenv`

Then your local `src` directory will be available inside the container.

For Go development, don't put your entire GOPATH inside a volume.  e.g. don't put the pkg and bin folders inside
the container.  If you're on windows or a mac, you'll make yourself sad littering your GOPATH/pkg and bin dirs with
linux libraries and binaries.




### Make it yours ###
I added all these unnecessary layers so that you can inherit from any level and customize as you see fit.
It also significantly reduces build times when you make a change.  Only layers with changes will get rebuilt and 
pushed.

I'm very open to community suggestions and ideas about how to improve this.  Especially with the user layering.  


### TODO ###
* Give buildContainers.sh a username and have it replace a stubbed username with the one given using sed.
* Or? Pass in a username as an ENV var and use ONBUILD to rig all this up?  Might not be possible, fun to try.
* Dotfiles






FROM jcaldwell/useradd

MAINTAINER Jeffery Caldwell <jeffery.caldwell@gmail.com>
ENV user jcaldwell
USER root
RUN chsh -s /usr/bin/zsh $user
ADD stowDotfiles.sh /home/$user/stowDotfiles.sh
USER $user
ENV TEMP /tmp
ENTRYPOINT /home/$user/stowDotfiles.sh $user && supervisord -n -c /home/$user/supervisord.conf

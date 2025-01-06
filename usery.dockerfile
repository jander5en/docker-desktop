#Build with tag kubuntudesktop_usery : "dockerbuild -t kubuntudesktopusery -f usery.dockerfile ."

#docker run -it --rm -p 3389:3389 --name kubuntu kubuntudesktopusery

FROM kubuntudesktop_main:latest

RUN useradd -m usery -p $(openssl passwd vpn123) && usermod -aG sudo usery && usermod --shell /bin/bash usery

EXPOSE 3389

CMD service dbus start ; /usr/lib/systemd/systemd-logind & service xrdp start; bash

#Build with tag kubuntudesktop_userx : "docker build -t kubuntudesktop_userx -f userx.dockerfile ."

#docker run --rm -it -v userxstorage:/home/userx/data -p 3389:3389 --name kubuntu kubuntudesktop_userx

FROM kubuntudesktop_main:latest

VOLUME userxstorage

RUN apt update && apt install -y gedit

RUN useradd -m userx -p $(openssl passwd vpn123) && usermod -aG sudo userx && usermod --shell /bin/bash userx

EXPOSE 3389

CMD service dbus start ; /usr/lib/systemd/systemd-logind & service xrdp start; bash

FROM debian:10-slim

RUN  \
   apt update \
   && apt install -y wget unzip \
   && wget https://kiwiirc.com/downloads/kiwiirc_20.05.24.1_linux_amd64.zip \
   && unzip kiwiirc_20.05.24.1_linux_amd64.zip \
   && rm kiwiirc_20.05.24.1_linux_amd64.zip \
   && mv kiwiirc_linux_amd64/ kiwiirc \
   && cd kiwiirc \
   && mv config.conf.example config.conf \
   && sed -i 's/port = 80/port = 8080/g' config.conf \
   && sed -i 's/hostname = "irc.kiwiirc.com"/hostname = "127.0.0.1"/g' config.conf \

   && cd / \
   && wget https://github.com/oragono/oragono/releases/download/v2.5.1/oragono-2.5.1-linux-x86_64.tar.gz \
   && tar xf oragono-2.5.1-linux-x86_64.tar.gz \
   && rm oragono-2.5.1-linux-x86_64.tar.gz \
   && mv oragono-2.5.1-linux-x86_64/ oragono \
   && cd oragono \
   && mv default.yaml ircd.yaml \
   && sed -i 's/"\[::1\]:6667":/#"\[::1\]:6667":/g' ircd.yaml \
   && chmod u+x oragono \
   && ./oragono mkcerts \
   && cd /


COPY run.sh .

EXPOSE 8080

ENTRYPOINT ["./run.sh"]

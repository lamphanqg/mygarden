FROM mysql:8.0.25
RUN apt-get update
RUN apt-get install -y tzdata locales-all && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

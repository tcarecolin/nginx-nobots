FROM nginx:1.19.3
LABEL maintainer="Thibaut CARE-COLIN - thibaut.care-colin.fr"

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
    unzip

COPY . /app/
WORKDIR /app/

RUN ln -sf /app/banlist.sh /etc/cron.daily

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
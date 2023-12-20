FROM debian:bookworm-slim AS base

RUN apt-get update \
  && apt-get install -y --install-recommends gpg \
  && rm -rf /var/lib/apt/lists/*


FROM base

ADD https://apt.metasploit.com/metasploit-framework.gpg.key /usr/share/keyrings/metasploit.key

RUN cat /usr/share/keyrings/metasploit.key | gpg --dearmor > /usr/share/keyrings/metasploit.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt lucid main" > /etc/apt/sources.list.d/metasploit.list \
  && apt-get update \
  && apt-get install -y metasploit-framework \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD [ "msfconsole" ]

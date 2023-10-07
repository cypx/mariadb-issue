ARG VERSION
FROM mariadb:$VERSION
ARG VERSION
# 5.5 - trusty
# 10.0 - xenial
# 10.1 - bionic ...
# 10.3 - focal ...
# 10.8+ jammy ...
ARG REL

# older 10.2 versions
#RUN echo "deb https://archive.mariadb.org/mariadb-$VERSION/repo/ubuntu $REL main main/debug" > /etc/apt/sources.list.d/mariadb-debug.list
# newer versions
RUN sed -i -e 's/main/main main\/debug/' /etc/apt/sources.list.d/mariadb.list

# Much newer versions don't need VM
# pre 10.9
RUN apt-get update \
	&& VM=$VERSION && VM=${VM%.*} \
        && apt-get install -y linux-tools-common mariadb-server-core-${VM}-dbgsym ; \
        rm -rf /var/lib/apt/lists/*

# 10.9+
#RUN apt-get update \
#        && apt-get install -y linux-tools-common mariadb-server-core-dbgsym ; \
#        rm -rf /var/lib/apt/lists/*

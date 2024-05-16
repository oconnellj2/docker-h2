FROM openjdk:20
LABEL maintainer="jdo.info@pm.me"

# Create data directory
ENV DATA_DIR /opt/h2-data
RUN mkdir -p ${DATA_DIR}

# Download H2 database
RUN curl -L https://github.com/h2database/h2database/releases/download/version-2.2.224/h2-2.2.224.jar -o h2.jar

# Copy H2 server properties file
COPY h2.server.properties /root/.h2.server.properties

# Expose ports
EXPOSE 81 1521

# Set working directory
WORKDIR /opt/h2-data

# Start H2 database server
CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
    -web -webAllowOthers -webPort 81 \
    -tcp -tcpAllowOthers -tcpPort 1521 \
    -baseDir ${DATA_DIR} ${H2_OPTIONS}

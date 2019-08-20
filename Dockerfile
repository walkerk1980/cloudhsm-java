FROM walkerk1980/cloudhsm-base
WORKDIR /root/
RUN /usr/bin/wget https://s3.amazonaws.com/cloudhsmv2-software/CloudHsmClient/Xenial/cloudhsm-client-jce_latest_amd64.deb \
  && /usr/bin/dpkg -i cloudhsm-client-jce_latest_amd64.deb \
  && /bin/rm cloudhsm-client-jce_latest_amd64.deb
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" --assume-yes -y --yes -f install -y \ 
  openjdk-8-jdk \
  software-properties-common \
  git \
  && apt-get update \
  && /bin/rm -rf /var/lib/apt/lists/*
WORKDIR /opt/
RUN wget http://mirrors.advancedhosters.com/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz \
  && tar -xzvf apache-maven-3.6.1-bin.tar.gz \
  && update-alternatives --install /usr/bin/mvn maven /opt/apache-maven-3.6.1/bin/mvn 1001 \
  && rm apache-maven-3.6.1-bin.tar.gz
ENV LD_LIBRARY_PATH=/opt/cloudhsm/lib
ENV HSM_PARTITION=PARTITION_1
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2

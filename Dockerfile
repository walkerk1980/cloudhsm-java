FROM walkerk1980/cloudhsm-base
WORKDIR /root/
RUN /usr/bin/wget https://s3.amazonaws.com/cloudhsmv2-software/CloudHsmClient/Xenial/cloudhsm-client-jce_latest_amd64.deb
RUN /usr/bin/dpkg -i cloudhsm-client-jce_latest_amd64.deb
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2

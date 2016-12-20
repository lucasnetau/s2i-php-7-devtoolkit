FROM centos/php-70-centos7

USER root

COPY tideways.repo /etc/yum.repos.d/tideways.repo

RUN rpm --import https://s3-eu-west-1.amazonaws.com/qafoo-profiler/packages/EEB5E8F4.gpg && \
    yum makecache --disablerepo=* --enablerepo=tideways && \
    yum -y install tideways-php tideways-cli tideways-daemon && \
    yum clean all

USER 1001

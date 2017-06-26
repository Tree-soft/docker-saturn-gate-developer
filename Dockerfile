FROM centos:7
MAINTAINER Egor Zyuskin <e.zyuskin@tree-soft.com>

ADD ./etc/yum.repos.d/ /etc/yum.repos.d/

RUN rpm -i http://mirror.yandex.ru/epel/7Server/x86_64/e/epel-release-7-9.noarch.rpm && \
	yum install -y docker-engine supervisor git sudo maven

ADD ./etc/supervisord.d/ /etc/supervisord.d/
ADD ./usr/ /usr/

EXPOSE 9001

ENTRYPOINT ["/usr/sbin/container-entrypoint.sh"]
CMD ["supervisord", "--nodaemon"]

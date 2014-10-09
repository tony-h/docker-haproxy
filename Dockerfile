FROM ubuntu:12.04

RUN apt-get -y update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:vbernat/haproxy-1.5 && apt-get -y update && apt-get install haproxy

EXPOSE 80 443

ADD haproxy.sh /root/haproxy.sh
ADD haproxy.cfg /root/haproxy.cfg

CMD ["/root/haproxy.sh"]


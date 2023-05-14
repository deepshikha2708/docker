FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/main.zip -L https://github.com/venky2207/Tic-Tac-Toe/archive/refs/heads/main.zip
RUN cd /var/www/html/ && unzip main.zip && mv Tic-Tac-Toe-main/* . && rm -rf Tic-Tac-Toe-main main.zip

EXPOSE 80

CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
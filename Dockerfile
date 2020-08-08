FROM fedora:latest
MAINTAINER Sangyong Gwak <imyaman@netscape.net>

RUN yum install -y glibc-langpack-en glibc-langpack-ko dancer2 perl-Starman procps
RUN yum clean all
RUN groupadd -r dancer2 -g 500
RUN useradd -u 500 -r -g dancer2 -d /home/dancer2 -m -s /sbin/nologin -c "Perl Dancer2" dancer2

# Setup workdir
WORKDIR /home/dancer2
COPY . .
RUN chown -R dancer2:dancer2 *
RUN chmod a+rx app.psgi

# run
WORKDIR /home/dancer2
USER dancer2
EXPOSE 3001
CMD starman --listen 0.0.0.0:3001 app.psgi

FROM centos
RUN yum install -y ruby-devel gcc make rpm-build rubygems fpm
RUN gem install --no-ri --no-rdoc fpm

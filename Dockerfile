FROM ubuntu:16.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -y update

# Install rvm
RUN apt-get install -y git curl
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh

# Install ruby
RUN /bin/bash -l -c "rvm install 2.4.0"

# Clone and configure application
RUN git clone https://github.com/elhowm/wave_bro.git
WORKDIR ./wave_bro
RUN ls
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "bundle config --global silence_root_warning 1"
RUN /bin/bash -l -c "bundle install"

EXPOSE 4567

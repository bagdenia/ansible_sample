FROM ruby:2.6.2
LABEL Stanislav Mekhonoshin <ejabberd@gmail.com>

WORKDIR /app
COPY ./ .

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -qy nodejs
RUN gem install bundler -v '1.17.3'
RUN bundle install
RUN cp config/database.yml.sample config/database.yml

CMD rails db:migrate && rails server -b 0.0.0.0

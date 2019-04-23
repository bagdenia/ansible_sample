FROM ruby:2.6
LABEL Stanislav Mekhonoshin <ejabberd@gmail.com>

WORKDIR /app
COPY ./ .

RUN bundle install
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -qy nodejs
RUN cp config/database.yml.sample config/database.yml

CMD rails db:migrate && rails server -b 0.0.0.0

FROM ruby:2.6
LABEL Stanislav Mekhonoshin <ejabberd@gmail.com>

WORKDIR /app
COPY ./ .

RUN bundle install
RUN cp config/database.yml.sample config/database.yml

CMD rails db:migrate && rails server

FROM ruby:2.5.1

ENV HOME /myapp
WORKDIR $HOME

ADD Gemfile      $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim
RUN bundle install -j4

ADD . $HOME

CMD ["jekyll", "serve", "-w", "--force_polling", "-H", "0.0.0.0"]

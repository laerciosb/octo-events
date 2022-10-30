CURRENT_DIRECTORY := $(shell pwd)

dbrenew:
	rm -rf ./storage/*
	bundle exec rails db:drop db:create db:schema:load db:test:prepare db:seed

clean:
	sudo chown -R ${USER}:${USER} .
	rm -rf ./coverage ./tmp/* ./log/* ./storage/*

install:
	sudo apt install libpq-dev
	cp .env.sample .env
	make dbrenew
	gem install bundler
	bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
	bundle install

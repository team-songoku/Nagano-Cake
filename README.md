# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

gem 'devise'

gem 'enum_help'

gem 'kaminari'

bundle install

rails g devise:install

【顧客用】
rails g devise Customer

【管理者用】
rails g devise Admin

【顧客用】
rails g devise:controllers customer

【管理者用】
rails g devise:controllers admin

【顧客用】
rails g devise:views customers

【管理者用】
rails g devise:views admins

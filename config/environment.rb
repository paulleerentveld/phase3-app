require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
)

require_relative "../app/news"
require_relative "../app/model/articles"
require_relative "../app/cli"
require "rubygems"
require "logger"

require "sinatra"
require "erubis"

$stdout.sync = true

configure :production, :development do
  enable :static
  enable :logging

  set :root, File.expand_path("#{File.dirname(__FILE__)}/..")
  set :erb, :escape_html => true
  set :public_folder, ENV["PUBLIC_FOLDER"] || File.expand_path("#{File.dirname(__FILE__)}/../public")
end

get "/" do
  erb :index
end

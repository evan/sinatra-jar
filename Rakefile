require "java"
require "warbler"

HERE = File.expand_path(File.dirname(__FILE__))

task "default" => "jar:run"

namespace "jar" do
  desc "Run the project jar file"
  task "run" => "jar" do
    exec("cd #{HERE} && rm -rf /tmp/sinatra-jar* && cp sinatra-jar.jar /tmp && cd /tmp && unzip -o sinatra-jar.jar 'sinatra-jar/public/*' && unzip -o sinatra-jar.jar sinatra-jar/config/web.ru && env PUBLIC_FOLDER=/tmp/sinatra-jar/public java -server -jar sinatra-jar.jar sinatra-jar/config/web.ru")
  end
end

desc "Create the project jar file"
task "jar" do
  system("cd #{HERE} && jruby -S warble")
end

desc "Run the project from jruby"
task "run" do
  exec("cd #{HERE} && jruby -S bundle exec jruby -S bin/puma config/web.ru")
end

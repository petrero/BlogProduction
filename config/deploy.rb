# role :web, "192.168.33.10"
# role :app, "192.168.33.10"
# role :db, "192.168.33.10", primary: true

server "192.168.33.10", :web, :app, :db, primary: true #this is the one that it's going to run migrations on
set :user, "deployer"

set :recipient, "Ruby"

default_run_options[:pty] = true #if it's requested a password on the server will be passed to your shell

task :hello, roles: :db do
	puts "Hello #{fetch(:recipient, "World!")}"
	run "#{sudo} cp ~/hello /hello"
end
task :goodbye do
	puts "Goodbye #{recipient}!"
end
after :hello, :goodbye

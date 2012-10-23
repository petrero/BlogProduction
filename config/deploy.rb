server "192.168.33.10", :web
set :user, "deployer"

set :recipient, "Ruby"

task :hello do
	puts "Hello #{fetch(:recipient, "World!")}"
	run "echo 'Hello World!' > ~/hello"
end
task :goodbye do
	puts "Goodbye #{recipient}!"
end
after :hello, :goodbye

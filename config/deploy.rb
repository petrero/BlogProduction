#set :recipient, "Ruby"
task :hello do
	puts "Hello #{fetch(:recipient, "World!")}"
	#goodbye
end
task :goodbye do
	puts "Goodbye #{recipient}!"
end
after :hello, :goodbye

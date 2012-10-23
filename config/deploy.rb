set :recipient, "Ruby"
task :hello do
	puts "Hello #{recipient}!"
	#goodbye
end
task :goodbye do
	puts "Goodbye #{recipient}!"
end
after :hello, :goodbye

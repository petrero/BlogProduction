task :hello do
	puts "Hello ruby!"
	#goodbye
end
task :goodbye do
	puts "Goodbye ruby!"
end
after :hello, :goodbye

namespace :nginx do
	task :setup do
		erb = File.read(File.expand_path("../template/nginx_unicorn.erb"), __FILE__)
		result = ERB.new(erb).result(binding)
		# put result, "etc/nginx/sites-enabled/#{application}" (require special privileges)
		put result "/tmp/nginx.conf" #put method is provided by capistrano
		run "#{sudo} mv /tmp/nginx.conf etc/nginx/sites-enabled/#{application}"	
	end
	after "deploy:setup", "nginx:setup"
end


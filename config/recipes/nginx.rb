namespace :nginx do
	task :setup do
		# put result, "etc/nginx/sites-enabled/#{application}" (require special privileges)
		template "nginx_unicorn.erb", "/tmp/nginx.conf"
		run "#{sudo} mv /tmp/nginx.conf etc/nginx/sites-enabled/#{application}"	
	end
	after "deploy:setup", "nginx:setup"
end


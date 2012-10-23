namespace :nginx do
	task :install do
		run "#{sudo} add-apt-repository ppa:nginx/stable"
		run "#{sudo} apt-get -y update"
		run "#{sudo} apt-get -y install nginx"
	end
	after "deploy:install", "nginx:install"

	task :setup do
		# put result, "etc/nginx/sites-enabled/#{application}" (require special privileges)
		template "nginx_unicorn.erb", "/tmp/nginx.conf"
		run "#{sudo} mv /tmp/nginx.conf etc/nginx/sites-enabled/#{application}"	
		run "#{sudo} rm-f /etc/nginx/sites-enabled/default"
		restart
	end
	after "deploy:setup", "nginx:setup"

	%w[start stop restart].each do |command|
		task command do
			run "#{sudo} service nginx #{command}"	
		end
	end
end


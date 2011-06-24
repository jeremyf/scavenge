set :application, "scavenge"
set :user, 'deploy'
set :repository,  "git@github.com:jeremyf/scavenge.git"
set :deploy_to,   "/var/www/apps/#{application}"
set :scm, :git

role :web, "app3.ndwebgroup.railsmachina.com" # Your HTTP server, Apache/etc
role :app, "app3.ndwebgroup.railsmachina.com" # This may be the same as your `Web` server
role :db,  "app3.ndwebgroup.railsmachina.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
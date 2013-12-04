require "bundler/capistrano"

server "162.243.72.49", :web, :app, :db, primary: true

set :application, "esther_rogers"
set :user, "esther"
set :deploy_to, "/home/#{user}/rails/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true
set :rails_env, "production"

set :scm, :git
set :repository,  "https://github.com/dodgerogers/esther_rogers"
set :branch, "master"

set :keep_releases, 2

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # only last keep 2 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: { no_release: true } do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end
  
  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    sudo "mkdir -p #{shared_path}/config"
    puts "Now edit the config files in #{shared_path}"
  end
  after "deploy:setup", "deploy:setup_config"
  
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    #sudo "mkdir -p #{release_path}/public/uploads/"
    #sudo "chmod -R 777 #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
  
  desc "Make sure local git is in sync with remote"
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes"
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
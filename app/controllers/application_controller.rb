require 'digest/md5'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  USERS = { CONFIG[:username] => CONFIG[:password],
            "APP" => Digest::MD5.hexdigest(["APP", CONFIG[:realm], CONFIG[:password]].join(":"))}
  
  helper_method :authenticate
  helper_method :current_user
            
  private
  
  def authenticate
    authenticate_or_request_with_http_digest(CONFIG[:realm]) do |username|
      session[:admin] = username
      USERS[username]
    end
  end
  
  def current_user
    @current_user = session[:admin]
  end
end

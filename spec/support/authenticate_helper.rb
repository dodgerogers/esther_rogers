# Included by default in all controller tests
require 'digest/md5'
module AuthenticateHelper
  
  def authenticate_with_http_digest(user = CONFIG[:username], password = CONFIG[:password])
    realm = CONFIG[:realm]
    ActionController::Base.class_eval { include ActionController::Testing }
    
    self.instance_eval do
      def credentials(request, response)
         @credentials = {
           :uri => request.url,
           :realm => "#{realm}",
           :username => "#{user}",
           :nonce => ActionController::HttpAuthentication::Digest.nonce(request.env['action_dispatch.secret_token']),
           :opaque => ActionController::HttpAuthentication::Digest.opaque(request.env['action_dispatch.secret_token'])
         } 
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Digest.encode_credentials(request.request_method, @credentials, password, true)
      end
    end
  end
end
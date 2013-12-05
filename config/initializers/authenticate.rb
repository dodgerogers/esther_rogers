ActionController::HttpAuthentication::Digest.module_eval do
  def authentication_request(controller, realm, message = nil)
    message = controller.render_to_string(template: "errors/401")
    authentication_header(controller, realm)
    controller.response_body = message
    controller.status = 401
  end
end
    
# def authentication_request_with_customization(controller, realm, message = nil)
#     message = controller.render_to_string(template: "errors/401")
#     authentication_request_without_customization(controller, realm, message)
#   end
#   alias_method_chain :authentication_request, :customization
# end    
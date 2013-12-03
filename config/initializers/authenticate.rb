# include EstherRaday::Application.routes.url_helpers
# ActionController::HttpAuthentication::Digest.module_eval do
#   def authentication_request(controller, realm, message = nil)
#     message ||= "You are unauthorized to access this page.\n"
#     authentication_header(controller, realm)
#     controller.response_body = controller.redirect_to EstherRaday::Application.routes.url_helpers.root_path
#     controller.flash[:error] = message
#     controller.status = 401
#   end
# end
# 
#controller.response_body = controller.redirect_to EstherRaday::Application.routes.url_helpers.root_path
#controller.flash[:error] = message
#controller.render ActionView::Base.new("app/views/", {}, ActionController::Base.new).render(template: "errors/401", layout: "layouts/application")
#controller.response_body = ActionView::Base.new("app/views/", {}, ActionController::Base.new).render(template: "errors/401", layout: "layouts/application")

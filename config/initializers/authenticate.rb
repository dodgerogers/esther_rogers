ActionController::HttpAuthentication::Digest.module_eval do
  def authentication_request_with_customization(controller, realm, message = nil)
    message = controller.render_to_string(template: "errors/401")
    authentication_request_without_customization(controller, realm, message)
  end
  alias_method_chain :authentication_request, :customization
end

# controller.response_body = controller.redirect_to EstherRaday::Application.routes.url_helpers.root_path
# controller.flash[:error] = message
# controller.render ActionView::Base.new("app/views/", {}, ActionController::Base.new).render(template: "errors/401", layout: "layouts/application")
# controller.response_body = ActionView::Base.new("app/views/", {}, ActionController::Base.new).render(template: "errors/401", layout: "layouts/application")

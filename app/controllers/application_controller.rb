class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.cms_domain?
    DomainConstraint.matches?(OpenStruct.new(:domain => CurrentDomainMiddleware.current_domain))
  end

end

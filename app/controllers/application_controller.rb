class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_layout

  def self.cms_domain?
    DomainConstraint.matches?(OpenStruct.new(:domain => CurrentDomainMiddleware.current_domain))
  end

  private

  def set_layout
    if request.path !~ /admin/
      if ApplicationController.cms_domain?
        self.class.layout 'rally'
      else
        self.class.layout 'rally'
      end
    end
  end

end

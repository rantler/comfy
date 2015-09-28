class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_layout
  before_filter :load_content

  private

  def set_layout
    if request.path !~ /admin/
      self.class.layout 'rally'
    end
  end

  def load_content
    # TODO Replace this with finding the appropriate content record
    unless @content
      @content = Content.last
      @content_properties = @content.accessible_properties
    end
  end

end

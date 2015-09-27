class HomeController < ApplicationController

  def index
    @content = Content.last.accessible_properties
  end

end

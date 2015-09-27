class HomeController < ApplicationController

  def index
    @banner = Content.last.accessible_properties
  end

end

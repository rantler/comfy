class Internal::AdminController < ApplicationController

  def index
    render :text => 'This is the internal panel'
  end

end

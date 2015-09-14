class BrowseController < ApplicationController

  before_filter :set_layout

  def index
    render :template => 'browse/browse'
  end

  private

  def set_layout
    if ApplicationController.cms_domain?
      self.class.layout 'cms'
    else
      self.class.layout 'application'
    end
  end

end

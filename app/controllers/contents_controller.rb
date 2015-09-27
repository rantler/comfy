class ContentsController < ApplicationController

  def new
    @editing = true
    @content = Content.new(:domain_id => 1)
    render :template => '/home/index'
  end

  def edit
    @editing = true
    @content = Content.find(params[:id])
    @content_properties = @content.accessible_properties
    render :template => '/home/index'
  end

  def create
    @content = Content.new
    @content.update_attributes(allowed_params)
    @content_properites = @content.accessible_properties
    redirect_to :root
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(allowed_params)
    redirect_to :root
  end

  private

  def allowed_params
    params.merge(:domain_id => 1).permit(:properties).merge(params.slice(:properties))
  end

end

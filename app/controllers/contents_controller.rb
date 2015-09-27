class ContentsController < ApplicationController

  def new
    @editing = true
    @content = Content.new(:kind => 'banner', :domain_id => 1)
    render :template => '/home/index'
  end

  def edit
    @editing = true
    @content = Content.find(params[:id])
    render :template => '/home/index'
  end

  def create
    @content = Content.new
    @content.update_attributes(content_params)
    redirect_to :root
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(content_params)
    Rails.logger.debug("@content = #{@content.inspect}")
    redirect_to :root
  end

  private

  def content_params
    params[:content].permit(:properties, :kind, :domain_id).
      merge(:domain_id => 1).
      merge(properties_params)
  end

  def properties_params
    params.slice(:properties)
  end

end

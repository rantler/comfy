class ContentsController < ApplicationController

  def new
    @editing = true
    @content = Content.new
    @content_properties = @content.accessible_properties
    render :template => '/home/index'
  end

  def edit
    @editing = true
    @content = Content.find(params[:id])
    render :template => '/home/index'
  end

  def create
    # TODO Set the actual domain id according to current_domain
    @content = Content.new(:domain_id => 1)
    update_content_properties
    redirect_to :root
  end

  def update
    @content = Content.find(params[:id])
    update_content_properties
    redirect_to :root
  end

  private

  def allowed_params
    params.permit(:properties).merge(params.slice(:properties))
  end

  def nav_links_from_href_and_text
    params[:properties][:href].zip(params[:properties][:text]).map do |pair|
      { :href => pair.first, :text => pair.last }
    end
  end

  def update_content_properties
    params[:properties][:nav_links] = nav_links_from_href_and_text
    params[:properties].delete(:href)
    params[:properties].delete(:text)
    @content.update_attributes(allowed_params)
  end

end

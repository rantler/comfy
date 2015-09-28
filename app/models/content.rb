class Content < ActiveRecord::Base

  serialize :properties

  after_initialize :set_default_properties, :if => :new_record?

  def accessible_properties(hash = properties)
    if hash.is_a?(Hash)
      hash.each do |key, value|
        hash[key] = accessible_properties(value)
      end
      hash = OpenStruct.new(hash)
    elsif hash.is_a?(Array)
       hash = hash.map { |array| accessible_properties(array) }
    end
    hash
  end

  private

  def set_default_properties
    self.properties ||= {
      :title => 'title',
      :sub_title => 'sub title',
      :logo_url => 'http://',
      :nav_links => [ :href => '/', :text => 'Home' ]
    }
  end

end

class Content < ActiveRecord::Base

  serialize :properties

  def accessible_properties
    OpenStruct.new(properties)
  end

end

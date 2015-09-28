class Content < ActiveRecord::Base

  serialize :properties

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

end

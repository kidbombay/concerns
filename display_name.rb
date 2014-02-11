module DisplayName
  extend ActiveSupport::Concern

  
  def display_name
    return name if !name.blank?
    username
  end

  def short_display_name
    result = first_name
    result += " #{last_name[0]}." if !last_name.blank?
    return result
  end

  def first_name
    if !display_name.blank?
      split = [display_name.split[0]]
      split.empty? ? display_name : split.join(" ")
    end
  end

  def last_name
    if !display_name.blank?
      split = display_name.split
      split -= ["Jr."]
      split -= ["Jr"]
      split -= ["Sr."]
      split -= ["Sr"]
      split.length == 1 ? "" : split.last
    end
  end
  
  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods


  end

end
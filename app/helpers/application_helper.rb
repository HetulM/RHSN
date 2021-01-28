module ApplicationHelper

  # This helper file contains the methods which can be used throughout my application to avoid code repetition. 

  # This helper is used to convert the "number_to_curreny" default helper to use the "£" unit instead of "$". 
  def price(price)
    number_to_currency(price, :unit => "£")
  end
  
  # The helper which is used to define the avatar which is attached to a user. 
  def avatar_for(user, options={ width: 80 })
    size=options[:size]
    unless user.nil?
      # If an avatar exists, display the avatar which has been uploaded to Amazon S3, else use the 
      # gravatar image. 
      if user.avatar?
        image_tag(user.avatar.url, size: size, class: 'avatar-image')
      else
        image_tag(gravatar_image_url(user.email), width: size, class: 'avatar-image')
      end
    end
  end

  # Allows me to translate strings with a link (I18n)
  # Title: StringWithLink source code
  # Author: holli
  # Date: 04/06/2011
  # Code version: 1.0
  def string_with_link(str, link_url, link_options = {})
    match = str.match(/__([^_]{2,30})__/)
    if !match.blank?
      raw($` + link_to($1, link_url, link_options) + $')
    else
      raise "string_with_link: No place for __link__ given in #{str}" if Rails.env.test?
      nil
    end
  end
end

class Site

  def Site.name
    if ENV["KEYPAD_SITE_NAME"].blank?
      "keypad"
    else
      ENV["KEYPAD_SITE_NAME"]
    end
  end

  def Site.logo_path
    File.join(Site.name, "logo.png")
  end

  def Site.favicon_path
    File.join(Site.name, "favicon.ico")
  end

  def Site.apple_touch_icon_path
    File.join(Site.name, "apple-touch-icon.png")
  end

end

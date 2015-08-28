class FacebookController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :detect_facebook_post!
  after_action :allow_facebook_iframe

  # def channel
  #   cache_expire = 1.year
  #   response.headers["Pragma"] = "public"
  #   response.headers["Cache-Control"] = "max-age=#{cache_expire.to_i}"
  #   response.headers["Expires"] = (Time.now + cache_expire).strftime("%d %m %Y %H:%I:%S %Z")
  #   render :layout => false, :inline => "<script src='//connect.facebook.net/en_US/all.js'></script>"
  # end

  private

  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://apps.facebook.com'
  end
end
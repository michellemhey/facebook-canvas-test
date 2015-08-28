module ApplicationHelper
	def page_metadata
    out = {}
    session_key      = Rails.application.config.session_options[:key]
    out['session']   = cookies[session_key]
    out['csrfParam'] = Rack::Utils.escape_html(request_forgery_protection_token)
    out['csrfToken'] = Rack::Utils.escape_html(form_authenticity_token)
    out['appUrl']    = $fb_url
    out
  end

  def facebook_iframed_url
    "#{$fb_url}#{request.path}"
  end
end

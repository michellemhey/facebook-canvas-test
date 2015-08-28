class SessionController < ApplicationController
  skip_before_filter :detect_facebook_post!
  skip_before_filter :verify_authenticity_token

  def create
    if log_in_with_facebook request.env['omniauth.auth']
      redirect_to '/'
    else
      logger.info "Failed to create a session"
      logger.info request.env['omniauth.auth'].to_yaml
      log_out
      redirect_to '/'
    end
  end

  def destroy
    log_out
    redirect_to_auth_facebook!
  end

end
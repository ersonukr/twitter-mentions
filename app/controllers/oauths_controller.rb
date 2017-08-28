class OauthsController < ApplicationController

  def twitter_callback
    user = User.find_or_initialize_by(twitter_id: request.env.dig('omniauth.auth', 'uid'))
    user.assign_attributes({token: request.env.dig('omniauth.auth', 'credentials').token,
                            token_secret: request.env.dig('omniauth.auth', 'credentials').secret,
                            name: request.env.dig('omniauth.auth', 'info').name,
                            nickname: request.env.dig('omniauth.auth', 'info').name})
    if user.save
      session[:user] = user.twitter_id
      flash[:notice] = "Hello #{user.name}"
      redirect_to mentions_path
    else
      flash[:notice] = 'Your twitter authorization is unsuccessful.'
      redirect_to root_path
    end
  end

  def failure_callback
    flash[:notice] = 'Something went wrong with twitter'
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = 'You have log out successfully.'
    redirect_to root_path
  end
end

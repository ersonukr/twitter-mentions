class MentionsController < ApplicationController

  before_action :fetch_user

  def index
    @mentions = @user.get_mentions
    flash[:notice] = @mentions.present? ? 'Fetched successfully' : 'No mentions found'
  end

  def reply
    if params[:text].present?
      mention = @user.mentions.find_by_id(params[:mention_id])
      mention.reply_on_mention(params[:text])
      flash[:notice] = 'Replied successfully.'
      redirect_to mentions_path
    end
  end

  private

  def fetch_user
    @user = User.find_by_twitter_id(session[:user])
  end
end

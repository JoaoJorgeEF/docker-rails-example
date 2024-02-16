class UsersController < ApplicationController
  before_action :set_chat

  def chat
    respond_to do |format|
      format.turbo_stream {}
    end
  end

  private

  def set_chat
    @target_user = User.find(params[:target_user_id])
    @following = Following.where(follower_id: current_user.id, followed_id: @target_user.id).first
    @chat = if @following.chats.present?
        @following.chats.first
      else
        @following.chats = [Chat.create]
      end
  end
end

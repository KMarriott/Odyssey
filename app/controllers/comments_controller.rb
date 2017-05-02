class CommentsController < ApplicationController
  def index
  end

  def create
    @user = current_user
    Comment.create(place: @place,
                comment: params[:comment],
                user_id: current_user.id)
  end

  def destroy
  Comment.destroy(params[:id])
  redirect_to :back
  end

end

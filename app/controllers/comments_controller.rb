class CommentsController < ApplicationController
  def index
  end

  def create
    @user = current_user
    Comment.create(place: params[:place],
                comment: params[:comment],
                user_id: 1)
  end

  def destroy
  Comment.destroy(params[:id])
  redirect_to "/trips"
  end

end

class CommentsController < ApplicationController
  authorize_resource
  def create
    @comment = current_user.comments.create restaurant_id: params[:restaurant_id], content: params[:comment][:content]
    respond_to do |format|
      format.js
    end
  end
end

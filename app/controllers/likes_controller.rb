class LikesController < ApplicationController

  def cretae
    @like = Like.new(user_id: current_user.id, book_id: params[:book_id])
    # @like = current_user.likes.create(book_id: params[:book_id]) 同じ意味
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
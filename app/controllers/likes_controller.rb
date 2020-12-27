class LikesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @like = current_user.likes.new(book_id: @book.id)
    # @like = current_user.likes.create(book_id: params[:book_id]) 同じ意味
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @like = current_user.likes.find_by(book_id: @book.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
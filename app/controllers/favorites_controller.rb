class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    # @book = Book.create(user_id: current_user.id, book_id: params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # redirect_to request.referer || books_path
  end

  def destroy
    @book = Book.find(params[:book_id])
    # book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # redirect_to request.referer || books_path
  end
  
  def set_book
    @book = Book.find(params[:book_id])
  end

end

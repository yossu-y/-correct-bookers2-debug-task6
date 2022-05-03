class BookCommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.comments.build(comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
    render book_path(params[:book_id])
    # @book_comment = current_user.book_comments.new(book_comment_params)
    # @book_comment.book_id = @book.id
    # if @book_comment.save
      # redirect_to book_path(@book), notice: "You have created book successfully."
    # else
      # redirect_to book_path(@book), notice: "comment can't be blank"
    # end

  end

  def destroy
    # BookComment.find(params[:id]).destroy
    # redirect_to book_path(params[:book_id])
    @booke_comment = Comment.find(params[:id])
    @book_comment.destroy
    render book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def correct_user
    @book_comment = BookComment.find(params[:id])
    @user = @book_comment.user
    unless @user == current_user
      redirect_to book_path(params[:book_id])
    end
  end

end

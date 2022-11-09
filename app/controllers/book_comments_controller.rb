class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to request.referer
    else
      @book = Book.find(params[:book_id])
      @user = @book.user
      @newbook = Book.new
      @book_comment = BookComment.new
      render 'books/show'
    end
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    if book_comment.user == current_user
      BookComment.find(params[:id]).destroy
      redirect_to request.referer
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end

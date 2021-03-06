class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    if @book_comment.save
      flash[:notice] = "You have commented successfully"
      # redirect_to book_path(@book)
    else
      @book_detail = Book.find(@book.id)
      @book = Book.find(@book.id)
      @user = User.find(@book_detail.user_id)
      render 'books/show'
    end 
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    if @book_comment.destroy
    # redirect_to book_path(params[:book_id]) 
    # render 'books/show'
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

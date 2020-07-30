class MemosController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_memo, except: :search

  def index
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to edit_memo_path(@memo)
    end
    # else
    #   render new_memo_path
    # end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
    redirect_to edit_memo_path
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to root_path
  end

  def search
    @memos = Memo.search(params[:keyword], \
      current_user.id)
  end

end

private
def move_to_sign_in
  unless user_signed_in?
    redirect_to '/users/sign_in'
  end
end

def memo_params
  params.require(:memo).permit(:title, \
    :body, :image).merge(user_id: current_user.id)
end

def set_memo
  memos = Memo.includes(:user).order("created_at DESC")
  @memos = current_user.memos
end
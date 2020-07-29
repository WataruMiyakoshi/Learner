class MemosController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_memo

  def index
  # @memos = Memo.all

  # binding.pry
end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    end
    # else
    #   redirect_to new_memo_path
    # end
  end

  def show
  end

  def edit
  end

end

private
def move_to_sign_in
  unless user_signed_in?
    redirect_to '/users/sign_in'
  end
end

def memo_params
  params.require(:memo).permit(:title, :body, :image).merge(user_id: current_user.id)
end

def set_memo
  # @memos = Memo.find_by(user_id: current_user.id)
  @memos = Memo.all
end
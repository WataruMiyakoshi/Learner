class MemosController < ApplicationController
  before_action :move_to_sign_in
  def index
    @email = current_user.email
  end
  def new
    
  end
end

private
def move_to_sign_in
  unless user_signed_in?
    redirect_to '/users/sign_in'
  end
end
class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @micropost = current_user.microposts.build(user_id: params[:id])
  end

  def show
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '投稿しました。'
      redirect_to "/users/#{@micropost.user_id}"
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
end

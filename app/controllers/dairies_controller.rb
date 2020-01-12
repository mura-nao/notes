class DairiesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @dairy = current_user.dairies.build(user_id: params[:id])
  end

  def show
    @dairy = Dairy.find(params[:id])
  end

  def create
     @dairy = current_user.dairies.build(dairy_params)
    if @dairy.save
      flash[:success] = 'dairyを投稿しました。'
      redirect_to "/users/#{@dairy.user_id}"
    else
      
      flash.now[:danger] = 'dairyの投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def destroy
    @dairy.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to "/users/#{@dairy.user_id}"
  end
  
  private
  
  def dairy_params
    params.require(:dairy).permit(:title, :content)
  end
  
  def correct_user
    @dairy = current_user.dairies.find_by(id: params[:id])
    unless @dairy
      redirect_to root_url
    end
  end

end



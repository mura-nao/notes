class HobbiesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @hobbies = current_user.hobbies.order(id: :desc).page(params[:page]).per(10)
  end
  
  def new
    @hobby = current_user.hobbies.build(user_id: params[:id])
  end

  def show
  end

  def create
    @hobby = current_user.hobbies.build(hobby_params)
    if @hobby.save
      flash[:success] = '投稿しました。'
      redirect_to hobbies_path
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @hobby.destroy
    flash[:success] = 'つぶやきを削除しました。'
    redirect_to hobbies_path
  end
  
  private
  
  def hobby_params
    params.require(:hobby).permit(:content)
  end
  
  def correct_user
    @hobby = current_user.hobbies.find_by(id: params[:id])
    unless @hobby
      redirect_to "/users/#{@hobby.user_id}"
    end
  end
  
end

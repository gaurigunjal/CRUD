class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show 
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hi #{@user.username}. You have successfully signed up"
      redirect_to articles_path
    else 
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated your account successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

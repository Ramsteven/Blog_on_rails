class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update,:destroy]
  before_action :require_user, only:[:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @users =  User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username} your user been created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  


  def update
    @user = User.find(params[:id])
    if @user.update(set_params)
       flash[:notice] = "You user has been updated correctly#{@user.username} "
       redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Acount and all articles was deleted"
    redirect_to root_path
  end

  private

  def set_user 
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(:username,:email,:password,:gender, :avatar)
  end
  
  def require_same_user
    if  current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end

end

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :paid]

  def index
    @users = User.where(activated: true)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'You must check your email and activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
    flash[:danger] = 'User has been deleted.'
  end

  def paid
    @user = User.find(params[:id])
    @user.update(paid: true)
    redirect_to users_url
    flash[:success] = @user.name + ' marked as having paid fees.'
  end

  def admin
    @user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to users_url
    flash[:success] = @user.name + ' now has admin rights.'
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update(admin: false)
    redirect_to users_url
    flash[:danger] = @user.name + ' no longer has admin rights.'
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                            :password_confirmation, :role, :bats, :bowls)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

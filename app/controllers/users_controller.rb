class UsersController < ApplicationController
  authorize_resource

  def index
    @users = User.where.not(id: current_user.id)
    @inactive_users = User.only_deleted
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.with_deleted.find(params[:id])
  end

  def update
    @user = User.with_deleted.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to users_path
    end
  end
  private

  def user_params
     params.require(:user).permit(%i[
       email first_name last_name password password_confirmation can_approve_work_orders deleted_at
     ])
  end

  def new_user_params
    user_params.merge(
      password: new_password,
      password_confirmation: new_password
    )
  end

  def new_password
    @new_password ||= Devise.friendly_token.first(8)
  end
end

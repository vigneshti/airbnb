class UsersController < ApplicationController  
  
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
  	Rails.logger.debug "inside user_controller new"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Your account has been created."
      redirect_to new_main_path
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def my_properties

    @current_user_properties=current_user.property.find(:all, :include => :booked_users)
    @current_user_booked_properties=current_user.booked_properties.find(:all, :include => :booked_users)
    
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end

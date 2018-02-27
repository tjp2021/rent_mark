class UsersController < ApplicationController
  before_action :authenticate!, only: [:edit, :update]

  def edit
    
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "You've successfully saved your Account Details"
      redirect_to dashboard_path
    else
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
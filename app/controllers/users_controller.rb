class UsersController < ApplicationController
  # def index

  # end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email, :password, :last_name, :first_name, :reading_last_name, :reading_first_name,
                                 :birthday)
  end
end

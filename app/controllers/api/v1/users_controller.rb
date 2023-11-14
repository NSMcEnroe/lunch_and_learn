class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerailizer.new(user), status: 201
    else
      render json: { errors: user.errors.full_messages.to_sentence }, status: 400
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

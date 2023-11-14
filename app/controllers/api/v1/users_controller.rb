class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)

    if new_user.save
      render json: UserSerializer.new(new_user), status: 201
    else
      render json: { errors: new_user.errors.full_messages.to_sentence }, status: 400
    end
  end

  private
  
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

class Api::V1::UsersController < ApplicationController
  def create
    user = User.new_initial(initial_user_params)
    if user.valid?
      #seperate from model validations, 
      user.validated = false
      user.save
      render json: {token: encode_token({user_id: user.id})}
    else
      render json: {error: "invalid email or password"}
    end
  end

  def find
    user = find_user
    if user
      render json: UserSerializer.new(user).serialized_json
    else
      render json: {error: "Invalid Token, no user found."}
    end
  end

  private
  def initial_user_params
    params.require(:user).permit(:email,:password,:caretaker)  
  end
  
end
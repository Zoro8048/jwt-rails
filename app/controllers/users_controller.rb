class UsersController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json:{status: 200, msg: payload(user)}
    else
      render json:{status: 401, msg: user.errors}
    end
  end
  def signup
    user = User.create(user_params)
    if user.save
      render json:{status: 200, msg: user}
    else
      render json: {status: 401, msg: user.errors}
    end
  end
  private
  def user_params
    params.require(:user).permit(:username,:password)
  end
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, username: user.username}
    }
  end
end
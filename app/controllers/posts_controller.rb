class PostsController < ApplicationController
  before_action :authenticate_request!, only: %i[create]
  def index
    render json:{status: 200, msg: "Connected"}
  end
  def create
    post = Post.create(req_params)
    if post.save
      render json:{status: 200, msg: post}
    else
      render json: {status: 401, msg: post.errors}
    end
  end
  private
  def req_params
    params.require(:post).permit(:title,:body)
  end
end
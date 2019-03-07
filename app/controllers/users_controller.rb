class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def show
    @user = set_user
    @posts = Post.where(user_id: params[:id])
                .order("posts.created_at DESC")
    @albums = Album.where(user_id: params[:id])
    @photos = Photo.where(user_id: params[:id])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:role, :user_name)
    end
end

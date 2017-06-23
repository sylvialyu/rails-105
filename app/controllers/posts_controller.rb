class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.group = @group

    if @post.save
      redirect_to group_path(@group), notice: "Post Created"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end

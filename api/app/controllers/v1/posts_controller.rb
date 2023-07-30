class V1::PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
    
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.require(:post).permit(:content, :user_id)
    end
end

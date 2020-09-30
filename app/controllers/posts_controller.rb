class PostsController < ApplicationController
    before_action: :find_post, only: [:edit, :show, :destroy]

    def new
        @post = Post.new
    end

    def edit

    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to :show
        else
            render :new
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update
            redirect_to :show
        else
            render :edit
        end
    end

    def index
        @posts = Post.all
    end

    def show
        
    end

    def destroy
        @post.destroy
        redirect_to :index
    end

    private
    def post_params
        params.require(:post).permit(:title, :genre, :artist_name, :released, :released_year)
    end

    def find_post
        @post = Post.find_by(id: params[:id])
    end
end

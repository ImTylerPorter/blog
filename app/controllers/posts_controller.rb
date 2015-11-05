class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)


		if @post.save
			redirect_to @post, notice: 'Hellz yeah, #{current_user.first_name}! Your Article was succesfully saved!'
		else
			render 'new', notice: "Oh no #{current_user.first_name}! I was unable to save your post."
		end
	end

	# Post found with before_action
	def show
		@post = Post.friendly.find(params[:id])
	end

	# Post found with before_action
	def edit
	end

	# Post found with before_action
	def update
		if @post.update post_params
			redirect_to @post, notice: "OH YEA! Your Post was succesfully saved!"
		else
			render 'edit'
		end
	end
	
	# Post found with before_action
	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :slug, :post_image, :post_image_delete)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end

end

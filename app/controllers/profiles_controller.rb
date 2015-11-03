class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user

	def show  
	  @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end  

	private

	def set_user
    	@user = User.find_by(first_name: params[:first_name])
 	end



end

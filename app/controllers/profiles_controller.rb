class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user

	def show  
	  @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end  

	def edit
		@user = User.find_by(user_name: params[:user_name])
	end

	def update  
	    if @user.update(profile_params)
	      flash[:success] = 'Your profile has been updated.'
	      redirect_to profile_path(@user.user_name)
	    else
	      render :edit
	    end
	  end

	private

	def set_user
    	@user = User.find_by(user_name: params[:user_name])
 	end

 	def profile_params
 		params.require(:user).permit(:avatar, :bio)
 	end


end

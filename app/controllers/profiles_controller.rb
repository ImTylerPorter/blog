class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :set_user 
	before_action :owned_profile, only: [:edit, :update]


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

  def owned_profile
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

end

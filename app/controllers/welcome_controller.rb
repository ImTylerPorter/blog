class WelcomeController < ApplicationController
	def index
		@posts = Post.all.limit(3).order("created_at desc")
		@projects = Project.all.limit(3).order("created_at desc")
		@tyler = User.first

		prepare_meta_tags(title: "Tyler Porter will be coming soon!")
	end
end

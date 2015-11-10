class PagesController < ApplicationController



  def home
	render :layout => false
	prepare_meta_tags(title: "Tyler Porter will be coming soon!")

  end
end

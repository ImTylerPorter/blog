class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at desc")
		prepare_meta_tags title: "Projects", 
						description: "Handcrafted projects by Tyler listed here!",
						og: {
							title: "Projects",
							description: "Handcrafted projects by Tyler listed here!",
						},
						twitter: {
							description: "Handcrafted projects by Tyler listed here!"
						}

	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)

		if @project.save
			redirect_to @project, notice: "Nice #{current_user.first_name}, This one looks really COOL. It was also successfully saved!"
		else
			render 'new'
		end
	end

	def show
	    prepare_meta_tags(title: @project.title,
                  description: @project.description.truncate(120),
                  image: @project.project_image.url(:original),
                  og: {
                  		title: @project.title,
                  		description: @project.description.truncate(120),
                  		image: @project.project_image.url(:original)
                  },
                  twitter: {
                  		description: @project.description.truncate(120),
                  		image: @project.project_image.url(:original)
                  }
				)
	end

	def edit
	end

	def update
		if @project.update project_params
			redirect_to @project, notice: "Nice TP! It was also successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def find_project
		@project = Project.friendly.find(params[:id])

	end

	def project_params
		params.require(:project).permit(:title, :description, :link, :slug, :project_image, :project_image_delete)
	end

end

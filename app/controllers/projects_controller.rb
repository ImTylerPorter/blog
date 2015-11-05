class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at desc")
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

class Project < ActiveRecord::Base
	has_attached_file :project_image, styles: { large: "1000x1000#", medium: "550x550#" }
  	validates_attachment_content_type :project_image, content_type: /\Aimage\/.*\Z/
	before_save :destroy_image?

	belongs_to :user

	

  	def project_image_delete
	    @project_image_delete ||= "0"
	end

	def project_image_delete=(value)
	    @project_image_delete = value
	end

	extend FriendlyId
  	friendly_id :title, use: :slugged

  	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

  	private
	def destroy_image?
	    self.project_image.clear if @project_image_delete == "1"
	end

end

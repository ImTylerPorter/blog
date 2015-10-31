class Project < ActiveRecord::Base
	has_attached_file :project_image, styles: { large: "1000x1000#", medium: "550x550#" }
  	validates_attachment_content_type :project_image, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
  	friendly_id :title, use: :slugged
end

class Post < ActiveRecord::Base
	has_attached_file :post_image, styles: { large: "1000x1000#", medium: "550x550#" }
  	validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/	


	  before_save :destroy_image?

	  def post_image_delete
	    @post_image_delete ||= "0"
	  end

	  def post_image_delete=(value)
	    @post_image_delete = value
	  end
 

	extend FriendlyId
  	friendly_id :title, use: :slugged

  	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	private
	  def destroy_image?
	    self.post_image.clear if @post_image_delete == "1"
	  end
  	belongs_to :user
end

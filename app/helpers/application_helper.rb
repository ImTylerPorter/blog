module ApplicationHelper
	class HTMLwithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
			Pygments.highlight(code, lexer: language)
		end
	end

	def markdown(content)
		renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_indented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikthrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end


	def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    								image_tag 'default-avatar.jpg', id: 'image-preview',
                                    class: 'img-responsive img-circle profile-image'
    end
end

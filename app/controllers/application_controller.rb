class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_filter :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    before_action :prepare_meta_tags, if: "request.get?"

    def prepare_meta_tags(options={})

    site        = "Tyler Porter"
    title       = [controller_name, action_name].join(" ")
    description = "Tyler Porter writes from his brain to your eyeballs."
    image       = options[:image] || image_path("imgpreview.jpg")  
    current_url = request.url

    # Let's prepare a nice set of defaults

    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[web software development mobile app],
      twitter:     {site_name: site_name,
                    site: '@thecookieshq',
                    card: 'summary',
                    description: description,
                    image: image},
      og:          {url: current_url,
                    site_name: site_name,
                    title: title,
                    image: image,
                    description: description,
                    type: 'website'}
    }


    options.reverse_merge!(defaults)


    set_meta_tags options

  end




    protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation) }
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation) }

    end
end

module ApplicationHelper

	def title(page_title)
        content_for (:title) { page_title }
    end

    def yield_or_default(section, default = "")
        content_for?(section) ? content_for(section) : default
    end

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def resource_class
        devise_mapping.to
    end

    def white_layouts
        (controller.controller_name == "pages" && controller.action_name != "help" ) || controller.controller_name == "contacts" || controller.controller_name == "blogs"
    end

    def not_useful
        controller.controller_name == "users" || controller.controller_name == "subscriptions" || controller.controller_name == "blogs" || controller.controller_name == "feedbacks"
    end

    def do_not_flash
        current_page?(nom_de_votre_compte_url) || current_page?(informations_de_votre_compte_url)
    end

end

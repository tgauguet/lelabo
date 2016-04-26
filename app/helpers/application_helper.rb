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
        (controller.controller_name == "pages" && controller.action_name != "help" ) || controller.controller_name == "contacts"
    end
    
end

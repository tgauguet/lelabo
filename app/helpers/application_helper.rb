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

    def link_to_function(name, *args, &block)
        html_options = args.extract_options!.symbolize_keys

        function = block_given? ? update_page(&block) : args[0] || ''
        onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
        href = html_options[:href] || '#'

        content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
    end

end


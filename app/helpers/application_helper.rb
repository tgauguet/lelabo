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

    #add the removed function "link_to_function"
    def link_to_function(name, *args, &block)
        html_options = args.extract_options!.symbolize_keys

        function = block_given? ? update_page(&block) : args[0] || ''
        onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
        href = html_options[:href] || '#'

        content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
    end

    def update_stared_item(item)
        if item.stared
            false
        else
            true
        end
    end

    def user_if_nil(obj)
        if obj.id == nil
            (@user.firstname + " " + @user.name)
        else
            obj.owner
        end
    end

    def sortable(name, column, title = nil)
        title ||= name.titleize
        css_class = (column == sort_columns) ? "sort-btn #{sort_direction}" : nil
        direction = (column == sort_columns && sort_direction == "asc") ? "desc" : "asc"
        link_to title, { sort: column, direction: direction}, class: css_class
    end

		def remove_field(name, f)
		    link_to_function(name, "remove_fields(this)")
		end

		def create_new_field(name, f, association)
			#create a new object quantity in association with the form
	        new_object = f.object.class.reflect_on_association(association).klass.new
	        #render a new template add_ingredient with the new form created with the new object
	        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
	          render("add_#{association}", :ff => builder, image: nil)
	        end
	    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	  end

end

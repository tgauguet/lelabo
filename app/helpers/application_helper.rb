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

		def to_kilo(gramme)
			if gramme > 9999
				gramme = (gramme.to_f / 1000).round(2)
				gramme.to_s + " " + "kg"
			else
				gramme.to_s + " " + "g"
			end
		end

		def to_kg(gramme)
			gramme > 9999 ? (gramme.to_f / 1000).round(2) : gramme.to_s
		end

		def to_unit(gramme)
			gramme > 9999 ? 'kg' : 'g'
		end

		def blog_pages
			request.path.start_with?('/blog')
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
        (controller.controller_name == "pages" && controller.action_name != "page_not_found" ) || controller.controller_name == "contacts" || controller.controller_name == "blogs"
    end

    def not_useful
      controller.controller_name == "pages" || controller.controller_name == "contacts" || controller.controller_name == "help" || controller.controller_name == "subscriptions" || controller.controller_name == "blogs" || controller.controller_name == "feedbacks" || controller.controller_name == "delete_accounts" || current_page?('/404') || current_page?('/500') || current_page?('/422') || current_page?('/page-error')
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

    def user_if_nil(obj)
        if obj.id == nil
            (@user.firstname + " " + @user.name)
        else
            obj.owner
        end
    end

    def sortable(name, column, title = nil)
        title ||= name
        css_class = (column == sort_columns) ? "sort-btn #{sort_direction}" : nil
        direction = (column == sort_columns && sort_direction == "asc") ? "desc" : "asc"
        link_to title, { sort: column, direction: direction}, class: css_class
    end

		def remove_field(name, f)
		    link_to_function(image_tag(name, class: "delete-ing"), "remove_fields(this)")
		end

		def create_new_field(name, f, association)
			#create a new object quantity in association with the form
	        new_object = f.object.class.reflect_on_association(association).klass.new
	        #render a new template add_ingredient with the new form created with the new object
	        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
	          render("add_#{association}", :ff => builder, image: nil)
	        end
	    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: "grey-btn hide white-cat new_#{association}")
	  end

		def grade(user)
			if user.recipes.count < 10
				"Novice"
			elsif user.recipes.count < 15
				"Apprenti"
			elsif user.recipes.count < 20
				"Commis"
			elsif user.recipes.count < 35
				"1/4 de chef de parti"
			elsif user.recipes.count < 50
				"1/2 Chef de parti"
			elsif user.recipes.count < 100
				"Chef de parti"
			elsif user.recipes.count < 150
				"Second"
			elsif user.recipes.count < 200
				"Chef"
			elsif user.recipes.count < 250
				"Commandant"
			elsif user.recipes.count < 300
				"Colonel"
			elsif user.recipes.count < 400
				"Général de brigade"
			elsif user.recipes.count < 500
				"Général de division"
			elsif user.recipes.count >= 500
				"Empereur"
			end
		end

		def grade_img(grade)
			if grade == "Novice"
				"1"
			elsif grade == "Apprenti"
				"2"
			elsif grade == "Commis"
				"3"
			elsif grade == "1/4 de chef de parti"
				"4"
			elsif grade == "1/2 Chef de parti"
				"5"
			elsif grade == "Chef de parti"
				"6"
			elsif grade == "Second"
				"7"
			elsif grade == "Chef"
				"8"
			elsif grade == "Commandant"
				"9"
			elsif grade == "Colonel"
				"10"
			elsif grade == "Général de brigade"
				"11"
			elsif grade == "Général de division"
				"12"
			elsif grade == "Empereur"
				"13"
			end
		end

		def category_color(value)
			if value.instance_of? Recipe
				i = RecipeCategory.find(value.recipe_category_id).name
			elsif value.instance_of? Ingredient
				i = Category.find(value.category_id).name
			end
			if i == "Chocolats" || i == "Chocolat"
				"brown-cat"
			elsif i == "Divers" || i == "Tarte"
				"royal-cat"
			elsif i == "Céréales" || i == "Biscuit"
				"sunflower-cat"
			elsif i == "Sucres" || i == "Crème" || i == "Pâte à choux"
				"swimming-cat"
			elsif i == "Produits laitiers" || i == "Glace"
				"blue-cat"
			elsif i == "Fruits" || i == "Mousse" || i == "Entremet"
				"strawberry-cat"
			elsif i == "Décors" || i == "Wedding cake"
				"pink-cat"
			elsif i == "Additifs" || i == "Dessert"
				"lavender-cat"
			elsif i == "Alcools" || i == "Confiserie"
				"mint-cat"
			elsif i == "Épices" || i == "Pâte" || i == "Bonbon"
				"pumpkin-cat"
			elsif i == "Fruits secs" || i == "Macaron"
				"avacado-cat"
			elsif i == "Purées de fruits" || i == "Sorbet"
				"emerald-cat"
			elsif i == "Ganache"
				"ganache-cat"
			else
				"grey-cat"
			end
		end

		def colors(value)
			if signed_in?
				user = current_user
				if user.colors == 6
					color = ["#57CCFF", "#94DEFF", "#F3F8FC", "#F6FAFE", "#0392F4"]
				elsif user.colors == 4
					color = ["#42D354", "#97FF9C", "#F0F8F0", "#F3FBF3", "#09B504"]
				elsif user.colors == 3
					color = ["#FFAF22", "#FFD05C", "#F7F5F0", "#FAF7F3", "#EA9206"]
				elsif user.colors == 5
					color = ["#00C6C1", "#77E0D5", "#EEF8F4", "#F3FEFA", "#00A098"]
				elsif user.colors == 9
					color = ["#FF1071", "#FF88C1", "#F8F0F3", "#FDF8FA", "#C4005E"]
				elsif user.colors == 8
					color = ["#D62EFF", "#E492FF", "#F7F0F8", "#FDF7FF", "#B400FF"]
				elsif user.colors == 2
					color = ["#FF9124", "#FFB776", "#F8F3F0", "#FAF7F3", "#FF6700"]
				elsif user.colors == 1
					color = ["#E52323", "#FF958A", "#F8F2F0", "#FBF4F2", "#C60000"]
				else
						color = ["#413DD4", "#75A6FD", "#F0F4F8", "#F8FAFD", "#2F17A3"]
				end
				color[value]
			end
		end

		def images
			# cyan / green / yellow / bluegreen / pink / purple / orange / red
			if signed_in?
				user = current_user
				if user.colors == 6
					"-c"
				elsif user.colors == 4
					"-g"
				elsif user.colors == 3
					"-y"
				elsif user.colors == 5
					"-bv"
				elsif user.colors == 9
					"-p"
				elsif user.colors == 8
					"-v"
				elsif user.colors == 2
					"-o"
				elsif user.colors == 1
					"-r"
				else
					""
				end
			end
		end

end

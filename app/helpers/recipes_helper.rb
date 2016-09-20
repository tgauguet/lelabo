module RecipesHelper

	def remove_field(name, f)
	    link_to_function(name, "remove_fields(this)")
	end

	def create_new_field(name, f, association)
		#create a new object quantity in association with the form
        new_object = f.object.class.reflect_on_association(association).klass.new
        #render a new template add_ingredient with the new form created with the new object
        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
          render("add_ingredient", :ff => builder)
        end
    	link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
    end

end
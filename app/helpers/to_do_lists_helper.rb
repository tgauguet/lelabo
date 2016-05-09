module ToDoListsHelper

	def empty_list
		@user.to_do_lists == "" || !@user.to_do_lists
	end

end
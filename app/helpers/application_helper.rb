module ApplicationHelper
	def provide_title(name="")
		if name==""
			"Todo"
		else
			"#{name} | Todo"
		end
	end
end

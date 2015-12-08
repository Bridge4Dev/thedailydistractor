module ApplicationHelper

	# Return a full title on each page
	def full_title(page_title = "")
		base_title = "The Daily Distractor"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	
end

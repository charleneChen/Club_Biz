module EventsHelper
	def add_image_link(name)
  		link_to_function name do |page|
    		page.insert_html :bottom, :images, :partial => 'image_form', :object => EventImage.new
  		end
	end
end

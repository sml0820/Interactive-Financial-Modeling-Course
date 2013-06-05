module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = 'Ruby on Rails finance institute'
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
		  render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end
	#Returns the Gravatar for the given user.
	def gravatar_for(user, options = { size: 50})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end


end


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
    link_to(name, '#', class: "btn btn-success btn-mini add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
	#Returns the Gravatar for the given user.
	def gravatar_for(user, options = { size: 50})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	#imported methods

  def icons
    File.readlines('icons.txt')
  end

  def extra_button_styles(with = nil)
    %w(large small mini)
  end

  def button_styles
    %w(normal large small mini)
  end

  def button_colors
    %w(default red blue green gray black lightblue gold sea brown)
  end

  def random_numbers(count, from=3, to=30)
    count.times.map{ from + Random.rand(to-from) }
  end

  def random_string(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    password = ''
    length.times { password << chars[rand(chars.size)] }
    password
  end

  def current_link
    # root_path = "/"
    current_route = request.url.split("/") # pages/dashboard/stats.html -> ['dashboard', 'stats.html']
    return current_route.compact.first, current_route.compact.split(".").first
  end

  def link_level
    primary, secondary = current_link
    if menu[primary.to_sym][:items].keys.count > 1
      return 2
    else
      return 1
    end
  end

  def nav_collapse(options = {})
    @primary, @secondary = current_link
    return "collapsed" unless options[:primary] == @primary
  end

  def nav_active(options = {})
    @primary, @secondary = current_link

    if options[:primary]
      return "active" if options[:primary] == @primary
    end

    if options[:secondary]
      return "active" if options[:secondary] == @secondary
    end
  end

  def menu
    return {
        dashboard: {
            primary: { link: "dashboard", icon: "icon-dashboard", label: "Dashboard" },
            items: {
                dashboard: { icon: "icon-dashboard", label: "Dashboard" }
            }
        },
        ui_lab: {
            primary: { link: "buttons", icon: "icon-beaker", label: "UI Lab" },
            items: {
                buttons: { icon: "icon-hand-up",       label: "Buttons" },
                general: { icon: "icon-beaker",        label: "General elements" },
                icons:   { icon: "icon-info-sign",     label: "Icons"},
                grid:    { icon: "icon-th-large",      label: "Grid"},
                tables:  { icon: "icon-table",         label: "Tables"},
                widgets: { icon: "icon-plus-sign-alt", label: "Widgets"},
            }
        },
        forms: {
            primary: { link: "forms", icon: "icon-edit", label: "Forms" },
            items: {
                forms: { icon: "icon-edit", label: "Form Elements" }
            }
        },
        charts: {
            primary: { link: "charts", icon: "icon-bar-chart", label: "Charts"},
            items: {
                charts: { icon: "icon-bar-chart", label: "Charts"}
            }
        },
        other: {
            primary: { link: "wizard", icon: "icon-link", label: "Others"},
            items: {
                wizard: { icon: "icon-magic", label: "Wizard" },
                login: { icon: "icon-user", label: "Login Page" },
                sign_up: { icon: "icon-user", label: "Sign Up Page" },
                full_calendar: { icon: "icon-calendar", label: "Full Calendar" },
                error404: { icon: "icon-ban-circle", label: "Error 404 page" },
            }
        }
    }
  end

def crumbs
  primary, secondary = current_link
  return {
    primary: { icon: ( menu[primary.to_sym][:primary][:icon] rescue nil ),
               label: ( menu[primary.to_sym][:primary][:label] rescue nil )},
    secondary:
      { icon: ( menu[primary.to_sym][:items][secondary.to_sym][:icon] rescue nil ),
        label: ( menu[primary.to_sym][:items][secondary.to_sym][:label] rescue nil )
      }
    }
end



end


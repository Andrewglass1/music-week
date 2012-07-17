module SignupsHelper

	def signup_or_holder(date)
		signup = Signup.all.find {|signup| signup.date == date}
		if signup
	  	image_tag(signup.album.art, :class => "album").html_safe
	  else
	  	"Nothing on this day #{link_to("signup for an album", albums_path)}".html_safe
		end
	end

end

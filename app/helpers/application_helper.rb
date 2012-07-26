module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def todays_album_link
  	if current_user
  		album = current_user.signups.find_by_date(Date.today).album
  		link_to("Today's Album", album_path(album)).html_safe if album
  	end
  end

  def todays_album_or_nil
    if current_user
      todays_signup = current_user.signups.find_by_date(Date.today)
      todays_signup.album if todays_signup
    end
  end
end

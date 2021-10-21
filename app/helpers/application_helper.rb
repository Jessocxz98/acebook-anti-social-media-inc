module ApplicationHelper

  def avatar_display(user, size)
    if user.avatar.attached?
	    image_tag user.avatar, style: "width: #{size}px; height: #{size}px; display: block; border-radius: 50%"
    else
      show_svg('default_avatar.svg')
    end
  end

  def show_svg(path)
    File.open("app/assets/images/svg/#{path}", "rb") do |file|
      raw file.read
    end
  end
end

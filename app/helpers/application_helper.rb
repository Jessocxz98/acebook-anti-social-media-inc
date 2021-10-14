module ApplicationHelper

  def avatar_display(size)
    if current_user
      if current_user.avatar.attached?
	      image_tag current_user.avatar, style: "width: #{size}px; display: block"
      else
        image_tag "/app/assets/images/svg/default_avatar.svg", style: "width: #{size}px; display: block"
      end
    end
  end

  def show_svg(path)
    File.open("app/assets/images/svg/#{path}", "rb") do |file|
      raw file.read
    end
  end
end

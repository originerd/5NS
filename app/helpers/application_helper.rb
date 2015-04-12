module ApplicationHelper

    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "5NS"
    if page_title.empty?
      base_title
    else
      "#{base_title} :: #{page_title}"
    end
  end

  # Returns the Gravatar for the given user.
  def avatar_for(user, options = { type: 'rounded' })
    if user.avatar.present?
      url = user.avatar.url
    else
      url = 'default_avatar.png'
    end
    image_tag(url, alt: user.name, class: "img-responsive img-#{options[:type]}")
  end

  # Replace devise's alert name to bootstrap's
  def bootstrap_class_for(flash_name)
    case flash_name
    when 'notice' then 'success'
    when 'alert'  then 'danger'
    else flash_name
    end
  end
end

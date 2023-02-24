module ApplicationHelper

  def page_title(separator = " – ")
    [content_for(:title), t("application")].compact.join(separator)
  end

  def page_heading(title, additional_classes=nil)
    content_for(:title){ title }
    content_tag(:h1, title, class: additional_classes)
  end

  def get_locale_flag(locale)
    case locale
    when :en
      return "🇺🇸" # US Flag
    when :de
      return "🇩🇪" # DE Flag
    else
      return "-"
    end
  end

  def format_time(time)
    return "–" if time.nil?

    if time > 1.days.ago
      return t("time.ago", time: distance_of_time_in_words_to_now(time))
    end

    l(time, :format => :long)
  end

  def pagination(path_name = nil)
    unless path_name
      path_name = "#{controller_name}_path"
    end
    render("application/pagination", path_name: path_name)
  end

  def is_admin_user
    user_signed_in? and current_user.admin == true
  end
end

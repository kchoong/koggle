module ApplicationHelper

  def get_locale_flag(locale)
    case locale
    when :en
      return "🇺🇸"
    when :de
      return "🇩🇪"
    else
      return "-"
    end
  end

  def format_time(t)
    return "–" if t.nil?

    d = Time.new - t
    if d > 0 && d < 60
      t("application.time.format.seconds_ago", seconds: d.to_i)
    elsif d > 0 && d < 3600
      t("application.time.format.minutes_ago", minutes: (d / 60).to_i)
    else
      I18n.l(t)
    end
  end

end

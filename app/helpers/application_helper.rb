module ApplicationHelper

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

end

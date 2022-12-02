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

end

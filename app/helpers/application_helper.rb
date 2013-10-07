module ApplicationHelper

  # Returns the full title on a per-page basis.
  def title(page_title)
    base_title = "Sky Memories"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def locale_name(locale)
    LOCALE_NAMES[locale]
  end

  def localized_page?
    params[:controller] == 'pages'
  end

  def locale_menu
    raw LOCALE_NAMES.map { |locale, locale_name|
      content_tag :li, class: locale_class(locale) do
        link_to locale_name, "#{locale}"
      end 
    }.join
  end

  private

    def locale_class locale
      "active" if I18n.locale == locale.to_sym
    end

end

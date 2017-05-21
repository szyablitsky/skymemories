# frozen_string_literal: true

module ApplicationHelper
  def title(page_title)
    base_title = 'Maevsky Pictures'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def localized_page?
    params[:controller] == 'pages'
  end

  def locale_menu
    raw LOCALE_NAMES.map do |locale, locale_name|
      content_tag :li, class: locale_class(locale) do
        link_to locale_name, locale: (locale == 'ru' ? nil : locale)
      end
    end.join
  end

  def flash_decode(name)
    'alert-' +
      case name
      when 'error' then 'danger'
      when 'notice' then 'info'
      else name.to_s
      end
  end

  private

  def locale_class(locale)
    'active' if I18n.locale == locale.to_sym
  end
end

class LocaleHelper

  def self.ensure_locale(locale)
    LOCALE_NAMES.has_key? locale ? locale : 'ru'
    end
  end

  def self.locale_name(locale)
    LOCALE_NAMES[locale]
  end

end
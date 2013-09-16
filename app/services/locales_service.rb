class LocalesService

  def self.get_locale_from params
    locale = params[:locale] || 'ru'
    LOCALES.include?(locale) ? locale : 'ru'
  end

end
class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params

  protect_from_forgery with: :exception

  include SessionsHelper

  protected

  def set_i18n_locale_from_params
    if params[:locale]
      if LOCALES.include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
          "Translation not available for #{params[:locale]} locale"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    I18n.locale == :ru ? {} : { locale: I18n.locale }
  end
end

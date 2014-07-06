class MessagesController < ApplicationController

  def create
    if /<a( )+href/ =~ message_params[:message]
      # flash[:error] = t('flash.message.error')
      @message = t('flash.message.error')
      @type = 'danger'
    else
      MessageNotifier.msg(message_params).deliver
      # flash[:success] = t('flash.message.success')
      @message = t('flash.message.success')
      @type = 'success'
    end
    # redirect_to contact_url
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end

end

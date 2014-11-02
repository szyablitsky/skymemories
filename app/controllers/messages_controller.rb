class MessagesController < ApplicationController
  respond_to :js  

  def create
    if /<a( )+href/ =~ message_params[:message]
      @message = t('flash.message.error')
      @type = 'danger'
    else
      MessageNotifier.msg(message_params).deliver
      @message = t('flash.message.success')
      @type = 'success'
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end

end

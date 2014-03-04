class MessagesController < ApplicationController

  def create
    if /<a( )+href/ =~ message_params[:message]
      flash[:error] = t('flash.message.error')
    else
      MessageNotifier.msg(message_params).deliver
      flash[:success] = t('flash.message.success')
    end
    redirect_to contact_url
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end

end

class MessagesController < ApplicationController

  def create
    MessageNotifier.msg(message_params).deliver
    flash[:success] = t('flash.message.success')
    redirect_to contact_url
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end

end

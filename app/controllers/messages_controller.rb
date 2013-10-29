class MessagesController < ApplicationController

  def create
    flash[:success] = 'Your message was sucessfuly sent.'
    redirect_to contact_url
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end

end

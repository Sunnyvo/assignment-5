class MessagesController < ApplicationController
  def inbox
    @messages = current_user.received_messages
  end

  def sent
     @messages = current_user.sent_messages
  end

  def index
    redirect_to inbox_messages_path
  end

  def create
    @message  = current_user.sent_messages.build message_params
    if @message.save
      redirect_to sent_messages_path
    else
      render "new"
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
    end
  end

  def new
    @message = Message.new
  end
  def message_params
    params.require(:message).permit(:receiver_id, :body)
  end
end

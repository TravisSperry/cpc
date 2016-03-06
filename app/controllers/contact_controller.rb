class ContactController < ApplicationController
	def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      NotificationMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent. We will respond shortly.")
    else
      flash.now.alert = "Double check your email."
      render :new
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def message_params
      params.require(:message).permit(:name, :email, :subject, :body, :phone)
    end
end

class ContactController < ApplicationController
	def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent. We will respond shortly.")
    else
      flash.now.alert = "Double check your email."
      render :new
    end
  end
end
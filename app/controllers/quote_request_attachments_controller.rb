class QuoteRequestAttachmentsController < ApplicationController
  before_action :set_quote_request_attachment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quote_request_attachments = QuoteRequestAttachment.all
    respond_with(@quote_request_attachments)
  end

  def show
    respond_with(@quote_request_attachment)
  end

  def new
    @quote_request_attachment = QuoteRequestAttachment.new
    respond_with(@quote_request_attachment)
  end

  def edit
  end

  def create
    @quote_request_attachment = QuoteRequestAttachment.new(quote_request_attachment_params)
    @quote_request_attachment.save
    respond_with(@quote_request_attachment)
  end

  def update
    @quote_request_attachment.update(quote_request_attachment_params)
    respond_with(@quote_request_attachment)
  end

  def destroy
    @quote_request_attachment.destroy
    respond_with(@quote_request_attachment)
  end

  private
    def set_quote_request_attachment
      @quote_request_attachment = QuoteRequestAttachment.find(params[:id])
    end

    def quote_request_attachment_params
      params.require(:quote_request_attachment).permit(:quote_request_id, :attachment)
    end
end

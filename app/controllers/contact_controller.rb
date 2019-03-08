class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Contact object for cleared form
        @contact = Contact.new
        format.html { render 'index' }
        format.js { flash.now[:success] = @message = 'Thank you for your message. We will get back to you soon!' }
      else
        format.html { render 'index' }
        format.js { flash.now[:error] }
      end
    end
  end
end

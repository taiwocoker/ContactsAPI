class Api::V1::ContactsController < ApplicationController
  def index
   @contacts = Contact.all
   render json: @contacts
  end

  def create
   @contact = Contact.new(contact_params)
    if @contact.save
     render json: @contact
    else
     render error: {error: "Unable to create Contact."}, status: 400
    end
  end

  def update
   @contact = Contact.find(params[:id])
   if @contact
    @contact.update(contact_params)
    render json: {message: "Contact successfully updated."}, status: 200
   else
    render json: {error: "Unable to update Contact."}, status: 400
   end
  end

  def destroy
   @contact = Contact.find(params[:id])
   if @contact
    @contact.destroy
    render json: {message: "Contact successfully deleted."}, status: 200
   else
    render json: {error: "Unable to delete Contact."}, status: 400
   end
  end

  private
  def contact_params
   params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
  end
end

class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :versions]
  def index
   @contacts = Contact.all
   render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
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

  def versions
    @versions = @contact.versions
    render json: @versions
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

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
   params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
  end
end

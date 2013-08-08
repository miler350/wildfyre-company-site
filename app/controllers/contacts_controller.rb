class ContactsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @contacts = current_user.contacts
  end
  
  def new
    @contact = current_user.contacts.build
    
  end
  
  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
  		
      flash[:notice] = "#{@contact.contact_first_name} been added to contacts."
  		redirect_to contacts_path
      
  	else
      
  		flash[:alert] = "Contact has not been created."
  		render 'new'
    end
    
  end
  
  def show
    @contact = current_user.contacts.find(params[:id])
  end
  
  def edit
    @contact = current_user.contacts.find(params[:id])
  end
  
  def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update_attributes(contact_params)
  		
      flash[:notice] = "#{@contact.contact_first_name} been updated."
  		redirect_to contacts_path
      
  	else
      
  		flash[:alert] = "Contact has not been updated."
  		render 'edit'
    end
  end
  
  def destroy
    @contact = current_user.contacts.find(params[:id]).destroy
    redirect_to contacts_path
   flash[:notice]= "#{@contact.contact_first_name} has been deleted."
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:contact_first_name, :contact_middle_name, :contact_last_name, :contact_company, :contact_title,  :contact_personal_email, :contact_work_email,:contact_cell_phone, :contact_work_phone, :contact_website, :contact_street_address, :contact_city, :contact_state,:contact_zip, :contact_country, :contact_linkedin, :contact_twitter, :contact_facebook, :contact_undergrad, :contact_undergrad_degree, :contact_grad, :contact_grad_degree, :contact_birthday, :contact_married, :contact_kids)
  end
  
end

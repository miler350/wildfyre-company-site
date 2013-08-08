class AddFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_first_name, :string
    add_column :contacts, :contact_middle_name, :string
    add_column :contacts, :contact_last_name, :string
    add_column :contacts, :contact_company, :string
    add_column :contacts, :contact_title, :string
    add_column :contacts, :contact_personal_email, :string
    add_column :contacts, :contact_work_email, :string
    add_column :contacts, :contact_cell_phone, :string
    add_column :contacts, :contact_work_phone, :string
    add_column :contacts, :contact_website, :string
    add_column :contacts, :contact_street_address, :string
    add_column :contacts, :contact_city, :string
    add_column :contacts, :contact_state, :string
    add_column :contacts, :contact_zip, :string
    add_column :contacts, :contact_country, :string
    add_column :contacts, :contact_linkedin, :string
    add_column :contacts, :contact_twitter, :string
    add_column :contacts, :contact_facebook, :string
    add_column :contacts, :contact_undergrad, :string
    add_column :contacts, :contact_undergrad_degree, :string
    add_column :contacts, :contact_grad, :string
    add_column :contacts, :contact_grad_degree, :string
    add_column :contacts, :contact_birthday, :date
    add_column :contacts, :contact_married, :integer
    add_column :contacts, :contact_kids, :integer
  end
end

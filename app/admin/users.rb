ActiveAdmin.register User do

	index do 
		column :id
		column :name
		column :email
		column :created_at
		column :last_sign_in_at
		default_actions
	end
  
end

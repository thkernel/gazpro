# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback

unless Role.all.present?
    roles = Role.create(
        [
            {name: "Superuser"},
            {name: "Administrateur"},
            {name: "Superviseur"},
            {name: "Gérant"},
            {name: "Caissier"},
            {name: "Agent"},
            {name: "Livreur"},
            {name: "Client"},
            
             
        ])
else
    roles = Role.all

end


# Users
unless User.all.present?
	users = User.create([
	    {
	        first_name: "Amos", 
	        last_name: "DEMBELE",
	    },
	    {
	        first_name: "Admin", 
	        last_name: "Admin",
	    },
        {
            first_name: "LMK", 
            last_name: "LMK",
        }
	    
	])
else
    users = User.all
end


# Accounts
unless Account.all.present?
    accounts = Account.create([
        {accountable: users[0], login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "Superuser").id},
        {accountable: users[1], login: "admin",  email: "admin@gmail.com",  password: "Root@2023", password_confirmation: "Root@2023", role_id: Role.find_by(name: "Superuser").id},
        {accountable: users[2], login: "lmk",  email: "lmk@gmail.com",  password: "Lmk@2024", password_confirmation: "Lmk@2024", role_id: Role.find_by(name: "Superuser").id}
    ])

else
    accounts = Account.all
end


# Currencies
unless Currency.all.present?
    currencies = Currency.create(
        [
            {name: "Euro", iso_code: "EUR", symbol_position: "Gauche", account_id: accounts.first.id},
            {name: "Dollar US", iso_code: "USD", symbol_position: "Gauche", account_id: accounts.first.id},
            {name: "Franc CFA", iso_code: "XOF", symbol_position: "Droite", account_id: accounts.first.id},
            
            
        ])
else    
    currencies =  Currency.all

end






#Countries
unless Country.all.present?
    countries = Country.create([
        {
            name: "Mali", 
            account_id: accounts.first.id,   
        },
        {
            name: "Turquie", 
            account_id: accounts.first.id,   
        },
        {
            name: "France", 
            account_id: accounts.first.id,   
        },
        {
            name: "Sénégal", 
            account_id: accounts.first.id,   
        },
        {
            name: "Nigeria", 
            account_id: accounts.first.id,   
        },
        {
            name: "Togo", 
            account_id: accounts.first.id,   
        },
        {
            name: "Ghana", 
            account_id: accounts.first.id,   
        }
        

    ])
else  
    countries = Country.all

end

# Unities
unless Unity.all.present?
    unities = Unity.create([
        {
            name: "KILOGRAMME",
            unity_symbol: "Kg", 
            account_id: accounts.first.id,   
        },
        {
            name: "LITRE",
            unity_symbol: "l", 
            account_id: accounts.first.id,   
        },
        {
            name: "Mètre-cube",
            unity_symbol: "m3", 
            account_id: accounts.first.id,   
        },
        {
            name: "Tonne",
            unity_symbol: "T", 
            account_id: accounts.first.id,   
        },

    ])
else  
    unities = Unity.all

end

# Product categories
unless ProductCategory.all.present?
    product_categories = ProductCategory.create([
        {
            name: "GAZ",
            account_id: accounts.first.id,   
        },
        
        

    ])
else  
    product_categories = ProductCategory.all

end
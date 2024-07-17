
Rails.application.routes.draw do
  resources :unities do
    get "delete"
  end
  resources :orders do
    get "delete"
  end
  resources :productions do
    get "delete"
  end
  resources :stock_entries do
    get "delete"
  end
  resources :tanks do
    get "delete"
  end
  resources :products do
    get "delete"
  end

  resources :product_categories, path: 'product-categories' do
    get "delete"
  end

  resources :customers do
    get "delete"
  end
  resources :providers do
    get "delete"
  end


  
  resources :sending_parcel_items
  resources :parcel_collections do   
    get "delete"
  end

  resources :sending_parcels do   
    get "delete"
  end
  
  resources :tenants do   
    get "delete"
  end


  resources :countries do 
    get "delete"
  end
  resources :transfer_reasons, path: "transfer-reasons" do 
    get "delete"
  end
  resources :companies do 
    get "delete"
  end
  resources :withdrawals do 
    get "delete"
  end

  resources :identity_document_types, path: "identity-document-types" do 
    get "delete"
  end
  
  get "transfers/show/:uid" => "transfers#show",as: :show_transfer
  get "sending-parcels/show/:uid" => "sending_parcels#show",as: :show_sending_parcel

  get "transfers/download/:uid" => "transfers#download",as: :download_slip
  get "sending-parcels/download/:uid" => "sending_parcels#download",as: :download_sending_parcel

  get "/transfers/cancel/:uid" => "transfers#get_cancel", as: :get_cancel_transfer
  post "/transfers/cancel/:uid" => "transfers#post_cancel", as: :post_cancel_transfer

  get "sending_parcels/cancel/:uid" => "sending_parcels#get_cancel", as: :get_cancel_sending_parcel
  post "sending_parcels/cancel/:uid" => "sending_parcels#post_cancel", as: :post_cancel_sending_parcel

  resources :transfers do 
    get "delete"
  end

  resources :currencies do 
    get "delete"
  end

  #root to: "front#home"
   get "/dashboard" => "dashboard#index", as: :dashboard

  get 'histories/orders' => 'search#search_orders', as: :history_orders 
  get 'histories/productions' => 'search#search_productions', as: :history_productions
  get 'histories/stock-entries' => 'search#search_stock_entries', as: :history_stock_entries
  

  get 'balance-sheet/profits' => 'search#search_profits', as: :balance_sheet_profits 
  get 'balance-sheet/expenses' => 'search#search_expenses', as: :balance_sheet_expenses 

  get 'search/transfers' => 'transfers#search', as: :search_transfers 
  get 'search/sending_parcels' => 'sending_parcels#search', as: :search_sending_parcels 
  

  get "/accounts"     => "custom_accounts#index", as: :all_accounts 
  post "/accounts/new"     => "custom_accounts#create", as: :create_account
  get "/accounts/new"     => "custom_accounts#new", as: :new_account
  get "/account/edit/:uid" => "custom_accounts#edit", as: :edit_account
  patch "/account/update/:uid" => "custom_accounts#update", as: :udapte_account
  get "/account/update/:uid" => "custom_accounts#update", as: :update_account
  delete "/account/destroy/:uid" => "custom_accounts#destroy", as: :destroy_account
  get "/account/delete/:uid" => "custom_accounts#delete", as: :delete_account
  get "/companies/:uid" => "companies#show", as: :show_company

  get "/account/enable/:uid" => "custom_accounts#get_enable", as: :get_enable_account
  post "/user/enable/:uid" => "custom_accounts#post_enable", as: :post_enable_account

  get "/user/disable/:uid" => "custom_accounts#get_disable", as: :get_disable_account
  post "/user/disable/:uid" => "custom_accounts#post_disable", as: :post_disable_account
 
  
 
  resources :features do 
    get "delete"
  end

  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles do 
    get "delete"
  end


  devise_for :accounts, path: '', controllers: { 
    registrations: "accounts/registrations",
    confirmations: 'accounts/confirmations',
    passwords: "accounts/passwords",
    sessions: "accounts/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
  }

  devise_scope :account do
    root to: 'accounts/sessions#new'
    
    authenticated :account do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'accounts/sessions#new', as: :unauthenticated_root
    end
  end

  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"



end

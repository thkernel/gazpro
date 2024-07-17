class SearchController < ApplicationController

  before_action :authenticate_account!


  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  
  def search_orders
    @accounts = Account.all
    @customers = Customer.all


    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    account = params[:account] if params[:account].present?
    
    customer = params[:customer] if params[:customer].present?
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    puts "ACCOUNT: #{account}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_account = account if account.present?
    @selected_customer = customer if customer.present?

    @orders = Order.search_by_customer(start_date, end_date, customer).where.not(status: "Annulée")#.where(social_case: false)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?



   

    @total_b3_entry = @orders.sum("entry_b3")
    @total_b6_entry = @orders.sum("entry_b6")
    @total_b12_entry = @orders.sum("entry_b12")
    @total_b32_entry = @orders.sum("entry_b32")
    @total_b38_entry = @orders.sum("entry_b38")

    @total_b3_out = @orders.sum("out_b3")
    @total_b6_out = @orders.sum("out_b6")
    @total_b12_out = @orders.sum("out_b12")
    @total_b32_out = @orders.sum("out_b32")
    @total_b38_out = @orders.sum("out_b38")

    @total_tonnage = @orders.sum("total_tonnage")

    

  end

  def search_productions
    @accounts = Account.all
    


    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    account = params[:account] if params[:account].present?
    
    
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    puts "ACCOUNT: #{account}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_account = account if account.present?
    

    @productions = Production.search_by_customer(start_date, end_date)#.where.not(status: "Annulée")#.where(social_case: false)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?



   @total_quantity = @productions.sum("quantity")

    @total_b3_number = @productions.sum("b3_number")
    @total_b3_tonnage = @productions.sum("b3_tonnage")

    @total_b6_number = @productions.sum("b6_number")
    @total_b6_tonnage = @productions.sum("b6_tonnage")

    @total_b12_number = @productions.sum("b12_number")
    @total_b12_tonnage = @productions.sum("b12_tonnage")

    @total_b32_number = @productions.sum("b32_number")
    @total_b32_tonnage = @productions.sum("b32_tonnage")

    @total_b38_number = @productions.sum("b38_number")
    @total_b38_tonnage = @productions.sum("b38_tonnage")

    
    
    

    @total_tonnage = @productions.sum("total_tonnage")

    

  end




 def search_stock_entries
    @accounts = Account.all
    @products = Product.all


    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    account = params[:account] if params[:account].present?
    
    product = params[:product] if params[:product].present?
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    puts "ACCOUNT: #{account}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_account = account if account.present?
    @selected_product = product if product.present?

    @stock_entries = StockEntry.search_by_customer(start_date, end_date, product)#.where.not(status: "Annulée")#.where(social_case: false)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?



   

   

    @total_quantity = @stock_entries.sum("quantity")

    

  end
  

  
end



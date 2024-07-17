class DashboardController < ApplicationController
	before_action :authenticate_account!
	layout("dashboard")
	
	def index
		
		product = Product.find_by(name: "GAZ")

		@current_stock = product.current_stock if product.present?
		@total_productions = Production.sum("total_tonnage")
		@total_orders = Order.count

		orders = Order.all
		@order_chart = orders.unscope(:order).group('(EXTRACT(YEAR FROM created_at))').group('(EXTRACT(MONTH FROM created_at))').count
		
		
		@latest_orders = Order.reorder(created_at: :desc).last(6)
		@latest_productions = Production.reorder(created_at: :desc).last(6)
	end
	
	def show
	end
end
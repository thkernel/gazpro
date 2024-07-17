module ApplicationHelper

	def food_thumbnail(food)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if food.thumbnail.attached?
			#image_tag product.thumbnail.variant(resize: "308x205")
			image_tag food.thumbnail.variant(combine_options: {resize: "308x205^",  gravity: 'Center', crop: '308x205+0+0' })
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end

	def food_cover_thumbnail(food)
		#image = path_to_image('imofy.png')
		#mini_image = MiniMagick::Image.new(image)
        if food.thumbnail.attached?
            image_tag food.thumbnail.variant(resize: "700x400")
        else
            image_tag 'thumbnails/post-missing.jpg'
        end
	end


	def current_shopping_cart
        session[:shopping_cart]
	end
	
	def cart_items_count
		#shopping_cart = Cart.find(current_shopping_cart.id)
		@shopping_cart.cart_items.count
	  end

	

	

	def unconfirmed_order?(order)
		

		if order.status == "En attente"
			true 
		else
			false
		
		end
	end

	def current_company
	
		company = Company.take
		if company.present?
			company
		end
		
	end
	def is_account_locked?(account)
		if account.access_locked?
			true
		else
			false
		end
	end

	

	def devise_title(controller)
		if controller == "sessions"
			t(:login)
		elsif controller == "registrations"
			t('sign_up')

		elsif controller == "admin_setup"
			t(:admin_setup)
		end
	end

	def application_page_title(controller, action)
		if controller == "home" && action == "index"
			t(:application_home_page)
		end
	end

	

	def get_account(acount_id)
		account = Account.find(user_id)
	end

	def unreaded_notification?(notification)
		if notification.readed_at.present?
			false
		else
			true
		end
	end


	
	

	
	def user_notifications
		current_account.recipient_notifications.order(created_at: 'DESC').take(5)
	end

	


	

	def configs?
		configs = SmtpServerSetting.take

		if configs.present? 
			true
		else
			false
		end
	end

	def smtp_config?
		config = SmtpServerSetting.take

		if config.present? && config.user_name.present? &&  config.user_password.present? && 
			config.address.present? && config.port
		
			true 
		else
			false
		end
	end

	def unconfirmed_transfer?(transfer)
		

		if transfer.status == "Actif"
			true 
		else
			false
		
		end
	end

	def transfer_was_withdrawal?(transfer)
		

		if transfer.status == "Retiré"
			true 
		else
			false
		
		end
	end

	def sending_parcel_was_withdrawal?(sending_parcel)
		if sending_parcel.status == "Retiré"
			true 
		else
			false
		
		end
	end


	def unconfirmed_sending_parcel?(sending_parcel)
		

		if sending_parcel.status == "Déposé"
			true 
		else
			false
		
		end
	end

	def current?(key, path)
		"#{key}" if current_page? path
		# We use string interpolation "#{key}" here to access the CSS classes we are going to create.
	end

	

	
end

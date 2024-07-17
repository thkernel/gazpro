module StockExitValidator
    class StockReduceValidator < ActiveModel::Validator
  
        def validate(record)

            
            #puts "IMPUTABLE TYPE: #{record.imputable_type}"

            if record.new_record?
                
                



                    product = Product.find_by(name: "GAZ")
                    quantity = ((record.out_b3 * 2.75)/1000) + ((record.out_b6 * 6) / 1000)  + ((record.out_b12 * 12.5)/1000) + ((record.out_b32 * 32)/1000) + ((record.out_b38 * 38)/1000)

                    quantity = quantity.to_f
                    
                    if product.present? && quantity > 0.0  
                        
                        
                        if product.current_stock.present? && product.current_stock >= quantity
                           
                            current_stock = product.current_stock - quantity
                           
                            product.update_column(:current_stock, current_stock);
                        else
                           
                            record.errors.add(:order,"- Le stock est insuffisant.")
                        end

                        
                    end
               
            end
    
            #puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end


    
end
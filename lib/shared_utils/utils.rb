require 'fileutils'

module SharedUtils

    # For model
    module Model
        
        def before_save_hook
            self.status = "Enable"
        end
        def generate_random_id
            self.identifier = SecureRandom.hex(32)
           
        end 
    end

    module AppLogger
        def cron_logger
            @@cron_logger ||= Logger.new("#{Rails.root}/log/cron-log.log")
        end

        
    
    end

    # For model
    module Generate
        
        def generate_random_number_uid
            current_record = self
          
            if current_record.present?
                unless current_record.uid.present? 
                    begin
                        current_record.uid = SecureRandom.random_number(100_000_000_000)
                    end while current_record.class.where(uid: current_record.uid).exists?
                end
            end
        end

        def generate_hex_uid
            current_record = self
          
            if current_record.present?
                unless current_record.uid.present? 
                    begin
                        current_record.uid = SecureRandom.hex(32)
                    end while current_record.class.where(uid: current_record.uid).exists?
                end
            end
        end

        def generate_random_mtcn
            current_record = self
          
            if current_record.present?
                unless current_record.mtcn.present? 
                    begin
                        current_record.mtcn = SecureRandom.random_number(10_000_000_000)
                    end while current_record.class.where(mtcn: current_record.mtcn).exists?
                end
            end
        end

        def generate_random_withdrawal_code
            current_record = self
          
            if current_record.present?
                unless current_record.withdrawal_code.present? 
                    begin
                        current_record.withdrawal_code = SecureRandom.hex(6)
                    end while current_record.class.where(withdrawal_code: current_record.withdrawal_code).exists?
                end
            end
        end

        
    end

    module  Folder

        # Create a folder

        def create_folder(folder)
            unless File.exists?(folder) 
                #Dir.mkdir(folder)
                FileUtils.mkdir_p(folder)

            else
                puts "Folder exist!"
            end
        end

        
    end


end


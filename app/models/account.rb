# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  accountable_type       :string
#  accountable_id         :bigint
#  role_id                :bigint           not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Account < ApplicationRecord
  include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :lockable


  # Relationships
  belongs_to :accountable, polymorphic: true, optional: true

  belongs_to :role

  has_many :transfers, dependent: :destroy#, optional: true
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :currencies, dependent: :destroy
  has_many :countries, dependent: :destroy
  has_many :unities, dependent: :destroy
  has_many :productions, dependent: :destroy
  has_many :tanks, dependent: :destroy
  has_many :stock_entries, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :providers,  dependent: :destroy

  
  

  # Add nested attributes for profile.
  #accepts_nested_attributes_for :profile
  
  
  # Change default params ID to uid
  def to_param
    uid
  end

  def superuser?
    if self.role.name == "Superuser"
      true 
    else
      false
    end
  end

  def superviseur?
    if self.role.name == "Superviseur"
      true 
    else
      false
    end
  end

  def user?
    if self.role.name == "user"
      true 
    else
      false
    end
  end

  def admin?
    if self.role.name == "Administrateur"
      true 
    else
      false
    end
  end

  def customer?
    if self.role.name == "Client"
      true 
    else
      false
    end
  end

  def agent?
    if self.role.name == "Agent"
      true 
    else
      false
    end
  end

  def gerant?
    if self.role.name == "Gérant"
      true 
    else
      false
    end
  end

  def cassier?
    if self.role.name == "Caissier"
      true 
    else
      false
    end
  end


  


end

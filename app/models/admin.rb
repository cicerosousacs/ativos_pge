class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :password, length: { in: 8..12 }
  #validates :password_confirmation, length: { in: 8..12 }
  
  def check_status
    { true => "Ativo", false => "Inativo" }.fetch(status)
  end


end

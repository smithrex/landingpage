class User < ApplicationRecord
  after_save :enlazar_a_cliente 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  def enlazar_a_cliente
    cl = Cliente.where(user_id: self.id).first
    if cl.blank?
      cl = Cliente.new
      cl.user_id = self.id
      cl.nombres = "---"
      cl.apell_pat = "---"
      cl.apell_mat = "---"
      cl.nif = "---"
      cl.save
    end
  end
end

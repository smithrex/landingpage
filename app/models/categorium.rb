class Categorium < ApplicationRecord
  validates :nombre, 
  :imagen, presence:true

  validates :nombre, 
  length: {minimum:3, maximum: 50}

  validates :nombre,
    uniqueness: true
    
  def nproductos
    return Producto
    .where(categorium_id: self.id)
    .count
  end  
end

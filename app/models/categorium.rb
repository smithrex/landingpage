class Categorium < ApplicationRecord
  def nproductos
    return Producto
    .where(categorium_id: self.id)
    .count
  end  
end

class Orden < ApplicationRecord
  belongs_to :cliente
  has_many :orden_producto
  has_many :orden_entrega

  def get_total 
    t = 0
    self.orden_producto.each do |u| 
      t = t + (u.precio * u.cantidad)
    end
    return t
  end
  
  def proceso_text
    if self.proceso.year == 2016 and 
      self.proceso.month == 10 and
      self.proceso.day == 30
      return "---"
    else
      return self.proceso
    end
  end

  def entrega_text
    if self.entrega.year == 2016 and 
      self.entrega.month == 10 and
      self.entrega.day == 30
      return "---"
    else
      return self.entrega
    end
  end

  def cierre_text
    if self.cierre.year == 2016 and 
      self.cierre.month == 10 and
      self.cierre.day == 30
      return "---"
    else
      return self.cierre
    end
  end

end

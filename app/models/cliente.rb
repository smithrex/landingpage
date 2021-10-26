class Cliente < ApplicationRecord
  has_many :orden
  def full_name
    return "#{self.nombres} #{self.apell_pat} #{self.apell_mat}"
  end
end

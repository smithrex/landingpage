class Cliente < ApplicationRecord
  has_many :ordens
  def full_name
    return "#{self.nombres} #{self.apell_pat} #{self.apell_mat}"
  end
end

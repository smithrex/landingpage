class Cliente < ApplicationRecord
  has_many :ordens
  belongs_to :user
  
  def full_name
    return "#{self.nombres} #{self.apell_pat} #{self.apell_mat}"
  end
end

class RolUsuario < ApplicationRecord
  belongs_to :user
  belongs_to :rol
end

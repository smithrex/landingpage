class Producto < ApplicationRecord
  belongs_to :categorium
  
  validates :nombre, 
  :descripcion, :imagen, presence: { message: "Este campo es requerido."}

  validates :nombre, 
  uniqueness: { message: "ya ha sido utilizado. Escriba otro."}

   validates :nombre, 
  length: { minimum: 4, maximum: 100, 
  message: "el nombre debe estar entre 4 y 100 caracteres"}

  validates :descripcion, 
  length: { minimum:15, maximum: 200,
  message: "la descripcion debe estar entre 15 y 200 caracteres"}

 
  
end

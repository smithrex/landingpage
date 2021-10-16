class OrdenProyecto < ApplicationRecord
  belongs_to :orden
  belongs_to :proyecto
end

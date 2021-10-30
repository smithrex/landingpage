class LandpageController < ApplicationController
  
  layout "admin", only: [:users, :users_show, :users_edit, :users_destroy]
  
  def index
  end
  def users
    @usuarios = User.all
  end
  
  def users_show
    @roles = Rol.all
  end

  def users_edit
  end

  def users_destroy
  end

end

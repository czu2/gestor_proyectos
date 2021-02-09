class PagesController < ApplicationController
  http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :dashboard

  def new
    @proyecto = Proyecto.new
  end

  def index
    if params[:q]
      @proyectos = Proyecto.where('nombre LIKE ?', "%#{params[:q]}%")
    else
      @proyectos = Proyecto.all.order(fecha_comienzo: :desc)
    end
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)
    @proyecto.save
    redirect_to pages_index_path
  end

  private
    # Oculta los atributos del modelo y evita su modificación (Strong Params)
    def proyecto_params
        params.require(:proyecto).permit(:nombre, :descripcion)
    end
end

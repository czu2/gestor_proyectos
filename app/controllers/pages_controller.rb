class PagesController < ApplicationController
  http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :new

  def index
    if params[:q]
      @proyectos = Proyecto.where('estado LIKE ?', "%#{params[:q]}%")
    else
      @proyectos = Proyecto.all.order(created_at: :desc)
    end
  end

  def create
    @proyectos = proyecto_params()
    @proyectos.save
    redirect_to root_path, notice: '¡Proyecto creado exitosamente!'
  end

  def new
    @proyecto = Proyecto.new
  end
  
  private
    # Oculta los atributos del modelo y evita su modificación (Strong Params)
    def proyecto_params
      Proyecto.new(nombre: params[:nombre], descripcion: params[:descripcion], fecha_comienzo: params[:fecha_comienzo], fecha_termino: params[:fecha_termino], estado: params[:estado])
    end
end

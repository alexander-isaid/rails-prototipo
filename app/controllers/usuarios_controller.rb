  class UsuariosController < ApplicationController
    before_action :set_usuario, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user! 
  
    # GET /usuarios
    def index
      @q = Usuario.ransack(params[:q])
      @usuarios =  @q.result.order(created_at: :desc).page(params[:pagina])
    end
  
    # GET /usuarios/1
    def show
    end
  
    # GET /usuarios/new
    def new
      @usuario = Usuario.new
    end
  
    # GET /usuarios/1/edit
    def edit
    end
  
    # POST /usuarios
    def create
      @usuario = Usuario.new(usuario_params)
      if @usuario.save
        flash[:success] = '¡Registro creado exitosamente!'
        redirect_to @usuario, notice: 'Usuario fue creado exitosamente.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /usuarios/1
    def update
      if @usuario.update(usuario_params)
        flash[:success] = '¡Registro modificado exitosamente!'
        redirect_to @usuario, notice: 'Usuario fue actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /usuarios/1
    def destroy
      @usuario.destroy!
      flash[:success] = '¡Registro eliminado exitosamente!'
      redirect_to usuarios_url, notice: 'Usuario fue eliminado exitosamente.'
    end
  
    private
  
    # Método para configurar el registro, usado en before_action
    def set_usuario
      @usuario = Usuario.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = '¡Registro no encontrado!'
      redirect_to posts_url, notice: 'Registro no encontrado '
    end
  
    # Solo permite una lista de parámetros de confianza.
    def usuario_params
      params.require(:usuario).permit(:email, :password, :password_confirmation, :name, :rol)
    end
    
  end

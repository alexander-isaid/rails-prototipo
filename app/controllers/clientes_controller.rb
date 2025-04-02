  class ClientesController < ApplicationController
    before_action :set_cliente, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_usuario! 
  
    # GET /clientes
    def index
      @q = Cliente.ransack(params[:q])
      @clientes =  @q.result.order(created_at: :desc).page(params[:pagina])
    end
  
    # GET /clientes/1
    def show
    end
  
    # GET /clientes/new
    def new
      @cliente = Cliente.new
    end
  
    # GET /clientes/1/edit
    def edit
    end
  
    # POST /clientes
    def create
      @cliente = Cliente.new(cliente_params)
      if @cliente.save
        flash[:success] = '¡Registro creado exitosamente!'
        redirect_to @cliente, notice: 'Cliente fue creado exitosamente.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /clientes/1
    def update
      if @cliente.update(cliente_params)
        flash[:success] = '¡Registro modificado exitosamente!'
        redirect_to @cliente, notice: 'Cliente fue actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /clientes/1
    def destroy
      @cliente.destroy!
      flash[:success] = '¡Registro eliminado exitosamente!'
      redirect_to clientes_url, notice: 'Cliente fue eliminado exitosamente.'
    end
  
    private
  
    # Método para configurar el registro, usado en before_action
    def set_cliente
      @cliente = Cliente.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = '¡Registro no encontrado!'
      redirect_to posts_url, notice: 'Registro no encontrado '
    end
  
    # Solo permite una lista de parámetros de confianza.
    def cliente_params
      params.require(:cliente).permit(:email, :password, :password_confirmation, :name, :rol)
    end
    
  end

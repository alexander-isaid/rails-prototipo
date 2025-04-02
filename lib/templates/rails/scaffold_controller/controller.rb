<% module_namespacing do -%>
  class <%= controller_class_name %>Controller < ApplicationController
    before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_usuario! 
  
    # GET /<%= plural_table_name %>
    def index
      @q = <%= class_name %>.ransack(params[:q])
      @<%= plural_table_name %> =  @q.result.order(created_at: :desc).page(params[:pagina])
    end
  
    # GET /<%= plural_table_name %>/1
    def show
    end
  
    # GET /<%= plural_table_name %>/new
    def new
      @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    end
  
    # GET /<%= plural_table_name %>/1/edit
    def edit
    end
  
    # POST /<%= plural_table_name %>
    def create
      @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
      if @<%= orm_instance.save %>
        flash[:success] = '¡Registro creado exitosamente!'
        redirect_to @<%= singular_table_name %>, notice: '<%= human_name %> fue creado exitosamente.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /<%= plural_table_name %>/1
    def update
      if @<%= singular_table_name %>.update(<%= singular_table_name %>_params)
        flash[:success] = '¡Registro modificado exitosamente!'
        redirect_to @<%= singular_table_name %>, notice: '<%= human_name %> fue actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /<%= plural_table_name %>/1
    def destroy
      @<%= orm_instance.destroy %>
      flash[:success] = '¡Registro eliminado exitosamente!'
      redirect_to <%= plural_table_name %>_url, notice: '<%= human_name %> fue eliminado exitosamente.'
    end
  
    private
  
    # Método para configurar el registro, usado en before_action
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, 'params[:id]') %>
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = '¡Registro no encontrado!'
      redirect_to posts_url, notice: 'Registro no encontrado '
    end
  
    # Solo permite una lista de parámetros de confianza.
    def <%= singular_table_name %>_params
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    end
    
  end
<% end -%>
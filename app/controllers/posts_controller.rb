  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_usuario! 
  
    # GET /posts
    def index
      @q = Post.ransack(params[:q])
      @posts =  @q.result.order(created_at: :desc).page(params[:pagina])
    end
  
    # GET /posts/1
    def show
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    def create
      sleep(5)
      @post = Post.new(post_params)
      if @post.save
        flash[:success] = '¡Registro creado exitosamente!'
        redirect_to @post, notice: 'Post fue creado exitosamente.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        flash[:success] = '¡Registro modificado exitosamente!'
        redirect_to @post, notice: 'Post fue actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/1
    def destroy
      @post.destroy!
      flash[:success] = '¡Registro eliminado exitosamente!'
      redirect_to posts_url, notice: 'Post fue eliminado exitosamente.'
    end
  
    private
  
    # Método para configurar el registro, usado en before_action
    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = '¡Registro no encontrado!'
      redirect_to posts_url, notice: 'Registro no encontrado '
    end
  
    # Solo permite una lista de parámetros de confianza.
    def post_params
      params.require(:post).permit(:titulo, :descripcion, :fecha_creacion, :user_id)
    end
    
  end

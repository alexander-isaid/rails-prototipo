module ResponseHandler
  extend ActiveSupport::Concern

  def render_response(estado:, mensaje: "", errores: [], data: {}, status: :ok)
    render json: {
             estado: estado,
             fecha: Time.current.iso8601,
             mensaje: mensaje,
             data: data,
             errores: errores,
           }, status: status
  end
end

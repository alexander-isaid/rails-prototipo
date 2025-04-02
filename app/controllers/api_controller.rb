class ApiController < ActionController::API
    include ResponseHandler
    before_action :autentication_from_token!
    
    def autentication_from_token!
        begin
            puts "AUTENTICANDO...".yellow
            errores = []
            header = request.headers["Authorization"]
        
            if header.blank?
                errores << "Header debe estar presente en la peticion"
                return render_response(estado: false, mensaje: "Error", errores: errores, status: :unauthorized)
            end
        
            header = header.split(" ").last if header
            decoded = AutenticacionJwt.decoded(header)[0]
            puts "#{decoded}".yellow
        
            credencial = ApiCredencial.find_by(api_name: decoded["api_name"], api_key: decoded["api_key"])
        
            if credencial.blank?
                errores << "credenciales incorrectas."
                return render_response(estado: false, mensaje: "Error", errores: errores, status: :unauthorized)
            end
        
            @credencial = credencial
        rescue => e
            Rails.logger.debug e.message
            errores << "Token invalido o expirado"
            return render_response(estado: false, mensaje: "Error", errores: errores, status: :internal_server_error)
        end
    end

end
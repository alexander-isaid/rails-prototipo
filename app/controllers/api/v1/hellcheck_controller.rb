class Api::V1::HellcheckController < ApiController

    def ping
       render json:{resultado: true, respueta: "Conexion Exitosa", fecha: Time.now}
    end
end
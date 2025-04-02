class Jwt
    API_SECRET_KEY = ENV.fetch("API_SECRET_KEY", "6WQtVGrwgecFGbrBpQ6UaPL9HBS4jae41cRP")
    def self.encode(payload, exp = 24.hours.from_now)
      # Añadimos una fecha de expiración por defecto de 24 horas
      payload[:exp] = exp.to_i
      JWT.encode(payload, API_SECRET_KEY, "HS256")
    end
  
    def self.decoded(token)
      begin
        JWT.decode(token, API_SECRET_KEY, true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
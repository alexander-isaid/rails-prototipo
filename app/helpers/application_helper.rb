module ApplicationHelper
    def badge_estado(estado)
        tipos_de_estado = estado.downcase
        estados = {"finalizado": "bg-success", "error": "bg-danger", "pendiente": "bg-warning", "procesando": "bg-info", "solicitado": "bg-secondary", "recibido": "bg-light", "aprobado": "bg-primary", "activo": "bg-primary", "activa": "bg-primary", "rechazado": "bg-danger"}
        estados[tipos_de_estado.to_sym]
    rescue
        return ""
    end
    
    def fecha_en_letras(fecha)
        dias = %w[PRIMERO DOS TRES CUATRO CINCO SEIS SIETE OCHO NUEVE DIEZ ONCE DOCE TRECE CATORCE QUINCE DIECISÉIS DIECISIETE DIECIOCHO DIECINUEVE VEINTE VEINTIUNO VEINTIDÓS VEINTITRÉS VEINTICUATRO VEINTICINCO VEINTISÉIS VEINTISIETE VEINTIOCHO VEINTINUEVE TREINTA TREINTA Y UNO]
        meses = %w[ENERO FEBRERO MARZO ABRIL MAYO JUNIO JULIO AGOSTO SEPTIEMBRE OCTUBRE NOVIEMBRE DICIEMBRE]
    
        dia_en_letras = dias[fecha.day - 1]
        mes_en_letras = meses[fecha.month - 1]
    
        
        anio = fecha.year
        anio_en_letras = case anio
                        when 2000..2099
                            "DOS MIL " + convertir_a_palabras_anio(anio % 100)
                        else
                            anio.to_s.chars.map { |c| convertir_a_palabras(c.to_i) }.join(" ")
                        end
    
        "#{dia_en_letras} días del mes de #{mes_en_letras} del año #{anio_en_letras}"
    end

    def convertir_a_palabras_anio(num)
        palabras = %w[CERO UNO DOS TRES CUATRO CINCO SEIS SIETE OCHO NUEVE]
        decena = num / 10
        unidad = num % 10
    
        if decena == 2
        
        if unidad == 0
            "VEINTI"
        else
            "VEINTI#{palabras[unidad]}"
        end
        else
        
        [palabras[decena], palabras[unidad]].join(" ")
        end
    end

    def formato_fecha_orden(fecha)
        return "" if fecha.nil?
        fecha.strftime("%Y-%m-%d")
    end

    def formato_fecha(fecha)
        return "" if fecha.nil?
        fecha.strftime("%d/%m/%Y")
    end

    def formato_fecha_hora(fecha)
        return "" if fecha.nil?
        fecha.strftime("%d/%m/%Y %H:%M:%S")
    end

    def formato_date_local(fecha)
        return "" if fecha.nil?
        fecha.strftime("%Y-%m-%dT%H:%M:%S")
    end
end

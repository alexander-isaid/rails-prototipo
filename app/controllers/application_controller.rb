class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success
    devise_group :usuario, contains: [:user, :client]
    rescue_from CanCan::AccessDenied, with: :access_denied

    def current_ability
        if user_signed_in?
            puts "Cliente logiado verificando permisos #{current_user.email}"
            @current_ability ||= Ability.new(current_user)
        else
            if client_signed_in? 
                puts "Cliente logiado verificando permisos #{current_client.email}"
                @current_ability ||= AbilityClient.new(current_client)
            end
        end
    end



    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.pdf  { head :forbidden, content_type: 'application/pdf' }
            format.json { head :forbidden, content_type: 'text/html' }
            format.html { redirect_to (user_signed_in?) ? root_path : root_path, alert: exception.message }
            format.js   { head :forbidden, content_type: 'text/html' }
        end
    end

end

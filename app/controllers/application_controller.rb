class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def authenticate_user!
        if cookies[:generico_admin].blank?
            redirect_to "/login"
            return
        end    

        # if administrador.blank?
        #     redirect_to "/login"
        #     return
        # end

    end

    # def administrador
    #    if cookies[:generico_admin].present?
    #     return @adm if @adm.present?
    #     @adm = Administrador.find(JSON.parse(cookies:[generico_admin])["id"])
    #     return @adm
    #    end

    # rescue
    #     nil
    # end

end

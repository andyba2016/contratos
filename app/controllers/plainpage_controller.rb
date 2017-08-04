class PlainpageController < ApplicationController
 before_action :require_login

  def index
    flash[:success ] = "Success Flash Message: Welcome to GentellelaOnRails"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
  end

  def usuarios
   
      @session = session[:user]
      @usuarios = User.where(estado:1)
      @perfiles = Rol.all()
      @areas = Area.where(estado:1)
      if params[:id]
          @usuario  = User.find(params[:id])
	else
         @usuario = User.new
      end
      @ref = request.referer
  

  end

  def save
      
       begin
        @usuario = User.find_or_create_by({usuario: params[:usuario]})
        @usuario.estado=1
        @usuario.usuario = params[:usuario]
        @usuario.perfil_id = params[:perfil_id]
        @usuario.nombre = params[:nombre]
        @usuario.apellido = params[:apellido]
        @usuario.area_id = params[:area_id]
        @usuario.email = params[:email]
        if @usuario.password != params[:password]
            @usuario.password = params[:password]
        end
        @usuario.save
        redirect_to :usuarios
       rescue =>ex
        redirect_to :usuarios
       end

  end


  def delete
       @usuario  = User.find(params[:id])
       @usuario.estado=0
       @usuario.fecha_baja = DateTime.now
       @usuario.save
       redirect_to :usuarios

  end




  def require_login

   if session[:user]
       @a=1
   else
       redirect_to url_for(:controller => 'plainlogin', :action => 'login')
   end

end


end

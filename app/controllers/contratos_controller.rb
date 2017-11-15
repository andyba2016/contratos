class ContratosController < ApplicationController  
 before_action :require_login

   def index
       @usuario = User.new(JSON.parse(session[:user].to_json))      
       @object = ContratoImplementacion.new(@usuario)
       @result = @object.search()
       @lista_areas = Area.where(estado: 1)
       @lista_tipo = {'Locacion de Obra' => 1, 'Locacion de Servicio' => 2}

       if params[:id]
		      @object   = ContratoImplementacion.find(params[:id])
       end
       @ref = request.referer
   end   
   
  

  def save
	@contrato =	ContratoImplementacion.where({id: params[:id]}).first_or_create(:estado=>1)
 #implementar la sobreescritura }, por ej
 #	@contrato.tarea=params[:tarea]
	@contrato.save
	redirect_to :contratos

  end


  def delete
	@object = ContratoImplementacion.find(params[:id])	
	@object.estado=0
	@object.save	
	redirect_to :contratos
  end
   
   
   
   
   
   
   
   
   

   def require_login
	if session[:user]
		@a=1
   	else
		redirect_to url_for(:controller => 'plainlogin', :action => 'login')
   	end
   end



end

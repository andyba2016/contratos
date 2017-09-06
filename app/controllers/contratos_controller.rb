class ContratosController < ApplicationController  
 before_action :require_login

   def index
       @usuario = User.new(JSON.parse(session[:user].to_json))      
       @object = ContratoImplementacion.new(@usuario)
       @result = @object.search()
   end   

   def require_login
	if session[:user]
		@a=1
   	else
		redirect_to url_for(:controller => 'plainlogin', :action => 'login')
   	end
   end

end

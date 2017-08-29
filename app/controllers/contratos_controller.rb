class ContratosController < ApplicationController  

before_action :require_login

def require_login

   def index

       @usuario = User.new(JSON.parse(session[:user].to_json))
       @contratos = Contratos.new(@usuario)
   end   


   if session[:user]
   else
       redirect_to url_for(:controller => 'plainlogin', :action => 'login')
   end

end

end

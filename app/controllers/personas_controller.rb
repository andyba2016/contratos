class PersonasController < ApplicationController  

def index
	@result = Personas.where(estado:1)
	@object = Personas.new
	if params[:id]
		@object   = Personas.find(params[:id])
      	end
	@ref = request.referer
 end

  def save
        Rails.logger.debug(params)
	@personas = Personas.where({id: params[:id]}).first_or_create(:estado=>1)
	@personas.nombre=params[:nombre]
	@personas.apellido=params[:apellido]
	@personas.numero_documento=params[:numero_documento]
	@personas.cuit=params[:cuit]
	@personas.direccion=params[:direccion]
        @personas.fecha_alta =  DateTime.now
	@personas.save
	redirect_to :personas

  end


  def delete
	@personas= Personas.find(params[:id])	
	@personas.estado=0
        @personas.fecha_baja= DateTime.now
	@personas.save	
	redirect_to :personas
  end





end

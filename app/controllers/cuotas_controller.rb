class CuotasController < ApplicationController

 def index
        @result = Cuota.where(estado:1)
        @object = Cuota.new
        if params[:id]
                @object   =Cuota.where({contrato_id: params[:id]})
        end
        @ref = request.referer
 end

  def save
        @object = Cuota.where({id: params[:id]}).first_or_create(:estado=>1)
        @object.horas_mensuales = params[:horas_mensuales]
        @object.horas_semanales=params[:horas_semanales]
        @object.valor_hora=params[:valor_hora]
        @object.valor_cuota=params[:valor_cuota]
        @object.valor_letras=params[:valor_letras]
        @object.save
        redirect_to :cuota

  end


  def delete
        @object = Cuota.find(params[:id])
        @object.estado=0
        @object.save
        redirect_to :cuota
  end



end

class CuotasController < ApplicationController
  include CuotasHelper
  def index

    @contrato = Contrato.where("id="+request[:id]).first
    @cuotas = Cuota.where("contrato_id = "+request[:id])
    if(@cuotas.count==0)
      generate(request[:id])
      @cuotas = Cuota.where("contrato_id = "+request[:id])
    end

  end

end

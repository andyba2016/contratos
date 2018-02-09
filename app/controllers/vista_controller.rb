class VistaController < ApplicationController

  def index
    @contrato = Contrato.where("id="+request[:id]).first
    @cuotas = Cuota.where("contrato_id = "+request[:id])
  end

end

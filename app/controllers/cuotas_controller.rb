class CuotasController < ApplicationController

  def index

    @cuotas = Cuota.where("contrato_id = "+request[:id])

  end

end

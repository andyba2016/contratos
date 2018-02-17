class VistaController < ApplicationController

  def index
    @contrato = Contrato.where("id="+request[:id]).first

    if request[:accion]
      if request[:accion]=="Presentar" or request[:accion]=="Aprobar"
        @contrato.estado = @contrato.estado + 1
      elsif request[:accion]=="Rechazar"
        @contrato.estado = @contrato.estado - 1
      end
      puts @contrato
      @contrato.save()
    end

    @cuotas = Cuota.where("contrato_id = "+request[:id])
  end

  def save
    @contrato = Contrato.where("id="+request[:id])
    if request[:accion]=="Presentar" or request[:accion]=="Aprobar"
      @contrato.estado = @contrato.estado + 1
    elsif request[:accion]=="Rechazar"
      @contrato.estado = @contrato.estado + 1
    end
    puts @contrato
    @contrato.save()
    redirect_to url_for(:controller => 'vista', :action => 'index', :id => 9863)
  end

end

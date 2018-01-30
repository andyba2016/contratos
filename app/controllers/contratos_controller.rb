class ContratosController < ApplicationController
  before_action :require_login
  include CuotasHelper

  def index
    @usuario = User.new(JSON.parse(session[:user].to_json))
    @object = ContratoImplementacion.new(@usuario)
    @result = @object.search(params)
    @lista_areas = Area.where("estado = 1 and (id="+@usuario.area.id.to_s+" or '"+@usuario.area.id.to_s+"'='1' )")
    @lista_tipo = {'Locacion de Servicio' => 2}
    @persona = Personas.where(estado: 1).order("nombre ASC").all
    @usuarios = User.where("estado = 1 and (area_id="+@usuario.area.id.to_s+" or '"+@usuario.area.id.to_s+"'='1' )")


    if params[:id]
      @object = ContratoImplementacion.find(params[:id])
    else
      print "Paso"
      @object = Contrato.new()
    end

    @ref = request.referer
  end


  def save
    @usuario = User.new(JSON.parse(session[:user].to_json))
    #@contrato = ContratoImplementacion.new(@usuario)
    #@contrato =	ContratoImplementacion.where({id: params[:id]}).first_or_create(:estado=>1,:usuario=>@usuario)
    @contrato =	Contrato.where({id: params[:id]}).first_or_create(:estado=>1)
    #implementar la sobreescritura }, por ej
    #"tipo_id"=>"1", "persona_id"=>"9", "autoridad_id"=>"9", "area_id"=>"3", "fecha_desde_id"=>"23/11/2017", "fecha_hasta_id"=>"23/11/2017",
    @contrato.area_id = params[:area_id]
    #@contrato.tipo_id = params[:tipo_id]
    @contrato.personas_id = params[:persona_id]
    @user = User.new(JSON.parse(session[:user].to_json))
    @contrato.usuarios_id = @user.id
    @contrato.autoridad_id = params[:autoridad_id]
    @contrato.fecha_desde = params[:fecha_desde_id]
    @contrato.fecha_hasta = params[:fecha_hasta_id]
    @contrato.estado = 1


    puts params.inspect

    @contrato.tarea=params[:tarea]
    @contrato.cargo=params[:cargo]
    @contrato.numero = params[:numero]
    @contrato.horas_semanales = params[:horas]
    @contrato.valor_hora = params[:valor]
    @contrato.save
    # agrego plan de cuotas
    puts @contrato.id
    generate(@contrato.id)
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
    if not params[:fecha_desde] or not params[:fecha_hasta]
      params[:fecha_desde]=(Date.today - 5.month).to_s
      params[:fecha_hasta]=Date.today.to_s
    end
    if not params[:resol]
      params[:resol]=""
    end
  end


end

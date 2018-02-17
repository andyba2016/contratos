class ContratoImplementacion < Contrato 
  #self.table_name="perfiles"
	def initialize(usuario)	
		super({:area_id => usuario.area.id})
	end

  def search(params)
    if params.nil?
      @result = Contrato.where({:area_id => self.area.id}).order("contratos.id DESC").limit(100)
    else
      if params[:busqueda] == "1"
        params[:fecha_desde] = params[:fecha_desde].to_date.strftime('%d/%m/%Y')
        params[:fecha_hasta] = params[:fecha_hasta].to_date.strftime('%d/%m/%Y')
        puts params.inspect
      end

      where = ""
      if params[:perfil] == 2
        where = " and usuarios_id ="+params[:usuario_id].to_s
      end


      @result = Contrato.where("estado >= 1 and (area_id="+(params[:area].to_i.to_s)+" or '"+params[:area].to_s+"'='' ) and
      (fecha_desde >='"+params[:fecha_desde]+"' and fecha_hasta <='"+params[:fecha_hasta]+"')
       and (numero='"+params[:resol]+"' or '"+params[:resol]+"'='') and (area_id="+self.area.id.to_s+" or '"+self.area.id.to_s+"'='1' ) "+where).order("contratos.id DESC")
    end

  end

end

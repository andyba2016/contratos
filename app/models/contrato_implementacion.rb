class ContratoImplementacion < Contrato 
  #self.table_name="perfiles"
	def initialize(usuario)	
		super({:area_id => usuario.area.id})	
		#self.area_id=@usuario.area
	end

  def search(params)
    if params.nil?
      @result = Contrato.where({:area_id => self.area.id}).order("contratos.id DESC").limit(100)
    else
      @result = Contrato.where("estado = 1 and (area_id="+(params[:area].to_i.to_s)+" or '"+params[:area].to_s+"'='' )").order("contratos.id DESC").limit(100)
    end

  end

end

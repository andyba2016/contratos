class ContratoImplementacion < Contrato 
  #self.table_name="perfiles"
	def initialize(usuario)	
		super({:area_id => usuario.area.id})	
		#self.area_id=@usuario.area
	end

  def search()
    if 1 == 1
      @result = Contrato.where({:estado => 1})
    else
      @result = Contrato.where({:area_id => self.area.id})
    end

  end

end

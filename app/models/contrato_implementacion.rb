class ContratoImplementacion < Contrato 
  #self.table_name="perfiles"
	def initialize(usuario)	
		super({:area_id => usuario.area.id})	
		#self.area_id=@usuario.area		
	end

  def search()
    @result = Contrato.where({:area_id => self.area.id})   
  end

end

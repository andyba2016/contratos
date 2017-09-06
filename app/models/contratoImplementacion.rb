class ContratoImplementacion < Contrato 
  #self.table_name="perfiles"
 belongs_to :area, foreign_key: "area_id"
	def initialize(usuario) 
		self.area_id=@usuario.area.id
		
	end

end

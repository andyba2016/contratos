class Personas < ActiveRecord::Base

	def descripcion()
		self.apellido+", "+self.nombre
	end

end




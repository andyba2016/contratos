class Personas < ActiveRecord::Base

	def descripcion()
		self.nombre+" "+self.apellido
	end

end




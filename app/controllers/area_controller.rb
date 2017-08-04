class AreaController < ApplicationController  

 def index
	@result = Area.where(estado:1)
	@object = Area.new
	if params[:id]
		@object   = Area.find(params[:id])
      	end
	@ref = request.referer
 end

  def save
	@area =	Area.where({id: params[:id]}).first_or_create(:estado=>1)
	@area.descripcion = params[:descripcion]
	@area.save
	redirect_to :area

  end


  def delete
	@object = Area.find(params[:id])	
	@object.estado=0
	@object.save	
	redirect_to :area
  end



end

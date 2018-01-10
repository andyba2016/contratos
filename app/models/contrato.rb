class Contrato < ActiveRecord::Base
  #self.table_name="perfiles"
   belongs_to :area, foreign_key: "area_id"
   belongs_to :personas, foreign_key: "personas_id"
   belongs_to :usuarios, foreign_key: "usuarios_id"
   belongs_to :autoridad, foreign_key: "autoridad__id"
   belongs_to :tipo_contrato, foreign_key: "tipo_contrato_id"


end


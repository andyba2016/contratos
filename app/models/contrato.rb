class Contrato < ActiveRecord::Base
  #self.table_name="perfiles"
   belongs_to :area, foreign_key: "area_id"
end

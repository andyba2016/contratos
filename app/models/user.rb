class User < ActiveRecord::Base
  self.table_name="usuarios"
  belongs_to :rol, foreign_key: "perfil_id"
  belongs_to :area, foreign_key: "area_id"
  def password=(str)
      write_attribute(:password, Digest::SHA2.hexdigest("barbieri" + str))
  end

end




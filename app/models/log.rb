class Log < ActiveRecord::Base
  belongs_to :log, foreign_key: "usuario_id"

end




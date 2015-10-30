class Hmzd < ActiveRecord::Base
  self.table_name = "hmzd"
  self.primary_keys = :hmdm, :zdxh
end

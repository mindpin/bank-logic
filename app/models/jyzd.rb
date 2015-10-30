class Jyzd < ActiveRecord::Base
  self.table_name = "jyzd"
  self.primary_keys = :jydm, :sjbm
end

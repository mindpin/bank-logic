class AddIdToCdjg < ActiveRecord::Migration
  def change
    # add_column :cdjg, :id, :integer
    index = 1
    Cdjg.all.each_with_index do |cdjg|
      cdjg.id = index
      index = index+1
      cdjg.save!
    end
  end
end

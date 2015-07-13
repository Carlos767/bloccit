class FixAdvertisements < ActiveRecord::Migration
  def change
  	rename_table :advertisings, :advertisements
  end
end

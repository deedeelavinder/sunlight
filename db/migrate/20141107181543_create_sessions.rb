class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :power
      t.integer :speed

      t.timestamps
    end
  end
end

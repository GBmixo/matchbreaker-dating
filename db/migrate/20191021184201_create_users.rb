class CreateUsers < ActiveRecord::Migration[6.0]
    def change
        create_table :users do |t|
                t.string :name
                t.integer :age
                t.string :gender
                t.integer :hp
                t.string :status

            t.timestamps
        end
    end
end

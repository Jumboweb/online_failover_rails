class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.integer :online_id
      t.string :ip
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateFailovers < ActiveRecord::Migration
  def change
    create_table :failovers do |t|
      t.string :ip
      t.string :name
      t.references :master_server, index: true
      t.references :backup_server, index: true

      t.timestamps null: false
    end
    add_foreign_key :failovers, :servers
    add_foreign_key :failovers, :servers
  end
end

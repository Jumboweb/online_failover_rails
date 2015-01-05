class AddPortsAndStatus < ActiveRecord::Migration
  def change

    create_table :addresses do |t|
      t.string :address
      t.integer :port
      t.integer :failed_ping
      t.references :failover, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :failovers
    
  end
end

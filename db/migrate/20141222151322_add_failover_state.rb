class AddFailoverState < ActiveRecord::Migration
  def change
    add_column :failovers, :state, :integer
  end
end

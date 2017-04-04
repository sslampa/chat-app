class AddOriginToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :origin, :integer
  end
end

class AddNameToWidget < ActiveRecord::Migration[5.1]
  def change
    add_column :widgets, :name, :string
  end
end

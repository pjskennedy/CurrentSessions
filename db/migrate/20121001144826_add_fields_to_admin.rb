class AddFieldsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :position, :string
    add_column :admins, :name, :string
  end
end

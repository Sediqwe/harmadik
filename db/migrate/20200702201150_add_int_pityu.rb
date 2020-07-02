class AddIntPityu < ActiveRecord::Migration[6.0]
  def change
      add_column :articles, :szamom, :int
  end
end

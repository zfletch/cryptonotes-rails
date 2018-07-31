class AddViewCountToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :view_count, :integer
  end
end

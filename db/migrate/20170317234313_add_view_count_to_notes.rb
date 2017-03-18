class AddViewCountToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :view_count, :integer
  end
end

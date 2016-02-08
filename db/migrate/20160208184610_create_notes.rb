class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.uuid :uuid, index: true, null: false, default: 'gen_random_uuid()'
      t.text :text, limit: 2000, null: false

      t.timestamps null: false
    end
  end
end

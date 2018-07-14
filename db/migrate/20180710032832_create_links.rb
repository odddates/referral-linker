class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.integer :views, null: false, default: 0
    end
  end
end

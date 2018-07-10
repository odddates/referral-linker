class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links, id: false do |t|
      t.string :id, null: false
    end
  end
end

class CreatePointLineItems < ActiveRecord::Migration
  def change
    create_table :point_line_items do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :points,  null: false
      t.string :source, null: false

      t.timestamps null: false
    end
  end
end

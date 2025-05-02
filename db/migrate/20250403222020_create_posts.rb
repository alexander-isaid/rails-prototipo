class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :descripcion
      t.datetime :fecha_creacion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

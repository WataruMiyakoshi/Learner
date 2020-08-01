class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image
      t.references :user, null: false, foreign_key: true
      # t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

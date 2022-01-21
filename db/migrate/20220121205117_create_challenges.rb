class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.text :submission
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

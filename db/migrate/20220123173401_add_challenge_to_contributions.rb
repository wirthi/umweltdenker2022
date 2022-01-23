class AddChallengeToContributions < ActiveRecord::Migration[6.1]
  def change
    change_table :contributions do |t|
      t.references :challenge, null: true, foreign_key: true
    end
  end
end

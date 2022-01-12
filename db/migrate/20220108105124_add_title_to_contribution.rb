class AddTitleToContribution < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :title, :string
    add_column :contributions, :amount, :string
    add_column :contributions, :completion, :string

    add_column :contributions, :category_id, :integer
    add_foreign_key :contributions, :categories
  end
end

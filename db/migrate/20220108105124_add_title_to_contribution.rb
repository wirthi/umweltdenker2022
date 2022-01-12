class AddTitleToContribution < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :title, :string
    add_column :contributions, :amount, :string
    add_column :contributions, :completion, :string
  end
end

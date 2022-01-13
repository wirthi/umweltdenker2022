class AddTitleEnToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :title_en, :string
  end
end

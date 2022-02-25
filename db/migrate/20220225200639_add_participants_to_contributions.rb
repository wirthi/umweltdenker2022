class AddParticipantsToContributions < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :participants, :integer
  end
end

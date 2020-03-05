class AddCreaterIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creater_id, :integer
  end
end

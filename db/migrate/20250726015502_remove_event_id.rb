class RemoveEventId < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :event_id
  end
end

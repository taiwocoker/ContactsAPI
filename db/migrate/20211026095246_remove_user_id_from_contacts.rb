class RemoveUserIdFromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :user_id, :bigint
  end
end

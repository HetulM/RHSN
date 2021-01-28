class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :reciever_id

      t.timestamps # This gives a date to everything so when we create a new conversation, it stores the date in the database
    end
  end
end

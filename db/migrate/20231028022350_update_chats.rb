class UpdateChats < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chats, :time_last_message, true
  end
end

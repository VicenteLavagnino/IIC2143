class AddStateToExchangeDones < ActiveRecord::Migration[7.0]
  def change
    add_column :exchange_dones, :state, :string
  end
end

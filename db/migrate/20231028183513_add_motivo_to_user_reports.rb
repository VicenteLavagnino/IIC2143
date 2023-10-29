class AddMotivoToUserReports < ActiveRecord::Migration[7.0]
  def change
    add_column :user_reports, :motivo, :text
  end
end

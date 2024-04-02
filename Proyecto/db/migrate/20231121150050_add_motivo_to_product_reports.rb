class AddMotivoToProductReports < ActiveRecord::Migration[7.0]
  def change
    add_column :product_reports, :motivo, :text
  end
end

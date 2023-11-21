class ReportsController < ApplicationController
  def user_reports
    @user_reports = UserReport.all
  end

  def product_reports
    @product_reports = ProductReport.all
  end

  def create_product_report
    @product_report = ProductReport.new(product_report_params)
    
    if @product_report.save
      redirect_to explora_product_path(id: @product_report.product_id), notice: 'Reporte enviado con éxito.', modal_closed: true
    else
      render json: @product_report.errors, status: :unprocessable_entity
    end
  end

  def create_user_report
    @user_report = UserReport.new(user_report_params)
    
    if @user_report.save
      redirect_to root_path, notice: 'Reporte enviado con éxito.', modal_closed: true
    else
      render json: @user_report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    report_type = params[:type]
    report_id = params[:id]
  
    if report_type == 'User'
      report = UserReport.find(report_id)
      report.destroy if report.present?
      notice_message = "User Report eliminado con éxito"
      redirect_path = user_reports_path
    elsif report_type == 'Product'
      report = ProductReport.find(report_id)
      report.destroy if report.present?
      notice_message = "Product Report eliminado con éxito"
      redirect_path = product_reports_path
    else
      notice_message = "Tipo de informe no válido"
      redirect_path = root_path # Otra ruta predeterminada en caso de tipo no válido
    end
  
    redirect_to redirect_path, notice: notice_message
  end
  


  def product_report_params
    params.require(:product_report).permit(:motivo, :product_id)
  end

  def user_report_params
    params.require(:user_report).permit(:motivo, :user_id)
  end
end
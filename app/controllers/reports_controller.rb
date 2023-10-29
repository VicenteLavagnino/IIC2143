class ReportsController < ApplicationController
    def user_reports
        @user_reports = UserReport.all
    end

    def product_reports
        @product_reports = ProductReport.all
    end

    def destroy
        @user_report = UserReport.find(params[:id])
        @user_report.destroy
        redirect_to user_reports_path, notice: "Reporte eliminado con éxito"
    end

end
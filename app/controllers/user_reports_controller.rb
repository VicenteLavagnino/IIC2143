class UserReportsController < ApplicationController
    def destroy
        @user_report = UserReport.find(params[:id])
        @user_report.destroy
    end
end

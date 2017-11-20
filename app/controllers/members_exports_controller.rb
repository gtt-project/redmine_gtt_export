# frozen_string_literal: true

class MembersExportsController < ApplicationController
  before_action :find_project_by_project_id
  before_action :authorize

  def show
    respond_to do |format|
      format.csv do
        send_data RedmineGttExport::MembersToCsv.(@project),
          type: 'text/csv; header=present',
          filename: "#{@project.identifier}-members.csv"
      end
    end
  end

  private

  def find_project_by_project_id
    @project = Project.find params[:project_id]
  end

  def authorize
    if User.current.allowed_to?(:manage_members, @project, global: false)
      true
    else
      if @project && @project.archived?
        render_403 :message => :notice_not_authorized_archived_project
      else
        deny_access
      end
    end
  end
end

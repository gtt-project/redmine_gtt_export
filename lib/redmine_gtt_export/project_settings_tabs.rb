# frozen_string_literal: true

module RedmineGttExport

  # hooks into the helper method that renders the project settings tabs
  module ProjectSettingsTabs

    def project_settings_tabs
      super.tap do |tabs|
        if User.current.allowed_to?(:manage_members, @project)
          tabs << {
            name: 'export_members',
            action: :export_members,
            partial: 'projects/settings/export_members',
            label: :label_export_project
          }
        end
      end
    end

  end
end



module RedmineGttExport
  def self.setup
    ProjectsController.send :helper, RedmineGttExport::ProjectSettingsTabs
  end
end

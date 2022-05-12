# frozen_string_literal: true

Redmine::Plugin.register :redmine_gtt_export do
  name 'Redmine GTT Exports Plugin'
  author 'Jens Krämer, Georepublic'
  author_url 'https://github.com/georepublic'
  url 'https://github.com/gtt-project/redmine_gtt_export'
  description 'Adds data export for project admins'
  version '2.0.0'

  requires_redmine :version_or_higher => '4.0.0'

end

if Rails.version > '6.0' && Rails.autoloaders.zeitwerk_enabled?
  RedmineGttExport.setup
else
  ActiveSupport::Reloader.to_prepare do
    RedmineGttExport.setup
  end  
end


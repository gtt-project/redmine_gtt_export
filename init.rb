# frozen_string_literal: true

require 'redmine'

Redmine::Plugin.register :redmine_gtt_export do
  name 'Redmine GTT Exports Plugin'
  author 'Jens Krämer, Georepublic'
  author_url 'https://github.com/georepublic'
  url 'https://github.com/gtt-project/redmine_gtt_export'
  description 'Adds data export for project admins'
  version '1.1.0'

  requires_redmine :version_or_higher => '3.4.0'

end

ActiveSupport::Reloader.to_prepare do

  RedmineGttExport.setup

end


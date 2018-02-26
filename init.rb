# frozen_string_literal: true

require 'redmine'

Redmine::Plugin.register :redmine_gtt_export do
  name 'Redmine GTT Exports Plugin'
  author 'Jens Krämer, Georepublic'
  author_url 'https://hub.georepublic.net/gtt/redmine_gtt_export'
  description 'Adds data export for project admins'
  version '0.1.0'

  requires_redmine :version_or_higher => '3.4.0'

end

ActionDispatch::Callbacks.to_prepare do

  RedmineGttExport.setup

end


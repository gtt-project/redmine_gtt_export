require_relative '../test_helper'
require 'csv'

class MembersToCsvTest < ActiveSupport::TestCase
  fixtures :projects, :users, :roles, :member_roles, :members, :email_addresses

  setup do
    @project = Project.find 'ecookbook'
  end

  test 'should generate CSV' do
    assert csv = RedmineGttExport::MembersToCsv.(@project)

    has_display_name = Redmine::Plugin.installed?(:redmine_privacy)

    assert rows = CSV.parse(csv)
    assert headers = rows.shift
    assert_equal has_display_name ? 8 : 7, headers.size
    assert_equal I18n.t('field_login'), headers.first
    assert_equal I18n.t(has_display_name ? 'field_displayname' : 'field_created_on'), headers.last
    assert rows.many?
    puts rows.inspect
  end
end

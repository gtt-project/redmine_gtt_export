require_relative '../test_helper'
require 'csv'

class MembersToCsvTest < ActiveSupport::TestCase
  fixtures :projects, :users, :roles, :member_roles, :members, :email_addresses

  setup do
    @project = Project.find 'ecookbook'
  end

  test 'should generate CSV' do
    assert csv = RedmineGttExport::MembersToCsv.(@project)

    assert rows = CSV.parse(csv)
    assert headers = rows.shift
    assert_equal I18n.t('field_login'), headers.first
    assert rows.many?
    puts rows.inspect
  end
end

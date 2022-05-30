# frozen_string_literal: true

module RedmineGttExport
  class MembersToCsv
    include Redmine::I18n

    def self.call(*args, **kwargs)
      new(*args, **kwargs).call
    end

    def initialize(project)
      @project = project
      @separator = l('general_csv_separator') == ',' ? ';' : ','
    end

    COLUMNS = %w(
      login firstname lastname mail project role created_on
    )

    def call
      user_custom_fields = UserCustomField.where(visible: true).sort.map{|cf| cf.name}
      has_displayname = Redmine::Plugin.installed?(:redmine_privacy)
      Redmine::Export::CSV.generate do |csv|
        headers = COLUMNS.map{|c| l "field_#{c}"}
        if has_displayname
          headers.concat([(l "field_displayname")])
        end
        headers.concat(user_custom_fields)
        csv << headers
        @project.members.
          includes(:roles, principal: :email_address).
          order("users.created_on DESC").each do |m|

          user = m.principal

          # User basic
          row = [
            user.login, user.firstname, user.lastname, user.mail,
            @project.identifier,
            m.roles.map(&:name).join(@separator),
            user.created_on
          ]

          # displayname
          if has_displayname
            row.concat([user.displayname])
          end

          # Custom fields
          row.concat(user.visible_custom_field_values.map{|cfv|
            cfv.value
          })

          # Write row
          csv << row
        end
      end
    end
  end
end

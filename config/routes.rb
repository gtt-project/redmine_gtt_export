scope 'projects/:project_id' do
  resource :members_export, only: %i(show), as: :project_members_export
end


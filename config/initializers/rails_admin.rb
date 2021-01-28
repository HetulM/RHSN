RailsAdmin.config do |config|

  RailsAdmin.config do |config|
    config.authorize_with do
      unless current_user.admin
        redirect_to main_app.root_path
        flash[:notice] = "You do not have access to this page"
      end
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end

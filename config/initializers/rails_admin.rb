RailsAdmin.config do |config|

  config.authorize_with do
    redirect_to main_app.root_path unless warden.user.try(:admin)
  end

    config.main_app_name = Proc.new { |controller| [ "Sheffield Water Centre", "Admin Area - #{controller.params[:action].try(:titleize)}" ] }

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['User']
    end
    export
    bulk_delete
    show
    edit
    delete
    show_in_app do
      except ['User','Categories','Subcategories']
    end
  end

    config.model 'User' do
      edit do
        exclude_fields :password, :password_confirmation, :avatar, :work, :invitations_count, :invitation_limit, :current_sign_in_at, :invitation_accepted_at, :invitation_sent_at, :remember_created_at, :sign_in_count, :last_sign_in_at, :last_sign_in_ip , :current_sign_in_ip
        fields do
          help false
        end
      end
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
end

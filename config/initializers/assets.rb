# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( log_in_out.css.sass )
Rails.application.config.assets.precompile += %w( project_show.css.sass )
Rails.application.config.assets.precompile += %w( zero_failures.css.sass )
Rails.application.config.assets.precompile += %w( rre.css.sass )
Rails.application.config.assets.precompile += %w( bip.css.sass )
Rails.application.config.assets.precompile += %w( registration.css.sass)
Rails.application.config.assets.precompile += %w( layout.sass)
Rails.application.config.assets.precompile += %w( contact.css.sass)
Rails.application.config.assets.precompile += %w( forgot_password.css.sass)
Rails.application.config.assets.precompile += %w( add_project.css.sass)
Rails.application.config.assets.precompile += %w( introduction.css.sass)
Rails.application.config.assets.precompile += %w( new_password.css.sass)
Rails.application.config.assets.precompile += %w( custom_flash.sass)
Rails.application.config.assets.precompile += %w( introduction.css.sass)
Rails.application.config.assets.precompile += %w( custom.css.scss)
Rails.application.config.assets.precompile += %w( profile.css.sass)
Rails.application.config.assets.precompile += %w( news.css.sass)
Rails.application.config.assets.precompile += %w( story.css.sass)


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
 Rails.application.config.assets.precompile += %w( profile.js )

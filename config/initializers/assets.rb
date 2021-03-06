# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

#/views/layout
Rails.application.config.assets.precompile += %w( admins_ativo.js admins_ativo.css
                                                  admins_session.js admins_session.css )

#/lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.min.js sb-admin-2.min.css
                                                  scripts.js styles.css 
                                                  jquery.min.js
                                                  jquery.maskMoney.min.js )

#vendor/assets
Rails.application.config.assets.precompile += %w( bootstrap/js/bootstrap.bundle.min.js jQuery-Mask-Plugin-master/dist/jquery.mask.min.js )
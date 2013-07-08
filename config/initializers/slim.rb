Slim::Engine.set_default_options pretty: true if Rails.env.development? or Rails.env.testing?

# compile slim-templates in the app/assets folder (used for Angular templates in app/assets/templates)
Rails.application.assets.register_engine('.slim', Slim::Template)

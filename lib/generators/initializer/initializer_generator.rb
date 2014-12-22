class InitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  def create_initializer_file
    template 'online_token.rb', File.join('config', 'initializers', 'online_token.rb')
  end
end

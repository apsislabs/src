require "simple_rails_configurator/version"

module SimpleRailsConfigurator
  def self.configure!(path=nil)
    path ||= Rails.root.join('config', 'custom')

    files = Dir.glob(File.join(path, '**', '*.{yml,yaml}'))
    files.each{ |file| configure_from_file(file) }
  end

  def self.configure_from_file(filename)
    # TODO: Pass down a path prefix and implement "namespaces" based on location?
    yaml = load_config_yaml(filename)

    if Rails.env.local?
      override = load_config_yaml("#{filename}.override")
      yaml.merge!(override)
    end

    name = File.basename(filename).rpartition('.')[0]
    Rails.application.config.send("#{name}=".to_sym, yaml)
  end

  def self.load_config_yaml(filename)
    if File.exist?(filename)
      config_erb = ERB.new(File.read(filename))
      yaml = YAML.load(config_erb.result)

      return yaml[Rails.env] if yaml.key?(Rails.env)
      return yaml
    end
    return {}
  end
end

module SwitchProxy
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration

    def self.load_configuration
      config_file = "#{ENV['HOME']}/.switch_proxy"
      if !File.exists? config_file
        FileUtils.cp(File.expand_path("../../templates/switch_proxy", __FILE__), config_file)
      end
      YAML.load_file config_file
    end

    yml_configs = load_configuration
    yml_configs.each_key do |accessor|
      attr_accessor accessor.to_sym
    end

    define_method :initialize do
      yml_configs.each do |name, value|
        instance_variable_set("@#{name}", value)
      end 
    end
  end
end

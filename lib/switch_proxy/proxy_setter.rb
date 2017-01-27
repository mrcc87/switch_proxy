module SwitchProxy
  class ProxySetter

    attr_accessor :bashrc, :apt_conf, :new_bashrc, :http_proxy, :https_proxy, :proxy_regex

    def initialize
      SwitchProxy.configure { |config| }
      @bashrc = "#{ENV['HOME']}/.bashrc"
      @new_bashrc = "#{ENV['HOME']}/.new_bashrc"
      @apt_conf = "/etc/apt/apt.conf"
      @http_proxy = SwitchProxy.configuration.http_proxy
      @https_proxy = SwitchProxy.configuration.https_proxy
      @proxy_regex = Regexp.new /(http|https)_proxy/
    end

    def add_proxy_to_bashrc
      unless File.readlines(bashrc).grep(proxy_regex).size > 0
        File.open(bashrc, "a") do |file|
          file << "export http_proxy=#{http_proxy}"
          file << "\n"
          file << "export https_proxy=#{https_proxy}"
        end
      end
    end

    def remove_proxy_from_bashrc
      File.open(new_bashrc, "w") do |out_file|
        File.foreach(bashrc) do |line|
          out_file.puts line unless line =~ proxy_regex
        end
      end
      FileUtils.mv(new_bashrc, bashrc)
    end

    def add_proxy_to_apt_conf
      File.open(apt_conf, "w") do |file|
        file.puts "Acquire::http::Proxy \"#{http_proxy}/\";"
        file.puts "Acquire::https::Proxy \"#{https_proxy}/\";"
      end
    end

    def remove_proxy_from_apt_conf
      File.open(apt_conf, "w").close
    end

    def add_proxy
      add_proxy_to_bashrc
      add_proxy_to_apt_conf
    end

    def remove_proxy
      remove_proxy_from_bashrc
      remove_proxy_from_apt_conf
    end
  end
end

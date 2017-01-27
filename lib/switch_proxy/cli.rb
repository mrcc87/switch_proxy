module SwitchProxy
  class Cli < Thor

    option :on, :type => :boolean
    desc "turn", "toggle console proxy on/off"
    def turn
      if options[:on]
        ProxySetter.new.add_proxy
        puts "proxy on".black.on_white
      else
        ProxySetter.new.remove_proxy
        puts "proxy off".red.on_white
      end
    end
  end
end

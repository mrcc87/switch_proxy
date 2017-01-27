module SwitchProxy
  class Cli < Thor

    option :on, :type => :boolean
    desc "turn", "toggle console proxy on/off"
    def turn
      if options[:on]
        ProxySetter.new.add_proxy
      else
        ProxySetter.new.remove_proxy
      end
    end
  end
end

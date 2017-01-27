module SwitchProxy
  class Cli < Thor
    option :on, :type => :boolean
    desc "toggel", "toggle console proxy on/off"
    def toggle
      if options[:on]
        ProxySetter.new.add_proxy
        puts set_color "proxy on", :green, :on_white
      else
        ProxySetter.new.remove_proxy
        puts set_color "proxy off", :red, :on_white
      end
    end
  end
end

module SwitchProxy
  class Cli < Thor

    option :on, :type => :boolean
    desc "toggle", "toggle console proxy on/off, default (no option) is off"
    def toggle
      if options[:on]
        ProxySetter.new.add_proxy
        puts set_color "proxy on", :black, :on_white
      else
        ProxySetter.new.remove_proxy
        puts set_color "proxy off", :red, :on_white
      end
    end

    desc "edit", "edit configurations. toggle on/off is required"
    def edit
      SwitchProxy.configure { |config| }
      system("#{SwitchProxy.configuration.editor} #{ENV['HOME']}/.switch_proxy")
    end
  end
end

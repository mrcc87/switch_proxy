module SwitchProxy
  class Cli < Thor
    desc "switch terminal proxy ON", "switches proxy ON"
    def on
      ProxySetter.new.add_proxy
    end

    desc "switch terminal proxy OFF", "switches proxy OFF"
    def off
      ProxySetter.new.add_proxy
    end
  end
end

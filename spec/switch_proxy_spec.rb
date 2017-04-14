require 'spec_helper'

describe SwitchProxy do
  let(:home) {'/tmp/switch_proxy_test/home'}
  let(:switch_proxy_file) {'/tmp/switch_proxy_test/home/.switch_proxy'}

  # creates new home path and test bashrc
  before :each do
    ENV['HOME'] = home
    test_bashrc = "#{ENV['HOME']}/.bashrc"
    FileUtils.cp(File.expand_path("../fixtures/test_bashrc", __FILE__), test_bashrc)
  end

  # removes .bashrc file after each test
  after :each do
    FileUtils.rm "#{home}/.bashrc"
  end

  # removes test folder after all the tests
  after :all do
    FileUtils.remove_dir '/tmp/switch_proxy_test'
  end

  it 'has a version number' do
    expect(SwitchProxy::VERSION).not_to be nil
  end

  it 'creates a .switch_proxy in the home folder' do
    expect(File.exists? switch_proxy_file).to be true
  end

  it 'creates a SwitchProxy::Configuration instance variable' do
    SwitchProxy.configure {|config|}
    expect(SwitchProxy.configuration.class).to eql(SwitchProxy::Configuration)
  end

  it 'generates attr_accessors for SwitchProxy::Configuration from the properties in the .switch_proxy file' do
    expect(SwitchProxy.configuration).to respond_to(:http_proxy)
    expect(SwitchProxy.configuration).to respond_to(:https_proxy) 
    expect(SwitchProxy.configuration).to respond_to(:editor) 
  end
end

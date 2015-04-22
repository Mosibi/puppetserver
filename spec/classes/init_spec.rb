require 'spec_helper'
describe 'puppetserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppetserver') }
  end
end

require 'spec_helper'
describe 'unrealircd' do

  context 'with defaults for all parameters' do
    it { should contain_class('unrealircd') }
  end
end

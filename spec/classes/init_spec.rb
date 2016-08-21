require 'spec_helper'
describe 'configy' do
  context 'with default values for all parameters' do
    it { should contain_class('configy') }
  end
end

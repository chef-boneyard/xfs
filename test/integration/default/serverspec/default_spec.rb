require_relative './spec_helper'

describe 'xfs::default recipe' do
  describe package('xfsprogs') do
    it { should be_installed }
  end

  describe package('xfsdump'), :if => ['debian', 'ubuntu'].include?(os[:family]) do
    it { should be_installed }
  end
end

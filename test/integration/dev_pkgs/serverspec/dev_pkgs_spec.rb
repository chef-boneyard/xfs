require_relative './spec_helper'

describe 'xfs::default recipe' do
  describe package('xfsprogs') do
    it { should be_installed }
  end

  describe package('xfsdump'), :if => ['debian', 'ubuntu'].include?(os[:family]) do
    it { should be_installed }
  end
end

if %w(fedora redhat).include?(os[:family])
  pkg = 'xfsprogs-devel'
elsif %w(debian ubuntu).include?(os[:family])
  pkg = 'xfslibs-dev'
end

describe package(pkg) do
  it { should be_installed }
end


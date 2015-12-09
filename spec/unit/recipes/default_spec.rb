require 'spec_helper'

describe 'xfs::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic[:lsb][:codename] = 'trusty'
    end.converge(described_recipe)
  end

  it 'installs xfsprogs' do
    expect(chef_run).to install_package('xfsprogs')
  end

  context 'dev_packages true on centos 6.7' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7') do |node|
        node.set['xfs']['dev_packages'] = true
      end.converge('xfs::default')
    end

    it 'should install dev package' do
      expect(chef_run).to install_package('xfsprogs-devel')
    end
  end

  context 'dev_packages true on ubuntu 14.04 ' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['xfs']['dev_packages'] = true
      end.converge('xfs::default')
    end

    it 'should install dev package' do
      expect(chef_run).to install_package('xfslibs-dev')
    end
  end
end

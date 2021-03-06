require 'spec_helper'

describe 'pdns::install', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  it { should create_class('pdns::install') }
  it { should contain_package('pdns') }
  it { should contain_package('pdns-backend-pipe') }
  it { should contain_package('pdns-recursor') }
  it { should contain_file('/usr/sbin/pdns_puppetdb.rb') }

end


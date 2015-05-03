require 'spec_helper'

describe 'transmission_daemon' do
  context 'supported operating systems' do
    ['Suse'].each do |osfamily|
      describe "transmission_daemon class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('transmission_daemon') }
        it { is_expected.to contain_class('transmission_daemon::defaults') }
        it { is_expected.to contain_class('transmission_daemon::users').that_comes_before('transmission_daemon::repo') }
        it { is_expected.to contain_class('transmission_daemon::repo').that_comes_before('transmission_daemon::install') }
        it { is_expected.to contain_class('transmission_daemon::install').that_comes_before('transmission_daemon::config') }
        it { is_expected.to contain_class('transmission_daemon::config') }
        it { is_expected.to contain_class('transmission_daemon::service').that_subscribes_to('transmission_daemon::config') }

        #
        # Suse Specific
        #
        if osfamily == 'Suse'
          it { is_expected.to contain_service('transmission-daemon') }
          it { is_expected.to contain_package('transmission-daemon').with_ensure('present') }
          it { is_expected.to contain_package('libminiupnpc10').with_ensure('present') }
          it { is_expected.to contain_file('/var/lib/transmission/.config/') }
          it { is_expected.to contain_file('/var/lib/transmission/.config/transmission/settings.json') }
          it { is_expected.to contain_file('/var/lib/transmission/.config/transmission') }
          it { is_expected.to contain_file('/var/lib/transmission/') }
          it { is_expected.to contain_file('/var/lib/transmission/complete') }
          it { is_expected.to contain_file('/var/lib/transmission/incomplete') }
          it { is_expected.to contain_group('transmission') }
          it { is_expected.to contain_user('transmission') }
          it { is_expected.to contain_transmission_daemon__repo__zyp('http://download.opensuse.org/repositories/home:/ghostlyrat/SLE_12/') }
          it { is_expected.to contain_zypprepo('http__download.opensuse.org_repositories_home_ghostlyrat_SLE_12_') }
        end # if suse
      end
    end
  end

  context 'unsupported operating system' do
    describe 'transmission_daemon class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('transmission_daemon') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

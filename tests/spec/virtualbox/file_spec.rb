require 'spec_helper'

%w{
  /etc/hekad.d
  /etc/hekad.d/lua
  /var/run/hekad.d/
  /var/cache/hekad/dashboard
}.each do |f|
  describe file(f) do
    it { should be_directory }
  end
end

%w{
  /var/log/hekad.log
  /etc/hekad.d/0_hekad_main.toml
  /etc/hekad.d/4_dashboard_main.toml
  /etc/hekad.d/lua/monolog.lua
  /etc/hekad.d/1_monolog.toml
  /etc/hekad.d/3_monolog_udp_main.toml
  /etc/hekad.d/4_elastic_search_main.toml
}.each do |f|
  describe file(f) do
    it { should be_file }
  end
end

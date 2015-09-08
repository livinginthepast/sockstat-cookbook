include_recipe 'build-essential'
include_recipe 'git'

git_checkout_dir = "#{Chef::Config['file_cache_path']}/illumos-sockstat"

git git_checkout_dir do
  repository 'https://github.com/bahamas10/illumos-sockstat.git'
  reference 'master'
end

execute 'compile illumos-sockstat' do
  command 'make'
  cwd git_checkout_dir
  environment 'PATH' => node['paths']['bin_path']
  not_if { ::File.exist?('/opt/local/bin/sockstat') }
end

link 'install illumos-sockstat' do
  to "#{git_checkout_dir}/sockstat"
  target_file '/opt/local/bin/sockstat'
  mode 0755
  not_if { ::File.exist?('/opt/local/bin/sockstat') }
end

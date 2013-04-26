include_recipe "install_from"

install_from_release('nodejs') do
  release_url   node[:nodejs][:release_url]
  home_dir      node[:nodejs][:home_dir]
  version       node[:nodejs][:version]
  action        [ :unpack, :install_binaries ]
  has_binaries  %w[ bin/node bin/npm ]
  not_if{ ::File.exists?("#{node[:nodejs][:home_dir]}/node") }
end

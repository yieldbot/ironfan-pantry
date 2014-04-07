default[:nodejs][:git_url]         = "https://github.com/joyent/node.git"
default[:nodejs][:deploy_version]  = "master"
default[:nodejs][:jobs] = "2"
default[:nodejs][:install_dir] = "/usr/src/nodejs"
default[:nodejs][:bin_path] = "/usr/local/bin/node"

# these attributes used when installing from release bin tarball
default[:nodejs][:release_url] = "http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz"

default[:nodejs][:home_dir] = "/usr/local/share/nodejs-0.10.26"
default[:nodejs][:version] = "0.10.26"

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{deploy@206.225.83.49}
role :web, %w{deploy@206.225.83.49}
role :db,  %w{deploy@206.225.83.49}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '206.225.83.49', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
server '206.225.83.49',
  user: 'deploy',
  roles: %w{web app},
  ssh_options: {
    user: 'deploy', # overrides user setting above
    keys: %w(/home/vagrant/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey password),
    password: 'deploy2014'
  }
# setting per server overrides global ssh_options

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
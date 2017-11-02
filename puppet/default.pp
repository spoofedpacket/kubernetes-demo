#
# Class to create entries in /etc/hosts
#
class hosts ( 
   $hosts_target = '/etc/hosts',
) {

   $hosts_hash = { 'kub-node1' => { 'ip' => '192.168.33.10'},
                   'kub-node2' => { 'ip' => '192.168.33.11'},
                   'kub-node3' => { 'ip' => '192.168.33.12'},
                 }

   create_resources(host, $hosts_hash, {
     target => $hosts_target,
   })
 
}

class kub {
   $kub_packages = [ 'etcd', 'flannel',
                 'kubernetes-master', 'kubernetes-node', 'kubernetes-client' ]

   package { $kub_packages:
             ensure => 'installed',
   }
}

include hosts
include kub

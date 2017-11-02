#
# Class to create entries in /etc/hosts
#
class hosts ( 
   $hosts_target = '/etc/hosts',
   $hosts_purge  = false,
) {

   $hosts_hash = { 'kub_node1' => { 'ip' => '192.168.33.10'},
                   'kub_node2' => { 'ip' => '192.168.33.11'},
                   'kub_node3' => { 'ip' => '192.168.33.12'},
                 }

   create_resources(host, $hosts_hash, {
     target => $hosts_target,
   })
 
   if $purge_hosts {
      # Get rid of anything not provisioned with puppet
      resources {'host':
        purge => true,
      }
   }
}

include hosts

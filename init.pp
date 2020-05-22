class srv_application_user_for_prod{

if $facts['hostname'] != "srv-jenkins-01" {
    user {'application':
<------>name => 'application',
<------>ensure => present,
<------>home => '/home/application',
<------>shell => '/bin/bash',
<------>managehome => true,
<------>membership => minimum,
<------>password => '$6$gNPwH7aEyEToB07p$8brWFD77EiNUL82NsI/ZkKgT/nSlmn/78lTj/xcgsRMBiQLlK.xUMcmr9j9Uq4G8SPnxXkTX9PZaqJbmH.KcD0', # хеш пароля для теста
<------>}
    ssh_authorized_key { 'jenkins@srv-jenkins-01':
<------>user   => 'application',
<------>ensure => present,
<------>type   => 'ssh-rsa',
<------>key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDpHDs97PY9b73YPRUEUtPsAN87MYGAW290jV4763Ip4GV5iBHTSmXixH+G9VHTdDM5dd8GvFNX1Qtndif78mXO6hz1vrhAiiIdeNNqWXloexR84mPIzr8JmfnMJRd4dkbVP/XK5/niXzlu+9FBwBORAdvKnq/W5GEmRn99QmWIjH3K43yQeXR7d6' # ssh-key для теста
<------>subscribe => User['application'],
<------>}
} else {
    notify {'Warning! Not change manifest!' : message => 'This is the Jenkins server! SSH key is not imported!',}
    }


}#class




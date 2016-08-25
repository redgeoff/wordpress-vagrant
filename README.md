# wordpress-vagrant

A quick way to get WordPress and NGINX running


Install Vagrant, VirtualBox and git
---

    http://www.vagrantup.com
    https://www.virtualbox.org (don't worry about setting up any VMs as the steps below will cover this)
    http://git-scm.com


Set up
---

    Edit /etc/hosts locally and add `192.168.50.17 wp.dev`
    $ git clone https://github.com/redgeoff/wordpress-vagrant.git
    $ cd wordpress-vagrant
    $ vagrant up
    $ vagrant ssh
    Visit http://wp.dev

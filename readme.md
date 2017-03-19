# Vagrant/PHPBrew environment

This environment was created primarily for testing [ExpressionEngine](https://expressionengine.com/) addons (at least at creation time) in the major PHP versions easily. It has the latest small patch version of each major version of PHP from 5.3 to 7.1 via [PHPBrew](https://github.com/phpbrew/phpbrew).

## Requirements

You will need to have [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed.

To use NFS on Windows (you want to use NFS, it will speed up page loads by about 800%), you will need to have the [Vagrant WinNFSd] plugin installed. Thankfully it's as simple as running `vagrant plugin install vagrant-winnfsd` from command prompt or PowerShell.

## Getting Started

To get started:

1. Add the `localStorage` and `scripts` directories with contained files and directories, and the `Vagrantfile` to your project
2. Edit the example sync directories in the vagrant file to sync directories as needed for your setup
3. Edit the `ServerName` in site.conf to use the domain you want to use in your project
4. Duplicate `vagrantConfig.yaml.sample` and use an IP address that does not conflict with any other IP addresses for other vagrant boxes on your setup.
    - You should continue using the `192.168.56.xxx` address space since that is VirtualBox’s internal address space.
5. Then you can run `vagrant up`

## Daily Usage

`vagrant up` starts the box, `vagrant halt` stops the box as always.

The version of PHP after initial setup will default to 7.1. To switch PHP versions quickly on the fly, run `vagrant ssh`, then once SSHed into the box, use one of the commands shown to you when you log in (like `php55`) to switch which PHP version is being used.

If you are doing any PHP command line work in the box, the quick swich commands also switch the command line version of PHP being used.

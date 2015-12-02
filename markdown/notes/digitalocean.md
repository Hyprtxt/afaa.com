### Bare Metal Server Hosting

* [Low Prices](https://www.digitalocean.com/pricing/)
* [The Services we Need](https://www.digitalocean.com/features/technology/)
* Complete freedom, [BYO System Admin](http://hyprtxt.com)

Digital Ocean provides computer resources on a network.

* 1 IP Address
* TB's of Transfer
* SSD Storage, Memory & Processor

They also offer a few other useful network features

* DNS
* Private Networking
* Floating IP's

And some support & backup features

* Server images (a bit like backups, at machine level)
* Team Accounts
* Single click server upsizes

### Drawbacks

* [99.99% SLA](https://www.digitalocean.com/features/reliability/), if a server goes down, there's not much we can do. SLA means we only get refunded billed time, pennies an hour.
* [No](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04) [support for](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04) [software issues](https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts), [Google it yourself!](https://www.linode.com/docs/tools-reference/tools/limiting-access-with-sftp-jails-on-debian-and-ubuntu)
* Complete freedom, lots of rope.

### Benefits

* Freedom to use whatever software we like
* Freedom to *not* use software we don't need

### Case Study

* The server has no control panel (CPanel, Plesk, etc..) which some web developers rely on. However we are still free to install any control panel we feel like.


### The End

That's it. Digital Ocean does very little for us except provide quality hardware, a nice control panel, powerful API and lots of freedom. The rest is up to us.

* Choice of operating systems: Any flavor of unix
* Choice of software: Anything you can license
* Choice of hardware: How much and how many?
* Fast - Provision new hardware in ~55s

#### No passwords

we can configure our servers to use only Private Key Encryption authentication. Combined with a custom SSH port, this configuration gives us world class server security.

#### Micro Services

When servers are cheap, we can partition services into smaller chunks, isolating complexity and encouraging development of many services that communicate with API's, instead of a monolithic application that no single owner dare stand behind.

#### WordPress Performance

I have deployed hundreds of WP instances, and I like my servers *fast*

* Memcached
* Nginx
* PHP-FPM
* MySQL

Experience has proven this stack is fast, reliable and open source. I can theoretically set it up on any VPS provider, but Digital Ocean has a knack for staying out of my way and not installing software that we don't need.

#### HAProxy

A droplet that proxies requests to a group of servers, without getting the way of sessions and other common web server needs. This allows us to horizontally scale and resist things like server outages, the requests are just rerouted to active servers. This is enabled by Private Networking and Floating IP address, but isn't really a feature of Digital Ocean, rather its a freedom that Digital Ocean would allow us to excerise.

#### WordPress Cluster

We can create a high availability WordPress cluster by using a MySQL cluster for DB, and many Web Servers behind a HAProxy Machine.

* HAProxy
* HAProxy Standby
* WP APP Server - Academic 1
* WP APP Server - Academic 2
* WP APP Server - Blog 1
* WP APP Server - Blog 2
* WP APP Server - Stage
* MySQL DB1
* MySQL DB2

The gives us the ability to suffer complete server failure anywhere in the stack, without taking a website down.

* 2 HaProxy - 512MB
* 5 App servers - 1GB
* 2 DB servers - 2GB

Network & Hardware cost: **$100/Month**

[Linode](https://www.linode.com/) Is a viable alternative to Digital Ocean that offers many of the same features.

[Linode Pricing](https://www.linode.com/pricing)

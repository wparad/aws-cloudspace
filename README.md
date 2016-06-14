# Linux CloudSpace
Free yourself from your Desktop, and reserve some cloud space just for yourself. Don't be grounded by your hardware.

[![npm version](https://badge.fury.io/js/cloudspace.svg)](https://badge.fury.io/js/cloudspace) [![Build Status](https://travis-ci.org/wparad/cloudspace.svg?branch=master)](https://travis-ci.org/wparad/cloudspace)

## Prerequisites

* Import a keypair named `Cloudspace-SSH`
	* If necessary one can be created by using `ssh-keygen -b 4096 -t rsa`
	* And then importing using the [AWS console UI](https://console.aws.amazon.com/ec2/v2/home#KeyPairs:sort=keyName).
* Create an EC2 service Role (and [Service Profile](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)) called `Cloudspace`
	* with the necessary permissions, to your AWS account (if necessary).
* Create VPC Subnet (and VPC if necessary)
	* Name the VPC Subnet `Cloudspace`
	* Use ACL Restrictions for VPC to manage security:
		* Inbound Rules

			| Rule #            |        Type   |   Protocol    |   Port Range  | Source    | Allow / Deny |
			| :---------------: |--------------:|--------------:|--------------:|----------:|-------------:|
			| 100               | ALL Traffic   |   ALL         |   ALL         | Private IP| ALLOW        |

		* Outbound Rules

			| Rule #            |        Type   |   Protocol    |   Port Range  | Source    | Allow / Deny |
			| :---------------: |--------------:|--------------:|--------------:|----------:|-------------:|
			| 100               | ALL Traffic   |   ALL         |   ALL         | 0.0.0.0/0 | ALLOW        |

		* Security Group
			* Inbound Rules

				|        Type   |   Protocol    |   Port Range  | Source    |
				|--------------:|--------------:|--------------:|----------:|
				| SSH (22)      |   TCP(6)      |   22          | 0.0.0.0/0 |
			* Outbound Rules

				|        Type   |   Protocol    |   Port Range  | Source    |
				|--------------:|--------------:|--------------:|----------:|
				| ALL Traffic   |   ALL         |   ALL         | 0.0.0.0/0 |

## Usage

* `npm install -g cloudspace`
* `cloudspace`
	* `list`: Displays all EC2 instances
	* `create`: Create an Cloudspace instance
	* `terminate`: delete all instances
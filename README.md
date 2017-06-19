# kube-weechat

current release: 0.9

`kube-weechat` is a personal IRC client setup for Kubernetes! It runs:
* [weechat](https://github.com/weechat/weechat) (IRC client)
* [Glowing Bear](https://github.com/glowing-bear/glowing-bear) (web frontend to weechat)
* [ngircd](https://github.com/ngircd/ngircd) (IRC server - for local testing & hopefully personal chatbots in the future)

and has great features like:
* SSL for all publicly exposed services
* automatic logs backup to S3

## Requirements:
* nginx-ingress-controller (https://github.com/kubernetes/ingress)
* kube-lego (https://github.com/jetstack/kube-lego)
* AWS IAM creds for an S3 bucket

## Setup:
1. Clone the repo: `git clone git@github.com:sophaskins/kube-weechat.git`
2. Fill in the config with correct information for you: `vim kube-weechat/kubeconfigs/01-configs.yaml` Make sure that you (at least) change:
	* default nicknames (under `server_default`)
	* relay password (under `relay.conf`)
	* AWS secrets (under `aws-secrets`) if you want log backups
3. Configure ingresses with the right domain names for your setup: `vim kube-weechat/kubeconfigs/99-ingress.yaml` 
4. Apply the configs: `kubectl apply -f kube-weechat/kubeconfigs`

## Usage:

If everything starts up correctly, you should be able load Glowing Bear at the URL defined in the Ingress configs: https://glowing-bear.example.net The "weechat relay hostname" should be the domain defined for weechat in the Ingress configs: `weechat.example.net`. The port to use is `443`, you should make sure to check the "Encryption" box. Finally, use the password you set up in step 2 above.

## chef-local-mode-mackerel-agent example

install mackerel agent

## Setup

1. install chef-dk from http://downloads.getchef.com/chef-dk/
2. git clone https://github.com/higanworks/chef-local-mode-mackerel-agent.git
3. `cd chef-local-mode-mackerel-agent`
4. berks vendor cookbooks

## run chef

set API_KEY from ENV

1. MACKEREL_API_KEY='Your API KEY' chef-client -z  -o 'role[mackerel-agent-active]'

input API_KEY from stdin

1. chef-client -z  -o 'role[mackerel-agent-active]'

```
Starting Chef Client, version 11.xx.xx

...

Synchronizing Cookbooks:
  - apt
  - mackerel-agent
  - yum
  - mackerel_setting_sample
Compiling Cookbooks...
========================================
Please input Mackrel API_KEY ? << Please input apikey here.
```

set API_KEY from attribute by node, role or environment.

```
{
  "mackerel-agent": {
    "conf": {
      "apikey": "your api key"
    }
  }
}
```


## run chef via knife-zero(optional)

1. bootstrap `knife zerobootstrap {ip address} -r 'role[mackerel-agent-active]' `
2. exec `knife exec -E "nodes.all {|n| n.set['mackerel-agent']['conf']['apikey'] = 'Your API KEY'' ; n.save }"`
3. run `knife zero chef_client "name:*" [ -a ipaddress]`

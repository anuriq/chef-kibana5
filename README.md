# chef-kibana5
[![Cookbook Version](https://img.shields.io/cookbook/v/kibana5.svg)](https://supermarket.chef.io/cookbooks/kibana5)
[![Build Status](https://travis-ci.org/anuriq/chef-kibana5.svg?branch=master)](https://travis-ci.org/anuriq/chef-kibana5)

## Description

This cookbook installs and configures [Kibana](https://www.elastic.co/products/kibana) version 5.2.0 and above. This cookbook may work with Kibana 6.x.x, but no guarantee.

## Requirements

### Cookbooks

- [ark](https://supermarket.chef.io/cookbooks/ark)
- [systemd](https://supermarket.chef.io/cookbooks/systemd)

### Platforms

Tested only on CentOS 7 and Ubuntu 16.04. Should work on any modern Linux OS with systemd.

## Recipes
* `default.rb` - Runs `kibana5_install` and `kibana5_configure` with default options.

## Resources

### kibana5_install

This resource installs Kibana 5 binaries.

#### Attributes

|Attribute|Description|Type|Default|
|---------|-----------|----|-------|
|`name`| Simply name. Currently not used. |String||
|`version`| Version of Kibana. 5.2.0 and above are supported. |String|`5.6.9`|
|`install_method`| Installation method. Currently only `release` is supported. This means installation from official binaries provided by Elastic. |String|`release`|
|`base_dir`| Base directory for Kibana binaries. |String|`/opt/kibana`|
|`svc_user`| Kibana daemon user. |String|`kibana`|
|`svc_group`| Kibana daemon group. |String|`kibana`|

### kibana5_configure

This resource configures Kibana daemon and main configuration file.

#### Attributes

|Attribute|Description|Type|Default|
|---------|-----------|----|-------|
|`svc_name`| Name of the daemon |String||
|`svc_user`| Kibana daemon user. |String|`kibana`|
|`svc_group`| Kibana daemon group. |String|`kibana`|
|`configuration`| Hash with configuration file values. See examples. |Hash||
|`template_cookbook`| Override template from other cookbook. |String|`kibana5`|

examples of configuration hashes:

```ruby
{
  'server.port' => 5601,
  'server.host' => 'localhost',
  'elasticsearch.url' => 'http://localhost:9200',
}
```

```ruby
{
  'server.port' => 5601,
  'server.host' => 'localhost',
  'server.name' => 'My-Kibana',
  'elasticsearch.url' => 'http://localhost:9200',
  'logging.dest' => '/var/log/kibana.log',
  'logging.verbose' => 'true',
  'elasticsearch.requestHeadersWhitelist' => '[ authorization ]',
}
```

## Usage

It is recommended to use resources directly.

## Examples
You may see examples in fixture cookbook:
[test/fixtures/kibana5-test/recipes/default.rb](test/fixtures/kibana5-test/recipes/default.rb)
[test/fixtures/kibana5-test/recipes/nginx.rb](test/fixtures/kibana5-test/recipes/nginx.rb)

## Authors
- Author:: Azat Khadiev (anuriq@gmail.com)

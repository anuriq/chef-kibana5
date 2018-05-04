## 1.6.0 (4 May, 2018)
  - kibana-plugins are executed from service user
  - allow newest version of `systemd` cookbook
  - fix an issue with helpers for Chef 14
  - rename kitchen.docker.yml to dokken and make it a default testing suite
  - fix issues to make Travis CI builds work

## 1.5.0 (26 Feb, 2018)
  - Fix style according to newest Cookstyle and FoodCritic;
  - Use CentOS 7.4 for testing;
  - Set 5.6.8 as default version of Kibana.

## 1.4.0 (8 Feb, 2018)
  - Add plugin resource;

## 1.3.2 (8 Feb, 2018)
  - Add version 5.6.7 of Kibana;

## 1.3.1 (November 27, 2017)
  - Add option to use custom configuration template from wrapper cookbook;

## 1.3.0 (October 16, 2017)
  - Add version 5.6.2 of Kibana;

## 1.2.0 (August 20, 2017)
  - Add version 5.5.2 of Kibana;
  - Avoid version 3.0 of `systemd` cookbook till it stabilizes.

## 1.1.2 (July 12, 2017)
  - Add reload setting for systemd unit configuration (@kazjote);
  - Fix according to the newest `foodcritic`.

## 1.1.1 (June 20, 2017)
  - Fix use of attributes for default values of resources.

## 1.1.0 (June 8, 2017)
  - Rethink versions and urls placement, move them to helpers instead of attributes;
  - Add some default attributes to simplify configuration control;
  - Remove redundant tests to simplify contributing;
  - Add support for Kibana `5.4.1` and set default version to `5.4.1`.

## 1.0.1 (May 8, 2017)
  - Add support for Kibana `5.4.0`.
  - Set default version of Kibana to `5.4.0`.

## 1.0.0 (April 7, 2017)
  - Set default version of Kibana to `5.3.0`.
  - Change home dir for `kibana` user, this won't run on nodes converged with previous versions, that's why major version is incremented.
  - Add Ubuntu 16.04 for CI testing suites.
  - Configure Travis to ensure CI.

## 0.2.2 (March 9, 2017)
  - Set default version of Kibana to 5.2.2
  - Add some default attributes

## 0.2.1 (February 17, 2017)
  - Set default version of Kibana to 5.2.1

## 0.2.0 (February 14, 2017)
  - Initial cookbook. See README.

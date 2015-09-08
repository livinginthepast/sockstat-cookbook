# sockstat-cookbook

Install sockstat from source. See https://github.com/bahamas10/illumos-sockstat for more information.

## Supported Platforms

* SmartOS

## Usage

Add to Berksfile:

```
cookbook 'sockstat'
cookbook 'sockstat', git: 'git://github.com/livinginthepast/sockstat-cookbook.git'
```

Add to a runlist:

```
include_recipe 'sockstat'
```

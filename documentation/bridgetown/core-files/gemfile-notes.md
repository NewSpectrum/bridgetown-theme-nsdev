# About Gems

<!-- TOC -->


<br />

---

# Gems Overview

## The Gemfile

Your project's [Gemfile](https://bundler.io/v1.12/man/gemfile.5.html) is a crucial configuration file written in the [Ruby](https://ruby-lang.org) language. The `Gemfile` is used by [Bundler](https://bundler.io), the dependency manager for [RubyGems](https://rubygems.org/), to ensure all [gem dependencies](#gem-dependencies) are satisfied.


### The `Gemfile.lock`
> __Warning__<br />
> The `Gemfile.lock` __*is not*__ meant to be manually/directly edited. You should only "modify" the `Gemfile.lock` by using the `bundle` CLI tool, and/or by modifying the `Gemfile` directly (followed by the `bundle` command).

[Bundler](https://bundler.io) also automatically generates (and/or updates) the project's [`Gemfile.lock`](https://bundler.io/guides/rationale.html) after installing Gems from the `Gemfile`, or when modifying the Gem Dependencies with commands like `bundle add`.

The `Gemfile.lock` is a __manifest file__ that lists each of the project's Gems, their versions, and their depenencies. If you are familiar with [NodeJS](https://nodejs.org), the `Gemfile.lock` is similar to (but not quite the same as) the [`package-lock.json`](https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json) file used by the [Node Package Manager (NPM)](https://npmjs.com) and [Yarn](https://yarnpkg.com/).


## Gem Sources
> __Warning__<br />
> The sources that are defined in the Gemfile by default should not be modified or removed, though additional sources can be defined.

The default `source` for Gems in this and almost every other Ruby-based project is the official [RubyGems Website](https://rubygems.org/):

```ruby
source "https://rubygems.org"
```

A `git_source` is also defined by Bridgetown automatically, which can be used to install Gems from their [GitHub](https://github.com) repositories. To install a Gem from GitHub, add `repo: <user|org>/repository_name` after a Gem's name.

### GitHub Gem Examples
#### Gemfile
```ruby
gem "MyGem", repo: "MyUsername/MyGem"
gem "CorpGem", repo: "MyOrganization/CorpGem"
```


<br />

---

# Plugins
> __Note__<br />
> To install a plugin, run:
> <pre lang="bash">bundle add new-plugin-name -g bridgetown_plugins</pre>
> This will ensure the plugin is added to the correct Bundler group.<br />
> &nbsp;&nbsp;&nbsp;&nbsp;*-Original Note*

As the above note indicates, [Bridgetown Plugins](https://bridgetownrb.com/plugins) should be added to the `bridgetown_plugins` [Gem Group](url) in your Gemfile. The easiest way, especially if you are't very confident in the [Ruby Language](https://ruby-lang.org), is to use the command from the original Gemfile Notes:

```bash
bundle add new-plugin-name -g bridgetown_plugins
```


<!--
When you run Bridgetown commands, we recommend using a binstub like so:
bin/bridgetown start (or console, etc.)
is will help ensure the proper Bridgetown version is running.
-->
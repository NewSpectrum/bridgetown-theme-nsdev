# About Gems

<!-- TOC -->


<br />

---

# Gems Overview

## The Gemfile

Your project's [Gemfile](https://bundler.io/v1.12/man/gemfile.5.html) is a crucial configuration file written in the [Ruby](https://ruby-lang.org) language. The [`Gemfile`](/Gemfile) is used by [Bundler](https://bundler.io), the dependency manager for [RubyGems](https://rubygems.org/), to ensure all [gem dependencies](#gem-dependencies) are satisfied.

To create a hyperlink to a file and have it open in VSCode, use the following syntax: `[filename](path/to/file)`.

### The `Gemfile.lock`
> __Warning__<br />
> The `Gemfile.lock` __*is not*__ meant to be manually/directly edited. You should only "modify" the `Gemfile.lock` by using the `bundle` CLI tool, and/or by modifying the `Gemfile` directly (followed by the `bundle` command).

[Bundler](https://bundler.io) also automatically generates (and/or updates) the project's [`Gemfile.lock`](https://bundler.io/guides/rationale.html) after installing Gems from the `Gemfile`, or when modifying the Gem Dependencies with commands like `bundle add`.

The `Gemfile.lock` is a __manifest file__ that lists each of the project's Gems, their versions, and their depenencies. If you are familiar with [NodeJS](https://nodejs.org), the `Gemfile.lock` is similar to (but not quite the same as) the [`package-lock.json`](https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json) file used by the [Node Package Manager (NPM)](https://npmjs.com) and [Yarn](https://yarnpkg.com/).


<details>
<summary>
<h2 style="display: inline">Original Gemfile</h2>
</summary>

```ruby
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

####
# Welcome to your project's Gemfile, used by Rubygems & Bundler.
#
# To install a plugin, run:
#
#   bundle add new-plugin-name -g bridgetown_plugins
#
# This will ensure the plugin is added to the correct Bundler group.
#
# When you run Bridgetown commands, we recommend using a binstub like so:
#
#   bin/bridgetown start (or console, etc.)
#
# This will help ensure the proper Bridgetown version is running.
####

# If you need to upgrade/switch Bridgetown versions, change the line below
# and then run `bundle update bridgetown`
gem "bridgetown", "~> 1.3.0.beta1"

# Uncomment to add file-based dynamic routing to your project:
# gem "bridgetown-routes", "~> 1.3.0.beta1"

# Puma is the Rack-compatible web server used by Bridgetown
# (you can optionally limit this to the "development" group)
gem "puma", "< 7"

# Uncomment to use the Inspectors API to manipulate the output
# of your HTML or XML resources:
gem "nokogiri", "~> 1.13"
```
</details>



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
/-->
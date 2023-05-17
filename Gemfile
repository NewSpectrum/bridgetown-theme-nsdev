source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# The original notes from this file have been moved to the 'gemfile-notes.md' documentation file.

ruby '3.0.2'

group :development, :test do
	gem 'appmap'
end

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

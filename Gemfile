source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# The original notes from this file have been moved to the 'gemfile-notes.md' documentation file.

ruby '3.0.2'

group :development, :test do
	gem 'appmap'
end

gem "bridgetown", "~> 1.3.0.beta1"
gem "puma", "< 7"
gem "nokogiri", "~> 1.13"


group :test, optional: true do
  gem "nokogiri", "~> 1.13"
  gem "minitest"
  gem "minitest-profile"
  gem "minitest-reporters"
  gem "shoulda"
  gem "rails-dom-testing"
end

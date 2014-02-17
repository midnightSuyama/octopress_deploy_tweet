octopress_deploy_tweet
======================

Octopress - Deploy task with tweet

## Install

	$ cd octopress
	$ git clone git://github.com/midnightSuyama/octopress_deploy_tweet.git

### Add to Gemfile

```
gem 'nokogiri'
gem 'twitter'
```

### Add to Rakefile

```
require File.expand_path('../octopress_deploy_tweet/task', __FILE__)
```

### Setup Twitter in `task.rb`

```
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = YOUR_CONSUMER_KEY
  config.consumer_secret     = YOUR_CONSUMER_SECRET
  config.access_token        = YOUR_ACCESS_TOKEN
  config.access_token_secret = YOUR_ACCESS_TOKEN_SECRET
end
```

## Usage

	$ rake deploy_tweet

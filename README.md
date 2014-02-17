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
Twitter.configure do |config|
  config.consumer_key       = YOUR_CONSUMER_KEY
  config.consumer_secret    = YOUR_CONSUMER_SECRET
  config.oauth_token        = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end
```

## Usage

	$ rake deploy_tweet

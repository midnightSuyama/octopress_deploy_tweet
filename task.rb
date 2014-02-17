# Add to Gemfile
# gem 'nokogiri'
# gem 'twitter'

# Add to Rakefile
# require File.expand_path('../octopress_deploy_tweet/task', __FILE__)

require 'open-uri'
require 'nokogiri'
require 'twitter'

desc "Deploy task with tweet"
task :deploy_tweet do
  twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = YOUR_CONSUMER_KEY
    config.consumer_secret     = YOUR_CONSUMER_SECRET
    config.access_token        = YOUR_ACCESS_TOKEN
    config.access_token_secret = YOUR_ACCESS_TOKEN_SECRET
  end

  tweets = []
  FILENAME = 'atom.xml'
  doc = Nokogiri::XML(open("public/#{FILENAME}"))
  url = doc.at('id').text + FILENAME
  last_entry_id = Nokogiri::XML(open(url)).at('entry id').text
  entries = doc.css('entry')
  entries.each do |entry|
    unless entry.at('id').text == last_entry_id
      tweets << ("%s %s" % [entry.at('title').text, entry.at('id').text])
    else
      break
    end
  end
  tweets.reverse!

  Rake::Task[:deploy].execute

  tweets.each_with_index do |tweet, index|
    sleep(1) unless index == 0
    puts "Tweet: #{tweet}"
    twitter.update(tweet)
  end
end

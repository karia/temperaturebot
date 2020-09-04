#!/usr/bin/env ruby

require 'twitter'

client = Twitter::REST::Client.new do |conf|
  conf.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  conf.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  conf.access_token = ENV['TWITTER_ACCESS_TOKEN']
  conf.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

number = `/usr/local/bin/temper | cut -d ',' -f 2`

tweet = Time.now.strftime("%Y-%m-%d %H:%M").to_s + ' 現在の室温：' + number.to_f.round(1).to_s
client.update(tweet)


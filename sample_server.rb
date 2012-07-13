#!/usr/bin/env ruby
require "bundler/setup"
require "pathological"
require "sinatra"

get "/" do
  "Sample server is here."
end
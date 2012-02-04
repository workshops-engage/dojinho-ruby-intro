require 'sinatra'
require File.expand_path('../reader',  __FILE__)

get '/time/:time' do
  @block = find_block_by_time(params[:time])
  erb :block, layout: false
end

get '/index/:index' do
  @block = find_block_by_index(params[:index].to_i)
  erb :block, layout: false
end
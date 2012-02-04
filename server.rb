require 'sinatra'
require File.expand_path('../reader',  __FILE__)

get '/time/:time' do
  @time = params[:time]
  @block = find_block_by_time(@time)
  erb :block
end

get '/index/:index' do
  @block = find_block_by_index params[:index].to_i
  erb :block
end
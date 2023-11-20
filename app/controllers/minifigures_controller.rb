
require 'net/http'
require 'uri'
require 'json'

class MinifiguresController < ApplicationController
  def index
    @minifigures = fetch_minifigures(params[:search])
    render 'home/descubre'
  end

  private

  def fetch_minifigures(search_query)
    uri = URI('https://rebrickable.com/api/v3/lego/minifigs/')
    params = {search: search_query }
    uri.query = URI.encode_www_form(params)

    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'
    request['Authorization'] = 'key 98df41625bd7a120947a73be4adf06a7'

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    puts response.body
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)['results']
    else
      []
    end
  end
end

  
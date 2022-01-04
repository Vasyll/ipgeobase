# frozen_string_literal: true

require_relative "ipgeobase/version"

require "net/http"
require "addressable/uri"
require "happymapper"

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    xmlfile = Net::HTTP.get(uri)
    IpMetadata.parse(xmlfile)
  end

  class IpMetadata
    include HappyMapper

    tag "query"
    element :city, String, tag: "city"
    element :country, String, tag: "country"
    element :countryCode, String, tag: "countryCode"
    element :lat, String, tag: "lat"
    element :lon, String, tag: "lon"
  end
end

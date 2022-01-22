# frozen_string_literal: true

require_relative "ipgeobase/version"
require_relative "ipmetadata"

require "net/http"
require "addressable/uri"

# The gem contains a lookup ('8.8.8.8') method that takes an IP address and returns a metadata object.
module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    xmlfile = Net::HTTP.get(uri)
    IpMetadata.parse(xmlfile)
  end
end

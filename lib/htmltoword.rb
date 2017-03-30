# encoding: UTF-8
require 'nokogiri'
require 'zip'
require 'open-uri'
require_relative 'htmltoword/configuration'

module Htmltoword
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    alias_method :config, :configuration
  end
end

require_relative 'htmltoword/version'
require_relative 'htmltoword/helpers/templates_helper'
require_relative 'htmltoword/helpers/xslt_helper'
require_relative 'htmltoword/document'

if defined?(Rails)
  require_relative 'htmltoword/renderer'
  require_relative 'htmltoword/railtie'
end

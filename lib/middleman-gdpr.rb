require 'middleman-sprockets'

module Middleman
  module Gdpr

  end
end

Middleman::Extensions.register :gdpr do
  require 'middleman-gdpr/version'
  require 'middleman-gdpr/extension'

  Middleman::Gdpr::Extension
end

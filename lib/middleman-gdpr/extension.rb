module Middleman
  module Gdpr
    class Extension < Extension
      # def initialize(app, options_hash={}, &block)
      #   super
      # end

      def after_configuration
        raise "\e[91mGDPR: Sprockets extension not activated. Please activate Sprockets in config.rb\e[39m" if sprockets.blank?
        raise "\e[91mGDPR: I18n extension not activated. Please activate I18n in config.rb\e[39m" if i18n.blank?

        ['source/stylesheets', 'source/javascripts', 'node_modules'].each do |path|
          sprockets.environment.append_path root + path
        end

        I18n.load_path.concat Dir[root + 'locales/*.yml']
      end

      def root
        self.class.root
      end

      helpers do
        def gdpr(partial)
          template = Middleman::Gdpr::Extension.template_for partial
          raise "GDPR: \"#{partial}\" partial doesn't exist" if template.blank?
          return ERB.new(template).result binding
        end
      end

      class << self
        def root
          Pathname.new(__dir__) + '../..'
        end

        def template_for(partial)
          partial = File.basename(partial.to_s)
            .sub(/\A_/, '')
            .sub(/\.(html|erb|html\.erb)\z/, '')

          path = root + "source/gdpr/_#{partial}.html.erb"

          return File.read path if File.exists? path
        end
      end

      private

      def sprockets
        @app.extensions[:sprockets]
      end

      def i18n
        @app.extensions[:i18n]
      end
    end
  end
end

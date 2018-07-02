module Middleman
  module Gdpr
    class Extension < Extension
      # def initialize(app, options_hash={}, &block)
      #   super
      # end

      def after_configuration
        puts "\e[91mGDPR: Sprockets extension not found, GDPR extension has not been activated\e[39m" and return if sprockets.blank?
        puts "\e[91mGDPR: I18n extension not found, GDPR extension has not been activated\e[39m" and return if i18n.blank?

        ['source/stylesheets', 'source/javascripts', 'node_modules'].each do |path|
          sprockets.environment.append_path root + path
        end

        I18n.load_path.concat Dir[root + 'locales/*.yml']
      end

      def root
        Pathname.new(__dir__) + '../..'
      end

      helpers do
        def gdpr
          <<~HTML
            <div class="gdpr__cookie_consent js-gdpr__cookie_consent">
              <div class="gdpr__cookie_consent__text">
                #{t 'gdpr.cookie_consent.text'}
                <br />
                #{t 'gdpr.cookie_consent.learn_more_html', link: t('gdpr.privacy_policy')}
              </div>
              <div class="gdpr__cookie_consent__buttons">
                <button class="gdpr__cookie_consent__buttons__ok js-gdpr__cookie_consent__buttons__ok"> #{t 'gdpr.cookie_consent.button' }</button>
              </div>
            </div>
          HTML
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

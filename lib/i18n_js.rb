require "i18n_extensions"
module I18nJs

  JAVASCRIPT = File.read(File.join(File.dirname(__FILE__), 'javascripts', 'i18n.js'));

  def self.generate
    Lucy.generate("locales") do |g|
      g.namespace = "I18n"
      g[:defaultLocale] = default_locale
      g[:translations] = translations
      g << methods
    end
  end

  def self.translations
    I18n.all_translations
  end

  def self.default_locale
    I18n.default_locale
  end

  def self.methods
    JAVASCRIPT
  end

end

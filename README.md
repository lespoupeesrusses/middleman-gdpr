# Middleman GDPR
Helps getting your Middleman website GDPR compliant

## Installation
Add this line to your Gemfile:

```ruby
gem 'middleman-gdpr'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install middleman-gdpr
```

Activate [Sprockets](https://github.com/middleman/middleman-sprockets):
```ruby
# config.rb
activate :sprockets
```

Activate [I18n](https://middlemanapp.com/advanced/localization/):
```ruby
# config.rb
activate :i18n
```

Add this to layout:
```ruby
  <%= render 'gdpr/cookie_consent' %>
```

Add this to javascripts:
```js
//= require gdpr/cookie_consent
```

Add this to stylesheets:
```sass
@import 'gdpr/cookie_consent'
```

Set the privacy policy url in the locales.

## Checklist

https://www.eugdpr.org/

- [x] Cookie consent
- [ ] Privacy policy
- [ ] There must be an optin
- [ ] Optin must be unchecked by default
- [ ] Account must be deletable
- [ ] Users must have access to their data
- [ ] Users must be able to modify their data 

## Thanks

Inspired by cookies_eu (https://github.com/infinum/cookies_eu), thank you :)

## Contributing
Feel free to pull request!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

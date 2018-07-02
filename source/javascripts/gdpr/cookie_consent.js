//= require js-cookie/src/js.cookie

window.addEventListener('load', function() {
  var gdprCookieConsent = document.querySelector('.js-gdpr__cookie_consent');

  if(!gdprCookieConsent) return;
  var COOKIE_KEY = 'gdpr.cookie_consent.ok'

  var remove = function() {
    if(gdprCookieConsent.parentNode) gdprCookieConsent.parentNode.removeChild(gdprCookieConsent);
  }

  if(Cookies.get(COOKIE_KEY) === 'true') remove()
  else {
    gdprCookieConsent.querySelector('.js-gdpr__cookie_consent__buttons__ok').addEventListener('click', function() {
      Cookies.set(COOKIE_KEY, true, {path: '/', expires: 365});
      remove()
    });
  }
});

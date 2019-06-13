//= require js-cookie/src/js.cookie

window.addEventListener('load', function() {
    var cookieKey = 'gdpr.cookie_consent.ok',
        cookieAlreadySet = Cookies.get(cookieKey) === 'true';
        gdprCookieConsent = document.querySelector('.js-gdpr__cookie_consent');

    if(!gdprCookieConsent) {
        return;
    }

    if (!cookieAlreadySet) {
        gdprCookieConsent.classList.add('gdpr__cookie_consent--necessary');
        gdprCookieConsent.querySelector('.js-gdpr__cookie_consent__buttons__ok').addEventListener('click', function() {
            Cookies.set(cookieKey, true, {path: '/', expires: 365});
            if (gdprCookieConsent.parentNode) {
                gdprCookieConsent.parentNode.removeChild(gdprCookieConsent)
            };
        });
    }
});

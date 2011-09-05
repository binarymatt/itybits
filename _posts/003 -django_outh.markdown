---
categories: Python, Django
date: 2011/09/01 20:34:00
title: Django Oauth Access
---
Recently I had the experience of utilizing the django-oauth-access library from the team at Eldarion. The documentation is a work in progress, so
I thought I would share some tips getting it to work.

The first step after following the installation instructions is creating the OAUTH_ACCESS_SETTINGS entry in settings.py:

$$code(lang=python, style=native)
OAUTH_ACCESS_SETTINGS = {
    'twitter':{
        'keys': {
            'KEY': '<Consumer Key>',
            'SECRET': '<Consumer Secret>'
        },
        'endpoints': {
            'access_token': 'https://api.twitter.com/oauth/access_token',
            'request_token':'https://api.twitter.com/oauth/request_token',
            'authorize': 'https://api.twitter.com/oauth/authenticate',
            'provider_scope':'',
            'callback': 'account.oauth_callbacks.twitter_callback'
        }
    },
    'facebook': {
        'keys': {
            'KEY': '<App ID>',
            'SECRET': '<App Secret>',
        },
        'endpoints': {
            'access_token': 'https://graph.facebook.com/oauth/access_token',
            'authorize': 'https://graph.facebook.com/oauth/authorize',
            'provider_scope': '',
            'callback': 'account.oauth_callbacks.facebook_callback',
        }
    },
    'google': {
    }
}
$$/code


$$code(lang=python, style=native)
import this
if __name__ == "main":
    print "Hello, World!"
$$/code

<p>Some Python, in the default <i>murphy</i> style:
$$code(lang=python)
def test():
    for x in "Hello, Python!":
        print x.upper(),
    print "done"
$$/code
</p>


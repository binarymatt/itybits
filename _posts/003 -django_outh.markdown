---
categories: Python, Django
date: 2011/09/01 20:34:00
title: Django Oauth Access
---
Recently I had the experience of utilizing the [django-oauth-access](https://github.com/eldarion/django-oauth-access) library from the team at [Eldarion](http://eldarion.com/). The documentation is a work in progress, so
I thought I would share some tips getting it to work.

The first step after following the installation instructions is creating the OAUTH_ACCESS_SETTINGS entry in settings.py:

$$code(lang=python, style=default)
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
}
$$/code

So what's included in this setting? You can see that each oauth provider we want to connect with has a stanza and each stanza has two sections. 
First we have the key and secret provided by both twitter and facebook for connecting with their api. Usually this is application 
specific and will be different for each app you create. The second part are the endpoints for communication between your app 
and the oauth provider. The endpoint section also includes the important callback, which is the code that your application provides
for local authentication and account creation. Let's head over to the callback section.

$$code(lang=python, style=default)
from oauth_access.callback import AuthenticationCallback
class BasicCallback(AuthenticationCallback):
    def handle_no_user(self, request, access, token, user_data):
        return self.create_user(request, access, token, user_data)
    def create_user(self, request, access, token, user_data):
        identifier = self.identifier_from_data(user_data)
        user = User(username=str(identifier))
        user.set_unusable_password()
        user.save()
        self.login_user(request, user)
        return user
    def redirect_url(self, request):
        return request.user.get_profile().get_absolute_url()

class TwitterCallback(BasicCallback):
    def identifier_from_data(self, data):
        return "twitter-%s" % data['id']
    def fetch_user_data(self, request, access, token):
        url = 'https://twitter.com/account/verify_credentials.json'
        return access.make_api_call("json", url, token)

twitter_callback = TwitterCallback()
$$/code

As you can see, it's not that complicated. I've created a base class that all my 
provider specific classes inherit from. In the base class, you can handle 
application specific logic like creating the user and redirecting urls. Django oauth access
provides all the authentication details and uses your callbacks when no
user exists and when it needs to redirect after authentication.

Finally, I'd like to thank the guys over at Eldarion for creating and releasing this package.
It's made it a lot easier to integrate django projects with oauth providers.

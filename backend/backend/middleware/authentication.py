from django.contrib import auth
from django.utils.functional import SimpleLazyObject

def get_user(request):
    if not hasattr(request, '_cached_user'):
        request._cached_user = auth.get_user(request)
    return request._cached_user

class AuthenticationMiddleware:
    def resolve(self, next, root, info, **args):
        context = info.context
        context.user = SimpleLazyObject(lambda: get_user(context))
        return next(root, info, **args)

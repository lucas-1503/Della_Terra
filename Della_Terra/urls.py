from django.contrib import admin
from django.urls import path, re_path, include
import debug_toolbar
from rest_framework.authtoken.views import obtain_auth_token
from Della_Terra import views

urlpatterns = [
    path('__debug__/', include(debug_toolbar.urls)),
    path("admin/", admin.site.urls),
    re_path('della_terra/(?P<version>(v1|v2))/', include('order.urls')),
    re_path('della_terra/(?P<version>(v1|v2))/', include('product.urls')),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
    path("update_server/", views.update, name="update"),
    path("hello/", views.hello_world, name="hello_world"),
]

from django.contrib import admin
from django.urls import path, re_path, include
import debug_toolbar

urlpatterns = [
    path('__debug__/', include(debug_toolbar.urls)),
    path("admin/", admin.site.urls),
    re_path('della_terra/(?P<version>(v1|v2))/', include('order.urls')),
    re_path('della_terra/(?P<version>(v1|v2))/', include('product.urls')),
]

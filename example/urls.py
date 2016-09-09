from django.conf.urls import patterns,url
from example import views


urlpatterns= [
            url('^example$',views.index,name='index'),
            url('^example/janakiraman$',views.janakiraman,name='jankiraman'),
]

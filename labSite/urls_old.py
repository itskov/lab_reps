from django.conf.urls import patterns, include, url
import Services.urls
import WormRepository.urls

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'labSite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^services/', include(Services.urls)),
    url(r'^services/', include(Services.urls)),
    url(r'^wormrep/', include(WormRepository.urls)),
	
)

from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'labSite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'exportWormStrains/', 'WormRepository.views.exportWormStrains'),

)


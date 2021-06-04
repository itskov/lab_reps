from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'labSite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'updateBoxes/(?P<entityId>\d+)/', 'Services.views.updateBoxes'),
    url(r'getBoxesList/(?P<entityId>-?\d+)/','Services.views.getBoxesList'),
    url(r'updateBox/(?P<boxId>\d+)/(?P<entityId>\d+)/', 'Services.views.updateBox'),
    url(r'submitBox/(?P<boxId>\d+)/(?P<entityId>\d+)/', 'Services.views.submitBox'),
    url(r'exportWormBox/(?P<boxId>\d+)/', 'Services.views.exportWormBox'),
    url(r'exportAllWormBoxes/', 'Services.views.exportAllWormBoxes'),
    url(r'showInitializeStrain/(?P<entityId>\d+)/', 'Services.views.showInitializeStrain'),
    url(r'initializeWormStrain/(?P<entityId>\d+)/', 'Services.views.initializeWormStrain'),
)


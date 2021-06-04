from django.conf.urls import include, url
from Services.views import *

urlpatterns = [
    # Examples:
    # url(r'^$', 'labSite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'updateBoxes/(?P<entityId>\d+)/', updateBoxes, name="updateBoxes"),
    url(r'getBoxesList/(?P<entityId>-?\d+)/',getBoxesList, name="getBoxesList"),
    url(r'updateBox/(?P<boxId>\d+)/(?P<entityId>\d+)/', updateBox, name="updateBox"),
    url(r'submitBox/(?P<boxId>\d+)/(?P<entityId>\d+)/', submitBox, name="submitBox"),
    url(r'exportWormBox/(?P<boxId>\d+)/', exportWormBox, name="exportWormBox"),
    url(r'exportAllWormBoxes/', exportAllWormBoxes, name="exportAllWormBoxes"),
    url(r'showInitializeStrain/(?P<entityId>\d+)/', showInitializeStrain, name="showInitializeStrain"),
    url(r'initializeWormStrain/(?P<entityId>\d+)/', initializeWormStrain, name="initializeWormStrain"),]

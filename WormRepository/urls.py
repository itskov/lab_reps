from django.conf.urls import include, url
from WormRepository.views import *


urlpatterns = [
    # Examples:
    # url(r'^$', 'labSite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'exportWormStrains/', exportWormStrains, name="exportWormStrains"),]


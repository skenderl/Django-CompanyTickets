from django.conf.urls import url
from django.urls import path, include
from django.contrib import admin
from django.contrib.auth import views as auth_views
from mysite import views as core_views
from django.views.generic.base import TemplateView
from django.views.generic import UpdateView
from .models import *
from .forms import *

urlpatterns = [
    url(r'^newticket/$', core_views.newticket, name='newticket'),
    url(r'^newdepartement/$', core_views.newdepartement, name='newdepartement'),
    url(r'^newmateriel/$', core_views.newmateriel, name='newmateriel'),
    url(r'^signup/$', core_views.signup, name='signup'),
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', auth_views.logout, {'next_page': '/'}, name='logout'),
    url(r'^password/$', core_views.change_password, name='change_password'),
    url(r'^email/$', core_views.change_email, name='change_email'),
    url(r'^mytickets/$', core_views.my_tickets, name='my_tickets'),
    url(r'^fortickets/$', core_views.for_tickets, name='for_tickets'),
    url(r'^alltickets/$', core_views.all_tickets, name='all_tickets'),
    url(r'^allusers/$', core_views.all_users, name='all_users'),
    url(r'^deletedusers/$', core_views.deleted_users, name='deleted_users'),
    path('home/', core_views.home, name='home'),
    path('resolved/', core_views.resolved, name='resolved'),
    path('', core_views.index, name='index'),
    path('changeStatus/<int:id_ticket>/<str:redi>', core_views.changeStatus),
    path('ticket/edit/<int:id_ticket>', core_views.editTicket),
    path('deleteTicket/<int:id_ticket>/<str:redi>', core_views.deleteTicket),
    path('deleteUser/<int:idu>/<str:redi>', core_views.deleteUser),
    path('user/edit/<int:idu>', core_views.EditUser),
    #path('', TemplateView.as_view(template_name='index.html'), name='index'),
]

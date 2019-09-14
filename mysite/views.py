from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from .models import User, Departement, Ticket, Materiel
from django.contrib.auth import login, authenticate, update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from .forms import *
from django.contrib.auth.decorators import login_required
from django.views.generic.base import TemplateView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template import RequestContext
from datetime import datetime,timedelta
from django.utils import timezone
from django.db.models import Q,CharField
from django.contrib.auth.forms import UserChangeForm


def index(request):
    return render(request, 'index.html', {'date': datetime.now()})

@login_required
def home(request):
    if request.method == 'POST':
         sel = request.POST.get('ordr')
    else:
        sel = '-date_created'
    conditions = [('type', request.user.departement)]
    if 'sel' in request.COOKIES and request.COOKIES['sel'] == sel :
        objets_q = Ticket.objects.all().filter(departement=str(request.user.departement),status=0).order_by(sel)
        sel=sel+"1"
    else:
        objets_q = Ticket.objects.all().filter(departement=str(request.user.departement),status=0).order_by(sel).reverse()
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    page = request.GET.get('page', 1)
    paginator = Paginator(objets_q, 6)
    try:
        tickets = paginator.page(page)
    except PageNotAnInteger:
        tickets = paginator.page(1)
    except EmptyPage:
        tickets = paginator.page(paginator.num_pages)
    dict_resp = {'tickets': tickets,'now': timezone.now(),'mytickets': my_obj,'sel': sel}
    response = render(request, 'home.html', dict_resp)
    if 'sel' in request.COOKIES and request.COOKIES['sel'] == sel:
        response.set_cookie('sel', sel+"1")
    else:
        response.set_cookie('sel', sel)
    return response

@login_required
def resolved(request):
    if request.method == 'POST':
         sel = request.POST.get('ordr')
    else:
        sel = '-date_created'
    conditions = [('type', request.user.departement)]
    if 'sel' in request.COOKIES and request.COOKIES['sel'] == sel :
        objets_q = Ticket.objects.all().filter(departement=str(request.user.departement),status=1).order_by(sel)
        sel=sel+"1"
    else:
        objets_q = Ticket.objects.all().filter(departement=str(request.user.departement),status=1).order_by(sel).reverse()
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    page = request.GET.get('page', 1)
    paginator = Paginator(objets_q, 6)
    try:
        tickets = paginator.page(page)
    except PageNotAnInteger:
        tickets = paginator.page(1)
    except EmptyPage:
        tickets = paginator.page(paginator.num_pages)
    dict_resp = {'tickets': tickets,'now': timezone.now(),'mytickets': my_obj,'sel': sel}
    response = render(request, 'home.html', dict_resp)
    if 'sel' in request.COOKIES and request.COOKIES['sel'] == sel:
        response.set_cookie('sel', sel+"1")
    else:
        response.set_cookie('sel', sel)
    return response

@login_required
def all_users(request):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        cr = Q(is_active=1)
        objets_q = User.objects.all().filter(cr).order_by('-id').reverse()
        page = request.GET.get('page', 1)
        paginator = Paginator(objets_q, 6)
        try:
            userlist = paginator.page(page)
        except PageNotAnInteger:
            userlist = paginator.page(1)
        except EmptyPage:
            userlist = paginator.page(paginator.num_pages)
        sear = None
        if request.method == 'POST':
            search = request.POST.get('search')
            sear_q = User.objects.filter(first_name__icontains=search) | User.objects.filter(id__icontains=search) | User.objects.filter(last_name__icontains=search) | User.objects.filter(departement=search)
            pagei = request.GET.get('pagei', 1)
            paginator = Paginator(sear_q, 6)
            try:
                sear = paginator.page(pagei)
            except PageNotAnInteger:
                sear = paginator.page(1)
            except EmptyPage:
                sear = paginator.page(paginator.num_pages)
        dict_resp = {'userlist': userlist,'now': timezone.now(),'mytickets': my_obj,'sear': sear}
        response = render(request, 'allusers.html', dict_resp)
        return response
    else:
        return redirect('/home/')

@login_required
def signup(request):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        if request.method == 'POST':
            form = SignUpForm(request.POST)
            if form.is_valid():
                form.save()
                dep = form.cleaned_data.get('departement')
                obj = Departement.objects.get(name=dep)
                obj.nbemp = obj.nbemp+1
                obj.save()
                username = form.cleaned_data.get('username')
                raw_password = form.cleaned_data.get('password1')
                #user = authenticate(username=username, password=raw_password)
                #login(request, user)
                return redirect('/home/')
        else:
            form = SignUpForm()
        return render(request, 'signup.html', {'form': form,'mytickets': my_obj})
    else:
        return redirect('/home/')

@login_required
def newticket(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    if request.method == 'POST':
        form = NewTicketForm(request.POST)
        form.set_creator(request.user.id)
        if form.is_valid():
            form.save()
            return redirect('/home/')
    else:
        form = NewTicketForm()
    return render(request, 'newticket.html', {'form': form,'mytickets': my_obj})

@login_required
def changeStatus(request,id_ticket,redi):
    obj = Ticket.objects.get(id=id_ticket)
    if obj.status == 0:
        Ticket.objects.filter(id=id_ticket).update(status=1)
    else:
        Ticket.objects.filter(id=id_ticket).update(status=0)
    return redirect(redi)

@login_required
def editTicket(request,id_ticket):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    obj = Ticket.objects.get(id=id_ticket)
    if request.user.id == obj.creator.id or request.user.is_superuser :
        form = NewTicketForm(request.POST or None, instance=obj)
        if request.method == 'POST' and form.is_valid():
            formData =  request.POST.copy()
            Ticket.objects.filter(id=id_ticket).update(title=formData['title'],type=formData['type'],departement=formData['departement'])
            Ticket.objects.filter(id=id_ticket).update(date_limit=formData['date_limit'],assigned=formData['assigned'],materiel=formData['materiel'])
            Ticket.objects.filter(id=id_ticket).update(content=formData['content'])
            messages.success(request, 'Edit Success!')
            return redirect('/ticket/edit/'+str(id_ticket))
        return render(request, 'ticket.html', {'form': form,'mytickets': my_obj})
    else:
        return redirect('/home/')

@login_required
def deleteTicket(request,id_ticket,redi):
    obj = Ticket.objects.get(id=id_ticket)
    if request.user.id == obj.creator.id or request.user.is_superuser :
        obj.delete()
    return redirect(redi)

@login_required
def my_tickets(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    objets_q = Ticket.objects.all().filter(creator=str(request.user.id))
    page = request.GET.get('page', 1)
    paginator = Paginator(objets_q, 6)
    try:
        tickets = paginator.page(page)
    except PageNotAnInteger:
        tickets = paginator.page(1)
    except EmptyPage:
        tickets = paginator.page(paginator.num_pages)
    dict_resp = {'tickets': tickets,'now': timezone.now(),'mytickets': my_obj}
    response = render(request, 'mytickets.html', dict_resp)
    return response

@login_required
def for_tickets(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    objets_q = Ticket.objects.all().filter(assigned=str(request.user.id))
    page = request.GET.get('page', 1)
    paginator = Paginator(objets_q, 6)
    try:
        tickets = paginator.page(page)
    except PageNotAnInteger:
        tickets = paginator.page(1)
    except EmptyPage:
        tickets = paginator.page(paginator.num_pages)
    dict_resp = {'tickets': tickets,'now': timezone.now(),'mytickets': my_obj}
    response = render(request, 'fortickets.html', dict_resp)
    return response

@login_required
def all_tickets(request):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        objets_q = Ticket.objects.all().order_by('-departement')
        page = request.GET.get('page', 1)
        paginator = Paginator(objets_q, 6)
        try:
            tickets = paginator.page(page)
        except PageNotAnInteger:
            tickets = paginator.page(1)
        except EmptyPage:
            tickets = paginator.page(paginator.num_pages)
        dict_resp = {'tickets': tickets,'now': timezone.now(),'mytickets': my_obj}
        response = render(request, 'all_tickets.html', dict_resp)
        return response
    else:
        return redirect('/home/')

@login_required
def change_password(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, 'Success!')
            return redirect('change_password')
        else:
            messages.error(request, 'Failed!')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'change_password.html', {'form': form,'mytickets': my_obj})

@login_required
def newdepartement(request):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        if request.method == 'POST':
            form = NewDepartementForm(request.POST)
            if form.is_valid():
                form.save()
                return redirect('/home/')
        else:
            form = NewDepartementForm()
        return render(request, 'newdepartement.html', {'form': form,'mytickets': my_obj})
    else:
        return redirect('/home/')

@login_required
def newmateriel(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    if request.method == 'POST':
        form = NewMaterielForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/home/')
    else:
        form = NewMaterielForm()
    return render(request, 'newmateriel.html', {'form': form,'mytickets': my_obj})

@login_required
def change_email(request):
    cr1 = Q(departement=str(request.user.departement))
    cr2 = Q(assigned=str(request.user.id))
    cr3 = Q(status=0)
    my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
    if request.method == 'POST':
        form = UpdateEmailForm(request.POST)
        if form.is_valid():
            userper = request.user
            new = request.POST.get('email')
            if new != userper.email:
                User.objects.filter(id=userper.id).update(email=new)
                messages.success(request, 'Success!')
                return redirect('change_email')
            else:
                messages.error(request, 'Same Email!')
        else:
            messages.error(request, 'Failed!')
    else:
        form = UpdateEmailForm()
    return render(request, 'change_email.html', {'form': form,'mytickets': my_obj})

@login_required
def deleteUser(request,idu,redi):
    if request.user.is_superuser :
        obj = User.objects.get(id=idu)
        if obj.is_active:
            User.objects.filter(id=idu).update(is_active=0)
        else:
            User.objects.filter(id=idu).update(is_active=1)
    return redirect(redi)

@login_required
def deleted_users(request):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        cr = Q(is_active=0)
        objets_q = User.objects.all().filter(cr)
        page = request.GET.get('page', 1)
        paginator = Paginator(objets_q, 10)
        try:
            userlist = paginator.page(page)
        except PageNotAnInteger:
            userlist = paginator.page(1)
        except EmptyPage:
            userlist = paginator.page(paginator.num_pages)
        dict_resp = {'userlist': userlist,'now': timezone.now(),'mytickets': my_obj}
        response = render(request, 'deletedusers.html', dict_resp)
        return response
    else:
        return redirect('/home/')

@login_required
def EditUser(request,idu):
    if request.user.is_superuser:
        cr1 = Q(departement=str(request.user.departement))
        cr2 = Q(assigned=str(request.user.id))
        cr3 = Q(status=0)
        my_obj = Ticket.objects.all().filter(cr1 & cr2 & cr3)
        obj = User.objects.get(id=idu)
        form = UChangeForm(request.POST or None,instance=obj)
        if request.method == 'POST' and form.is_valid():
            formData =  request.POST.copy()
            if formData["is_admin"] == '1':
                User.objects.filter(id=idu).update(is_superuser=1)
            else:
                User.objects.filter(id=idu).update(is_superuser=0)
            User.objects.filter(id=idu).update(username=formData['username'],first_name=formData['first_name'],last_name=formData['last_name'])
            User.objects.filter(id=idu).update(email=formData['email'],departement=formData['departement'])
            messages.success(request, 'Edit Success!')
            return redirect('/user/edit/'+str(idu))
        return render(request, 'edituser.html', {'form': form,'mytickets': my_obj})
    else:
        return redirect('/home/')

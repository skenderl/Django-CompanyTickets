from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth import get_user_model
from datetime import datetime,timedelta

class Departement(models.Model):
    name = models.CharField(max_length=64, blank=False, null=False, primary_key=True)
    nbemp = models.IntegerField(default=0, blank=False, null=False)
    def __str__(self):
        return self.name

class User(AbstractUser):
    departement = models.ForeignKey(Departement, on_delete=models.CASCADE, blank=False, null=False)
    def __str__(self):
        return self.first_name+" "+self.last_name+" ( "+str(self.departement)+" )"
    def fullName(self):
        return self.first_name+" "+self.last_name+" ( "+str(self.departement)+" )"

User = get_user_model()

class Materiel(models.Model):
    name = models.CharField(max_length=64, blank=False, null=False)
    type = models.CharField(max_length=30, blank=True, null=True)
    def __str__(self):
        return self.name

class Ticket(models.Model):
    Dates_choose = (
        (24, '1 Day'),
        (48, '2 Days'),
        (72, '3 Days'),
        (168, 'Week'),
        (720, 'Month'),
    )
    type = models.CharField(max_length=30, blank=False, null=False)
    departement = models.ForeignKey(Departement, on_delete=models.SET('Deleted'), blank=False, null=False)
    materiel = models.ForeignKey(Materiel, on_delete=models.SET('Deleted'), blank=True, null=True)
    creator = models.ForeignKey(User, on_delete=models.SET('Deleted'), blank=True, null=False, related_name='creator')
    assigned = models.ForeignKey(User, on_delete=models.SET('Deleted'), blank=True, null=True, related_name='assigned')
    date_created = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    date_limit = models.IntegerField(choices=Dates_choose, default=24)
    status = models.IntegerField(default=0, blank=True, null=False)
    title = models.CharField(max_length=128, blank=False, null=False)
    content = models.TextField()
    def __str__(self):
        return self.title
    def timelimit(self):
        if self.date_limit == 24:
            val='1 Day'
        elif self.date_limit == 48:
            val='2 Days'
        elif self.date_limit == 72:
            val='3 Day'
        elif self.date_limit == 168:
            val='One Week'
        elif self.date_limit == 720:
            val='One Month'
        return val
    @property
    def dlimit(self):
        return self.date_created + timedelta(days=self.date_limit/24)

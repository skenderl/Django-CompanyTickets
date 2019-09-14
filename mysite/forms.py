from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from mysite.models import *
from django.forms import ModelForm
from datetime import datetime

class SignUpForm(UserCreationForm):
    is_superuser = forms.IntegerField(widget=forms.HiddenInput(), initial=0,required=False)
    is_active = forms.IntegerField(widget=forms.HiddenInput(), initial=1,required=False)
    is_staff = forms.IntegerField(widget=forms.HiddenInput(), initial=0,required=False)
    first_name = forms.CharField()
    last_name = forms.CharField()
    departement = forms.ModelChoiceField(queryset=Departement.objects.all())
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)
        self.fields['departement'].empty_label = "Assign a Departement (Required)"
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'departement', 'password1', 'password2', )
        widgets = {}

class UChangeForm(ModelForm):
    Date_Format = (
    (0, 'Simple User'),
    (1, 'Admin'),
)
    username = forms.CharField()
    first_name = forms.CharField()
    last_name = forms.CharField()
    departement = forms.ModelChoiceField(queryset=Departement.objects.all())
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    is_admin = forms.ChoiceField(widget=forms.RadioSelect(), choices=Date_Format, initial=0)
    def __init__(self, *args, **kwargs):
        super(UChangeForm, self).__init__(*args, **kwargs)
        self.fields['departement'].empty_label = "Assign a Departement (Required)"
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'departement', 'is_admin',)
        widgets = {}

class NewTicketForm(ModelForm):
    class Meta:
        model = Ticket
        creator = forms.IntegerField(widget=forms.HiddenInput(),required=False)
        status = forms.IntegerField(widget=forms.HiddenInput(), initial=0,required=False)
        fields = '__all__'
    def __init__(self, *args, **kwargs):
        super(NewTicketForm, self).__init__(*args, **kwargs)
        self.fields['assigned'].empty_label = "Assign an Employe (optional)"
        self.fields['materiel'].empty_label = "Assign a Materiel (optional)"
        self.fields['departement'].empty_label = "Assign a Departement (Required)"
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')

    def clean(self):
        super(NewTicketForm, self).clean()
        return self.cleaned_data
    def set_creator(self, step):
        data = self.data.copy()
        data['creator'] = step
        self.data = data

class NewDepartementForm(ModelForm):
    nbemp = forms.IntegerField(initial=1,required=False)
    class Meta:
        model = Departement
        fields = '__all__'
    def __init__(self, *args, **kwargs):
        super(NewDepartementForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')

class NewMaterielForm(ModelForm):
    type = forms.CharField(initial='None',required=False)
    class Meta:
        model = Materiel
        fields = '__all__'
    def __init__(self, *args, **kwargs):
        super(NewMaterielForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')

class UpdateEmailForm(ModelForm):
    email = forms.EmailField(required=True)
    class Meta:
        model = User
        fields = ('email',)
    def __init__(self, *args, **kwargs):
        super(UpdateEmailForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = field.label if field.label else field_name.replace('_',' ')

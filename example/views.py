from django.shortcuts import render
from django.http import HttpResponse
from example.models import Example
from django.conf import  settings 
import calendar

# Create your views here.
 
def index(request):
    t=[]
    for i in range(1,12):
        t.append(calendar.HTMLCalendar().formatmonth(2016,i))
    return HttpResponse(t)
    
def janakiraman(request): 
    return render(request,'hello.html',{'name':'janakiraman'})

def form(request):
    return render(request,'form.html')

def thank(request):
    message = request.GET['name']
    phonen   = request.GET['phone']
    b= Example(name=message,phone=phonen)
    b.save()
    return render(request,'hello.html',{'name':message})

def table(request):
    i=Example.objects.all() 
    return render(request,'table.html',{'queryset':i})

def delete(request):
    t=Example.objects.all().delete()
    return HttpResponse(request,"All records are deleted") 

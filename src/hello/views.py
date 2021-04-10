from django.shortcuts import render


def index(request):
    ip = request.META.get('REMOTE_ADDR')
    return render(request, template_name="index.html", context={"ip": ip})


def hello(request):
    return render(request, template_name="hello/index.html")

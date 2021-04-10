from django.shortcuts import render


def index(request):
    return render(request, template_name="index.html")


def hello(request):
    return render(request, template_name="hello/index.html")

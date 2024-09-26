from django.contrib import admin
from django.contrib.admin import ModelAdmin

from todo.models import Task


# Register your models here.

@admin.register(Task)
class TaskAdmin(ModelAdmin):
    pass
from .views import *


from django.urls import path, include, re_path

urlpatterns = [
    # path('item/<int:id>/', change_status),
    path('item/<int:pk>/', TaskView.as_view()),
    path('item/', TaskView.as_view()),
    path('items/', TaskListView.as_view()),
    path('auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]
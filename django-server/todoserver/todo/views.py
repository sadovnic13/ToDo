from django.forms import model_to_dict
from django.shortcuts import render, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters
from django.http import JsonResponse
from rest_framework.exceptions import PermissionDenied
from rest_framework.views import APIView
from .models import Task
from rest_framework.authentication import TokenAuthentication
from rest_framework.generics import CreateAPIView, RetrieveUpdateDestroyAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated

from .serializers import TaskSerializer


class TaskListView(ListAPIView):
    serializer_class = TaskSerializer
    queryset = Task.objects.all()
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    filter_backends = [filters.OrderingFilter]

    ordering_fields = ['create_at', 'finish_date', 'is_ready']
    ordering = ['create_at']

    def get_queryset(self):
        user = self.request.user
        status = self.request.query_params.get('is_ready', "0")
        queryset = Task.objects.all().filter(user_id=user.id)
        if status == '1':
            return queryset.exclude(is_ready=status)
        return queryset


class TaskView(CreateAPIView, RetrieveUpdateDestroyAPIView):
    serializer_class = TaskSerializer
    queryset = Task.objects.all()
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)



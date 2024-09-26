from django.db import models
from django.contrib.auth.models import User
from django.conf import settings


# Create your models here.

# class CustomUser(AbstractUser):
#     pass

# User = get_user_model()


class Task(models.Model):
    create_at = models.DateTimeField(auto_now_add=True)
    title = models.TextField()
    description = models.TextField()
    finish_date = models.DateTimeField()
    is_ready = models.BooleanField(default=False)
    user = models.ForeignKey(User, on_delete=models.PROTECT)

    def __str__(self):
        return f"{self.id} {self.title}"

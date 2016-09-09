from __future__ import unicode_literals

from django.db import models
import calendar

# Create your models here.
class example(models.Model):
      name=models.CharField(max_length=100)
      phone=models.IntegerField()
      def __str__(self):
       return self.name




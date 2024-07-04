from django.db import models

class Category(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    description = models.CharField(max_length=300, blank=True, null=True)
    active = models.BooleanField(default=True)
    
    def __unicode__(self):
        return self.title
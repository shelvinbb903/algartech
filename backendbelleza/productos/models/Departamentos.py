from django.db import models

class Departamentos(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=250)
    descripcion = models.TextField()

    class Meta:
        db_table = "departamentos"

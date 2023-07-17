from django.db import models
from .Departamentos import Departamentos

class Productos(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=250)
    descripcion = models.TextField()
    imagen = models.TextField()
    departamento = models.ForeignKey(Departamentos, on_delete = models.CASCADE)
    cantidad = models.IntegerField()
    valor_unitario = models.DecimalField(decimal_places=2, max_digits=10)

    class Meta:
        db_table = "productos"

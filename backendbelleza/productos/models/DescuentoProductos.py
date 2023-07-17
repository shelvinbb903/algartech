from django.db import models
from .Productos import Productos

class DescuentoProductos(models.Model):
    id = models.AutoField(primary_key=True)
    producto = models.ForeignKey(Productos, on_delete = models.CASCADE)
    cantidad_minima = models.IntegerField()
    cantidad_maxima = models.IntegerField()
    valor = models.DecimalField(decimal_places=2, max_digits=10)

    class Meta:
        db_table = "descuento_productos"
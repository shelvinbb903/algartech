from django.db import models
from .Productos import Productos

class ColoresProductos(models.Model):
    id = models.AutoField(primary_key=True)
    producto = models.ForeignKey(Productos, on_delete = models.CASCADE)
    color = models.CharField(max_length=250)

    class Meta:
        db_table = "colores_productos"
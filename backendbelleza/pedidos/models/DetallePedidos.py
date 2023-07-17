from django.db import models
from .Pedidos import Pedidos
from productos.models.Productos import Productos
from productos.models.ColoresProductos import ColoresProductos

class DetallePedidos(models.Model):
    id = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedidos, on_delete = models.CASCADE)
    producto = models.ForeignKey(Productos, on_delete = models.CASCADE)
    color = models.ForeignKey(ColoresProductos, on_delete = models.CASCADE)
    valor_unitario = models.DecimalField(decimal_places=2, max_digits=10)
    cantidad = models.IntegerField()
    descuento = models.DecimalField(decimal_places=2, max_digits=10)
    total = models.DecimalField(decimal_places=2, max_digits=10)

    class Meta:
        db_table = "detalle_pedidos"
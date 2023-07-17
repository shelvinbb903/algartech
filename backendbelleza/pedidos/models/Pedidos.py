from django.db import models

class Pedidos(models.Model):
    id = models.AutoField(primary_key=True)
    cedula = models.CharField(max_length=20)
    direccion = models.TextField()
    fecha = models.DateField()
    valor_total = models.DecimalField(decimal_places=2, max_digits=10)

    class Meta:
        db_table = "pedidos"
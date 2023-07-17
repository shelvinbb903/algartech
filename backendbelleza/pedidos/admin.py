from django.contrib import admin
from .models.Pedidos import Pedidos
from .models.DetallePedidos import DetallePedidos

# Register your models here.
admin.site.register(Pedidos)
admin.site.register(DetallePedidos)
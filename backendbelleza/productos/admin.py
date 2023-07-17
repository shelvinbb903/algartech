from django.contrib import admin
from .models.Departamentos import Departamentos
from .models.Productos import Productos
from .models.ColoresProductos import ColoresProductos
from .models.DescuentoProductos import DescuentoProductos

# Register your models here.
admin.site.register(Productos)
admin.site.register(Departamentos)
admin.site.register(ColoresProductos)
admin.site.register(DescuentoProductos)
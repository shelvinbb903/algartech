from productos.models.Productos import Productos
from productos.models.ColoresProductos import ColoresProductos
from productos.models.DescuentoProductos import DescuentoProductos
from rest_framework import serializers

class ListColoresSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    producto_id = serializers.IntegerField()
    color = serializers.CharField()

class ListDescuentosSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    producto_id = serializers.IntegerField()
    cantidad_minima = serializers.IntegerField()
    cantidad_maxima = serializers.IntegerField()
    valor = serializers.DecimalField(decimal_places=2, max_digits=10)

class ListProductosSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    nombre = serializers.CharField(max_length=250)
    descripcion = serializers.CharField()
    imagen = serializers.CharField()
    cantidad = serializers.IntegerField()
    valor_unitario = serializers.DecimalField(decimal_places=2, max_digits=10)
    color = serializers.SerializerMethodField()
    descuento = serializers.SerializerMethodField()

    def get_color(self, obj):
        colores = ColoresProductos.objects.filter(producto_id=obj.id)
        serializer = ListColoresSerializer(colores, many=True)
        return serializer.data

    def get_descuento(self, obj):
        descuento = DescuentoProductos.objects.filter(producto_id=obj.id)
        serializer = ListDescuentosSerializer(descuento, many=True)
        return serializer.data
    
    class Meta:
        model = Productos
        fields = ['id', 'nombre', 'descripcion', 'imagen', 'cantidad', 'valor_unitario', 'color']
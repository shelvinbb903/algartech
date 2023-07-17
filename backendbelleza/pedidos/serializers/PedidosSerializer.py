from pedidos.models.Pedidos import Pedidos
from pedidos.models.DetallePedidos import DetallePedidos
from rest_framework import serializers

class PedidosSerializer(serializers.Serializer):
    cedula = serializers.CharField(max_length=20)
    direccion = serializers.CharField(max_length=50)
    fecha = serializers.DateField()
    valor_total = serializers.DecimalField(decimal_places=2, max_digits=10)
    detalle = serializers.ListField()
    
    def create(self, validated_data):
        detalle_crear = validated_data["detalle"]
        del validated_data["detalle"]
        pedido = Pedidos.objects.create(**validated_data)
        
        for item in detalle_crear:            
            detalle = DetallePedidos(pedido_id=pedido.id, producto_id=item['id_producto'], color_id=item['id_color'], valor_unitario=item['valor_unitario'], cantidad=item['cantidad'], descuento=item['descuento'], total=item['total'])
            detalle.save()        
        
        return pedido
    
    class Meta:
        model = Pedidos
        fields = ['cedula', 'direccion', 'fecha', 'valor_total', 'detalle']

class ListPedidoSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    cedula = serializers.CharField(max_length=20)
    direccion = serializers.CharField(max_length=50)
    fecha = serializers.DateTimeField()
    valor_total = serializers.DecimalField(decimal_places=2, max_digits=10)
    
    class Meta:
        model = Pedidos
        fields = ['id', 'cedula', 'direccion', 'fecha', 'valor_total']

class DetallePedidoSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    valor_unitario = serializers.DecimalField(decimal_places=2, max_digits=10)
    cantidad = serializers.IntegerField()
    descuento = serializers.DecimalField(decimal_places=2, max_digits=10)
    total = serializers.DecimalField(decimal_places=2, max_digits=10)
    pedido_id = serializers.IntegerField()
    producto_id = serializers.IntegerField()
    
    class Meta:
        model = DetallePedidos
        fields = ['valor_unitario', 'cedula', 'direccion', 'fecha', 'valor_total']
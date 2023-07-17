from productos.models.Departamentos import Departamentos
from rest_framework import serializers

class ListDepartamentosSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    nombre = serializers.CharField(max_length=250)
    descripcion = serializers.CharField()
    
    class Meta:
        model = Departamentos
        fields = ['id', 'nombre', 'descripcion']
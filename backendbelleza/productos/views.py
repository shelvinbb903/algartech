from django.shortcuts import render
from rest_framework.views import APIView
from django.http import JsonResponse
import json
from rest_framework import status
from django.http import HttpResponse
from productos.models.Departamentos import Departamentos
from productos.models.Productos import Productos
from productos.serializers.DepartamentosSerializer import ListDepartamentosSerializer
from productos.serializers.ProductosSerializer import ListProductosSerializer

class DepartamentosAPPView(APIView):
    def get(self, request):
        response = dict()
        if request.body:            
            data = json.loads(request.body)
        else:
            data = {}            
        
        queryset = Departamentos.objects.filter(**data)
        serializer = ListDepartamentosSerializer(queryset, many=True)
        response["data"] = serializer.data
        return JsonResponse(status=status.HTTP_200_OK, data=response)
    
class ProductosAPPView(APIView):
    def get(self, request):
        response = dict()
        data = {}
        if request.GET.get('departamento_id', None):            
            data = {
                'departamento_id': request.GET.get('departamento_id', None)
            }       
        
        queryset = Productos.objects.filter(**data)
        serializer = ListProductosSerializer(queryset, many=True)
        response["data"] = serializer.data
        return JsonResponse(status=status.HTTP_200_OK, data=response)
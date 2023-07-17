from django.shortcuts import render
from rest_framework.views import APIView
from django.http import JsonResponse
import json
from rest_framework import status
from django.http import HttpResponse
from datetime import date
from .serializers.PedidosSerializer import PedidosSerializer, ListPedidoSerializer

# Vista de los servicios rest de los pedidos
class PedidosAPPView(APIView):
    def post(self, request):
        response = dict()
        if request.body:            
            data = json.loads(request.body)
        else:
            data = {}
            
        data["fecha"] = date.today()
        serializer = PedidosSerializer(data=data)
        """ Se valida si no hay errores la operacion de crear. Si hay errores, se retorna """
        if serializer.is_valid(raise_exception=False):
            pedido = serializer.create(serializer.data)
            serializer_data = ListPedidoSerializer(pedido, many=False)
            
            response["data"] = serializer_data.data
            return JsonResponse(status=status.HTTP_201_CREATED, data=response)
        else:
            response["errors"] = serializer.errors
            return JsonResponse(status=status.HTTP_400_BAD_REQUEST, data=response)

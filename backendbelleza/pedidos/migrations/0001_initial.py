# Generated by Django 3.2.6 on 2023-07-16 19:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('productos', '0002_coloresproductos_descuentoproductos_productos'),
    ]

    operations = [
        migrations.CreateModel(
            name='Pedidos',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('cedula', models.CharField(max_length=20)),
                ('direccion', models.TextField()),
                ('fecha', models.DateField()),
                ('valor_total', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
            options={
                'db_table': 'pedidos',
            },
        ),
        migrations.CreateModel(
            name='DetallePedidos',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('valor_unitario', models.DecimalField(decimal_places=2, max_digits=10)),
                ('cantidad', models.IntegerField()),
                ('descuento', models.DecimalField(decimal_places=2, max_digits=10)),
                ('total', models.DecimalField(decimal_places=2, max_digits=10)),
                ('color', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='productos.coloresproductos')),
                ('pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pedidos.pedidos')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='productos.productos')),
            ],
            options={
                'db_table': 'detalle_pedidos',
            },
        ),
    ]

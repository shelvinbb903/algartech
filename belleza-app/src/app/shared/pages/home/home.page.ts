import { Component, OnInit } from '@angular/core';
import { MenuController, ModalController } from '@ionic/angular';
import { ModalPedidoComponent } from '../modal-pedido/modal-pedido.component';
import { DepartamentosService } from 'src/app/core/services/departamentos.service';
import { ProductosService } from 'src/app/core/services/productos.service';
import { PedidosService } from 'src/app/core/services/pedidos.service';
import { AlertsService } from 'src/app/core/utils/alerts.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  list_menu:any = [];

  constructor(
    private modalCtrl: ModalController, 
    private departamentoSer: DepartamentosService,
    public productosSer: ProductosService,
    private menuCtrl: MenuController,
    public pedidoSer: PedidosService,
    private alertSer: AlertsService
    ) {}
  
  async ngOnInit() {
    await this.alertSer.cargarLoading()
    const {error, data}:any = await this.departamentoSer.getData("/api/departamentos/");
    if(!error) {
      this.list_menu = [...[{id: 0, nombre: "Todos", descripcion: ""}],...data.data]
    }
    
    await this.cargarProductos()
    
  }
  
  /**
   * Metodo para generar el listado de los productos ya sea filtrado por categoria o todos
   * 
   * @param {number} categoria Id de la categoria seleccionada
   */
  cargarProductos = async (categoria: number = 0) => {    
    this.productosSer.listado_productos = []
    let request = {}
    if(categoria != 0) {
      request = {
        departamento_id: categoria
      }
    }

    const {error, data}:any = await this.productosSer.getData("/api/productos/", request);
    if(!error) {
      let productos = [...data.data]
      productos = productos.filter((item: any) => item.color.length > 0)
      this.productosSer.listado_productos = [...productos]
    }
    await this.alertSer.cerrarLoading()
    await this.menuCtrl.close();
    
  }

  /**
   * Metodo para agregar un producto al objeto del pedido actual
   * 
   * @param producto 
   */
  agregarProducto = async (producto: any) => {
    if(producto.color.length == 1){
      this.pedidoSer.color_seleccionado = producto.color[0].id
    }
    if(this.pedidoSer.color_seleccionado != '') {
      const existe_producto = this.pedidoSer.pedido_request.detalle.find((item: any) => item.id_producto == producto.id && item.id_color == this.pedidoSer.color_seleccionado)
      
      if(existe_producto){
        existe_producto.cantidad += 1;
        const porcentaje = existe_producto.descuento / 100;
        const valor = (existe_producto.cantidad * producto.valor_unitario) - ((existe_producto.cantidad * producto.valor_unitario) * porcentaje);
        existe_producto.total = valor;
      } else {
        let descuento = 0;
        
        if(producto.descuento.length > 0) {
          descuento = Number(producto.descuento[0].valor)
        }
        const porcentaje = descuento / 100;
          const valor = producto.valor_unitario - (producto.valor_unitario * porcentaje);
        
        this.pedidoSer.pedido_request.detalle.push({
          nombre: producto.nombre,
          valor_unitario: Number(producto.valor_unitario),
          cantidad: 1,
          descuento: descuento,
          total: valor,
          id_color: this.pedidoSer.color_seleccionado,
          id_producto: producto.id
        })
      }
      
      this.pedidoSer.color_seleccionado = await '';
      await this.generarTotal();

      this.alertSer.generarMensaje("Producto agregado");
    } else {
      this.alertSer.abrirAlerta('Error', 'Debe seleccionar un color')
    }
    
  }

  /**
   * Metodo para hacer el calculo del valor total de los productos agregados en el pedido
   */
  generarTotal = () => {
    this.pedidoSer.pedido_request.valor_total = 0;
    this.pedidoSer.pedido_request.detalle.map((item: any) => {
      this.pedidoSer.pedido_request.valor_total += item.total;
    })
  }

  /**
   * Metodo para seleccionar un color, el cual se agrega al pedido
   * 
   * @param {string} color 
   */
  seleccionarColor = (color:string) => {
    this.pedidoSer.color_seleccionado = color
  }

  /**
   * Metodo para abrir el modal con los datos del pedido actual
   */
  abrirPedido = async () => {
    const modal = await this.modalCtrl.create({
      component: ModalPedidoComponent,
    });
    modal.present();

    const { data, role } = await modal.onWillDismiss();
  }

  /**
   * Metodo para cargar una imagen por defecto en caso de que la imagen iterada del producto no exista
   * 
   * @param img 
   */
  errorImage = (img:any) => {
    img.src = 'assets/icon/producto.svg'
  }
}

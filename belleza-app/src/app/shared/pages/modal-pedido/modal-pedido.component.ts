import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalController } from '@ionic/angular';
import { PedidosService } from 'src/app/core/services/pedidos.service';
import { AlertsService } from 'src/app/core/utils/alerts.service';

@Component({
  selector: 'app-modal-pedido',
  templateUrl: './modal-pedido.component.html',
  styleUrls: ['./modal-pedido.component.scss'],
})
export class ModalPedidoComponent  implements OnInit {

  constructor(
    private modalCtrl: ModalController, 
    private router: Router,
    public pedidoSer: PedidosService,
    private alertaSer: AlertsService
    ) { }

  ngOnInit() {}

  /**
   * Metodo para cerrar el modal del pedido actual
   */
  cerrarVentana = () => {
    return this.modalCtrl.dismiss(null, 'cancel');
  }
  
  /**
   * Metodo para cargar la pagina con los datos de entrega del pedido actual
   */
  irPagar = () => {
    this.modalCtrl.dismiss("Ventana cerrada", 'confirm');
    this.router.navigateByUrl("/pago")    
  }

  /**
   * Metodo para eliminar un producto del pedido actual
   * 
   * @param {number} id Id del producto a eliminar
   */
  quitarProducto = async (id: number) => {
    this.alertaSer.abrirAlertaConfirmacion(
      'Confirmación',
      '¿Desea eliminar este producto del pedido?',
      () => {
        this.pedidoSer.pedido_request.detalle = this.pedidoSer.pedido_request.detalle.filter((item: any) => item.id_producto != id)
      }
    )
  }

  /**
   * Metodo para eliminar todos los productos del pedido actual
   */
  borrarTodos = () => {
    this.alertaSer.abrirAlertaConfirmacion(
      'Confirmación',
      '¿Desea eliminar todos los productos del pedido?',
      () => {
        this.pedidoSer.pedido_request.detalle = []
      }
    )
  }

}

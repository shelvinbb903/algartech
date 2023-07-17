import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PedidosService } from 'src/app/core/services/pedidos.service';
import { AlertsService } from 'src/app/core/utils/alerts.service';

@Component({
  selector: 'app-pago-pedido',
  templateUrl: './pago-pedido.component.html',
  styleUrls: ['./pago-pedido.component.scss'],
})
export class PagoPedidoComponent  implements OnInit {

  constructor(
    private router: Router, 
    public pedidoSer: PedidosService,
    private alertsSer: AlertsService
  ) { }

  ngOnInit() {}

  /**
   * Metodo para cargar la pagina principal y agregar mas productos
   */
  cancel = () => {
    this.router.navigateByUrl("/home")
  }
  
  /**
   * Metodo para consumir el servicio rest de guardar los datos del pedido en la base de datos
   */
  guardar = async () => {
    await this.alertsSer.cargarLoading();

    const {error, data}:any = await this.pedidoSer.registerData('/api/pedidos/', this.pedidoSer.pedido_request)

    if(error) {
      this.alertsSer.abrirAlerta('Error', data.data)
      return;
    }
    await this.alertsSer.cerrarLoading();

    this.router.navigateByUrl("/confirmacion")
  }

}

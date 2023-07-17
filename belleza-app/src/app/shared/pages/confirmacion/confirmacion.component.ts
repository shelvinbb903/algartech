import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PedidosService } from 'src/app/core/services/pedidos.service';

@Component({
  selector: 'app-confirmacion',
  templateUrl: './confirmacion.component.html',
  styleUrls: ['./confirmacion.component.scss'],
})
export class ConfirmacionComponent  implements OnInit {

  constructor(private router: Router, private pedidoSer: PedidosService) { }

  ngOnInit() {
    this.pedidoSer.pedido_request= {
      cedula: "",
      direccion: "",
      valor_total: 0,
      detalle: []
    }
  }

  /**
   * Metodo para volver a la pagina principal al hacer click en el boton
   */
  volver = () => {
    this.router.navigateByUrl("/home")
  }

}

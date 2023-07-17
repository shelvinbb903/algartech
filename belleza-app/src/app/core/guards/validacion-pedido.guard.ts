import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { PedidosService } from '../services/pedidos.service';

@Injectable({
  providedIn: 'root'
})
export class ValidacionPedidoGuard implements CanActivate {
  constructor(private pedidoSer: PedidosService, private router: Router) {}

  async canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Promise<boolean> {

    if(this.pedidoSer.pedido_request.detalle.length == 0) {
      this.router.navigateByUrl('/home')
      return false;
    }  
    return true;
  }
  
}

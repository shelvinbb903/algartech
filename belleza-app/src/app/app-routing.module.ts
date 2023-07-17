import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { HomePage } from './shared/pages/home/home.page';
import { PagoPedidoComponent } from './shared/pages/pago-pedido/pago-pedido.component';
import { ConfirmacionComponent } from './shared/pages/confirmacion/confirmacion.component';
import { ValidacionPedidoGuard } from './core/guards/validacion-pedido.guard';

const routes: Routes = [
  {
    path: 'home',
    component: HomePage
  },
  {
    path: 'pago',
    component: PagoPedidoComponent,
    canActivate: [ValidacionPedidoGuard]
  },
  {
    path: 'confirmacion',
    component: ConfirmacionComponent,
    canActivate: [ValidacionPedidoGuard]
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

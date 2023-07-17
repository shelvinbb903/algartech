import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomePage } from './home/home.page';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';
import { ModalPedidoComponent } from './modal-pedido/modal-pedido.component';
import { PagoPedidoComponent } from './pago-pedido/pago-pedido.component';
import { ComponentsModule } from '../components/components.module';
import { ConfirmacionComponent } from './confirmacion/confirmacion.component';



@NgModule({
  declarations: [HomePage, ModalPedidoComponent, PagoPedidoComponent, ConfirmacionComponent],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ComponentsModule
  ]
})
export class PagesModule { }

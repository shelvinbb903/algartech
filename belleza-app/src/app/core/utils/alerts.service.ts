import { Injectable } from '@angular/core';
import { AlertController, LoadingController, ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class AlertsService {
  loading: any;

  constructor(private alertController: AlertController, private loadingController: LoadingController, private toastController: ToastController) { }
  
  /**
   * Metodo para generar una alerta de confirmación
   * 
   * @param {string} titulo         Titulo a mostrar
   * @param {string} descripcion    Descripcion
   * @param {Function} fnt_aceptar  Metodo a ejecutarse en el evento clic del boton del modal antes de cerrarse
   */
  abrirAlerta = async (titulo: string, descripcion: string, fnt_aceptar: Function = () => {}) => {
    const alert = await this.alertController.create({
      header: titulo,
      message: descripcion,
      buttons: [
        {
          text: 'Okay',
          handler: async () => {
            await fnt_aceptar
          }
        }
      ]
    });
  
    await alert.present();
  }
  
  /**
   * Metodo para generar una alerta de confirmación
   * 
   * @param {string} titulo         Titulo a mostrar
   * @param {string} descripcion    Descripcion
   * @param {Function} fnt_aceptar  Metodo a ejecutarse en el evento clic del boton aceptar antes de cerrarse la alerta
   * @param {Function} fnt_cancelar Metodo a ejecutarse en el evento clic del boton cancelar antes de cerrarse la alerta
   */
  abrirAlertaConfirmacion = async (titulo: string, descripcion: string, fnt_aceptar: Function, fnt_cancelar: Function = () => {}) => {
    const alert = await this.alertController.create({
      header: titulo,
      message: descripcion,
      buttons: [
        {
          text: 'Aceptar',
          handler: async () => {
            await fnt_aceptar()
          }
        },
        {
          text: 'Cancelar',
          role: 'cancel',
          cssClass: 'secondary',
          handler: async () => {
            await fnt_cancelar()
          }
        }
      ]
    });
  
    await alert.present();
  }

  /**
   * Cargar en pantalla un modal con un loading y un mensaje mientras se ejecuta una acción
   */
  cargarLoading = async () => {
    this.loading = await this.loadingController.create({
      message: 'Cargando...',
      spinner: 'bubbles'
    });
    await this.loading.present();    
  }

  /**
   * Cerrar el modal del loading
   */
  cerrarLoading = async () => {
    await this.loading.dismiss();
  }

  /**
   * Generar una notificación en pantalla con un mensaje
   * 
   * @param mensaje 
   */
  async generarMensaje(mensaje: string) {
    const toast = await this.toastController.create({
      message: mensaje,
      duration: 1500,
      color: 'success',
      position: 'top',
      icon: 'information-circle-outline',
      buttons: [
        {
          text: 'X',
          role: 'cancel',
          handler: () => {
            
          },
        },
      ]
    });
    toast.present();
  }
}

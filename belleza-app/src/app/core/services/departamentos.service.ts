import { Injectable } from '@angular/core';
import { RestService } from 'src/app/intranet/connection/rest.service';

@Injectable({
  providedIn: 'root'
})
export class DepartamentosService {

  constructor(private rest: RestService) { }

  /**
   * Consumir el servicio rest de tipo get para listar los departamentos de los productos
   * 
   * @param   {string}  url   URL del servicio
   * @param   {any}     data  Datos que se pasan como parametro. Si no hay se envio un objeto vacio
   * 
   * @return  {Promise<Object>}        Retorna una promesa con un objeto, el cual contiene la respuesta del servicio y un atributo para indicar si se genero error
   */
  getData = (url:string, data: any = {}) => {
    return this.rest.connectionGET(url, data);
  }
}

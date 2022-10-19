import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ActividadesService {

  url: string = "https://localhost:44307/api/";
  constructor(private httpClient: HttpClient) { }

  obtenerActividades(): Observable<any> {
    return this.httpClient.get(this.url + "Actividades/");
  }
  guardarActividad(Actividad: any): Observable<any> {
    return this.httpClient.post(this.url + "Actividades/", Actividad);
  }
}

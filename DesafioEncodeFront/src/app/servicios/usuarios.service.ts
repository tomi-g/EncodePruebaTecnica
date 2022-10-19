import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  url: string = "https://localhost:44307/api/";
  constructor(private httpClient: HttpClient) { }

  obtenerUsuarios(): Observable<any> {
    return this.httpClient.get(this.url + "Usuarios/");
  }

  guardarUsuario(Usuario: any): Observable<any> {
    return this.httpClient.post(this.url + "Usuarios/", Usuario);
  }

  actualizarUsuario(id: number, Usuario: any): Observable<any> {
    return this.httpClient.put(this.url + "Usuarios/" + id, Usuario);
  }

  eliminarUsuario(id: number, Usuario: any): Observable<any> {
    return this.httpClient.put(this.url + "Usuarios/Eliminar/" + id, Usuario);
  }
}

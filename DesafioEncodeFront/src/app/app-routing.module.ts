import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {APP_BASE_HREF} from '@angular/common'
import { InicioComponent } from './componentes/pantallas/inicio/inicio.component';
import { UsuariosComponent } from './componentes/pantallas/usuarios/usuarios.component';
import { ActividadesComponent } from './componentes/pantallas/actividades/actividades.component';

const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot([
    { path: '', redirectTo: '/inicio', pathMatch: 'full' },
    { path: 'inicio', component: InicioComponent },
    { path: 'usuarios', component: UsuariosComponent },
    { path: 'actividades', component: ActividadesComponent },

  ])],
  exports: [RouterModule]
})
export class AppRoutingModule { }

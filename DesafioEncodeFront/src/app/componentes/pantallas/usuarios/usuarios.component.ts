import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActividadesService } from 'src/app/servicios/actividades.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';


@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.scss']
})
export class UsuariosComponent implements OnInit {

  FormReg!: FormGroup;

  AccionABMC = "Agregar";
  submitted = false;

  usuarios: any[] = [];
  usuarioSeleccionado: any;

  Paises: any[] = [
    {id: "ARG", nombre: "ARGENTINA"},
    {id: "BRA", nombre: "BRASIL"},
    {id: "ESP", nombre: "ESPAÑA"},
  ]
  constructor(private formBuilder: FormBuilder,
              private usuariosService: UsuariosService,
              private actividadesService: ActividadesService) { }

  ngOnInit(): void {
    this.FormReg = this.formBuilder.group({
      nombre: [null, [Validators.required, Validators.pattern("^[a-zA-Z ]+$")]],
      apellido: [null, [Validators.required, Validators.pattern("^[a-zA-Z ]+$")]],
      correo_electronico: [null, [Validators.required, Validators.pattern("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")]],
      fecha_nacimiento: [null, [Validators.required, Validators.pattern("(19|20)[0-9]{2}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])")]],
      telefono: [null, [Validators.pattern("^[0-9]+$")]],
      pais: [null, [Validators.required]],
      contacto: [null, [Validators.required]],
    });

    this.obtenerUsuarios();
  }

  obtenerUsuarios() {
    this.usuariosService.obtenerUsuarios().subscribe((res: any) => {
      this.usuarios = res;
      console.log(res);
    });
  }

  guardar() {
    //Para validacion de campos
    this.submitted = true;
    if (this.FormReg.invalid) {
      return;
    }
    const Usuario = { ...this.FormReg.value, activo: true };

    //Dependiendo la accion es el metodo que se ejecuta
    if (this.AccionABMC == "Agregar") {
      this.usuariosService.guardarUsuario(Usuario).subscribe((res: any) => {
        if (res) {
          //Resto 3 horas a la fecha actual porque cuando pasa a Net Core se le suman.
          let fecha = new Date();
          fecha.setHours(fecha.getHours() - 3);
          const Actividad = { 
            create_date: fecha,
            id_usuario: res.id,
            actividad: "Creación de usuario"
          };
          // Si todo salió ok actualizo la lista de usuarios y le informo al cliente.
          this.actividadesService.guardarActividad(Actividad).subscribe((act: any) => {
            if (act.ok) {
              this.obtenerUsuarios();
              alert("Usuario registrado con éxito!!!");
              this.FormReg.reset();
              this.submitted = false;
            }
          })
        }
      }); 
    }
    else {
      Usuario.id_usuario = this.usuarioSeleccionado.id_usuario;
      this.usuariosService.actualizarUsuario(this.usuarioSeleccionado.id_usuario, Usuario).subscribe((res: any) => {
        if (res) {
          //Resto 3 horas a la fecha actual porque cuando pasa a Net Core se le suman.
          let fecha = new Date();
          fecha.setHours(fecha.getHours() - 3);
          const Actividad = { 
            create_date: fecha,
            id_usuario: this.usuarioSeleccionado.id_usuario,
            actividad: "Modificación de usuario"
          };
          // Si todo salió ok actualizo la lista de usuarios y le informo al cliente.
          this.actividadesService.guardarActividad(Actividad).subscribe((act: any) => {
            if (act.ok) {
              this.obtenerUsuarios();
              alert(res.message);
              this.FormReg.reset();
              this.AccionABMC = "Agregar";
              this.submitted = false;
            }
          })
        }
      }); 
    }
  }

  editarUsuarios(usuario: any) {
    this.AccionABMC = "Modificar";
    usuario.fecha_nacimiento = usuario.fecha_nacimiento.substring(0,10);
    this.usuarioSeleccionado = usuario;
    this.FormReg.patchValue(this.usuarioSeleccionado);
  }

  eliminarUsuario(usuario: any) {
    //Seteo el campo activo del usuario en falso (eliminado)
    const Usuario = { ...usuario, activo: false };
    this.usuariosService.eliminarUsuario(usuario.id_usuario, Usuario).subscribe((res: any) => {
      if (res) {
        //Resto 3 horas a la fecha actual porque cuando pasa a Net Core se le suman.
        let fecha = new Date();
        fecha.setHours(fecha.getHours() - 3);
        const Actividad = { 
          create_date: fecha,
          id_usuario: usuario.id_usuario,
          actividad: "Eliminación de usuario"
        };
        this.actividadesService.guardarActividad(Actividad).subscribe((act: any) => {
          if (act.ok) {
            // Si todo salió ok actualizo la lista de usuarios y le informo al cliente.
            this.obtenerUsuarios();
            alert(res.message);
          }
        })
      }
    }); 
  }

}

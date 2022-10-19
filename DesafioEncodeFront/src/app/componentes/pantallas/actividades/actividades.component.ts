import { Component, OnInit } from '@angular/core';
import { ActividadesService } from 'src/app/servicios/actividades.service';

@Component({
  selector: 'app-actividades',
  templateUrl: './actividades.component.html',
  styleUrls: ['./actividades.component.scss']
})
export class ActividadesComponent implements OnInit {

  actividades: any[] = [];

  constructor(private actividadesService: ActividadesService) { }

  ngOnInit(): void {
    this.obtenerListadoActividades();
  }

  obtenerListadoActividades() {
    this.actividadesService.obtenerActividades().subscribe((res: any) => {
      console.log(res);
      this.actividades = res.sort(((a: any, b: any) => a.create_date - b.create_date));
      console.log(this.actividades);
    })
  }
}

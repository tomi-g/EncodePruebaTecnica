using DesafioEncodeBack.Modelos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DesafioEncodeBack.Datos
{
    public class AccesoDB: DbContext
    {
        public AccesoDB(DbContextOptions<AccesoDB> options): base(options)
        {

        }

        public DbSet<UsuarioDTO> Usuarios { get; set; }
        public DbSet<ActividadDTO> Actividades { get; set; }
    }
}

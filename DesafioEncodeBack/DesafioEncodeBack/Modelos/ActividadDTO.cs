using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DesafioEncodeBack.Modelos
{
    public class ActividadDTO
    {
        [Key]
        public int id_actividad { get; set; }
        public DateTime create_date { get; set; }
        public int id_usuario { get; set; }
        public string actividad { get; set; }
    }
}

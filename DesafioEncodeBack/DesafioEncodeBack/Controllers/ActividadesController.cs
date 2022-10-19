using DesafioEncodeBack.Datos;
using DesafioEncodeBack.Modelos;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DesafioEncodeBack.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActividadesController : ControllerBase
    {
        private readonly AccesoDB acceso;

        public ActividadesController(AccesoDB acceso)
        {
            this.acceso = acceso;
        }

        // GET: api/<ActividadesController>
        [HttpGet]
        public IEnumerable<ActividadDTO> Get()
        {
            return acceso.Actividades.ToList();
        }

        // POST api/<ActividadesController>
        [HttpPost]
        public ActionResult Post([FromBody] ActividadDTO actividad)
        {
            try
            {
                acceso.Actividades.Add(actividad);
                acceso.SaveChanges();
                return Ok(new { ok = true });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        // PUT api/<ActividadesController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] ActividadDTO actividad)
        {
            try
            {
                if (id != actividad.id_actividad)
                {
                    return NotFound();
                }

                acceso.Update(actividad);
                await acceso.SaveChangesAsync();
                return Ok(new { message = "Actividad actualizada con éxito!" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<ActividadesController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var actividad = await acceso.Actividades.FindAsync(id);

                if (actividad == null)
                {
                    return NotFound();
                }

                acceso.Actividades.Remove(actividad);
                await acceso.SaveChangesAsync();
                return Ok(new { message = "Actividad eliminada con éxito!" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

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
    public class UsuariosController : ControllerBase
    {
        private readonly AccesoDB acceso;

        public UsuariosController(AccesoDB acceso)
        {
            this.acceso = acceso;
        }

        // GET: api/<UsuariosController>
        [HttpGet]
        public IEnumerable<UsuarioDTO> Get()
        {
            return acceso.Usuarios.ToList();
        }

        // POST api/<UsuariosController>
        [HttpPost]
        public ActionResult Post([FromBody] UsuarioDTO usuario)
        {
            try
            {
                acceso.Usuarios.Add(usuario);
                acceso.SaveChanges();
                return Ok(new { id = usuario.id_usuario });
            }
            catch (Exception)
            {
                return BadRequest();
            }
            
        }

        // PUT api/<UsuariosController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] UsuarioDTO usuario)
        {
            try
            {
                if (id != usuario.id_usuario)
                {
                    return NotFound();
                }

                acceso.Update(usuario);
                await acceso.SaveChangesAsync();
                return Ok(new { message = "Usuario actualizado con éxito!" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<UsuariosController>/5
        [HttpPut("Eliminar/{id}")]
        public async Task<IActionResult> Eliminar(int id, [FromBody] UsuarioDTO usuario)
        {
            try
            {
                if (id != usuario.id_usuario)
                {
                    return NotFound();
                }

                acceso.Usuarios.Attach(usuario);
                acceso.Entry(usuario).Property(x => x.activo).IsModified = true;
                await acceso.SaveChangesAsync();
                return Ok(new { message = "Usuario eliminado con éxito!" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

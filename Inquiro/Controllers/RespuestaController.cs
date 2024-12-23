using Inquiro.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace Inquiro.Controllers
{
    public class RespuestaController : Controller
    {
        private readonly IRespuestaRepository _respuestaRepository;

        // Constructor para inyectar el repositorio
        public RespuestaController(IRespuestaRepository respuestaRepository)
        {
            _respuestaRepository = respuestaRepository;
        }

        // Acción para agregar una respuesta
        [HttpPost]
        public async Task<IActionResult> Agregar(int preguntaId, string contenido)
        {
            // Verificar si el usuario está autenticado
            int? usuarioId = HttpContext.Session.GetInt32("UsuarioID");

            if (usuarioId == null)
            {
                TempData["Error"] = "Debe iniciar sesión para responder preguntas.";
                return RedirectToAction("Login", "Usuario");
            }

            // Validar que el contenido no esté vacío
            if (string.IsNullOrEmpty(contenido))
            {
                TempData["Error"] = "El contenido de la respuesta no puede estar vacío.";
                return RedirectToAction("Detalles", "Pregunta", new { id = preguntaId });
            }

            try
            {
                // Agregar la respuesta usando el repositorio
                await _respuestaRepository.AgregarRespuesta(preguntaId, usuarioId.Value, contenido);
                TempData["Success"] = "Respuesta agregada correctamente.";
            }
            catch (System.Exception ex)
            {
                // Manejar errores desde el procedimiento almacenado
                TempData["Error"] = $"Error: {ex.Message}";
            }

            // Redirigir de vuelta a los detalles de la pregunta
            return RedirectToAction("Detalles", "Pregunta", new { id = preguntaId });
        }
    }
}

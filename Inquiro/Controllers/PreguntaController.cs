using Inquiro.Data;
using Inquiro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

using X.PagedList; // Importacion de la librería
using X.PagedList.Mvc.Core;
using X.PagedList.Extensions; // Necesaria para paginación.

namespace Inquiro.Controllers
{
    public class PreguntaController : Controller
    {
        private readonly IPreguntaRepository _preguntaRepository;

        public PreguntaController(IPreguntaRepository preguntaRepository)
        {
            _preguntaRepository = preguntaRepository;
        }

        // Página principal para ver todas las preguntas
        [HttpGet]
        public async Task<IActionResult> Index(int? page)
        {
            // Proceso almacenado para obtener todas las preguntas
            var preguntas = await _preguntaRepository.ObtenerPreguntas();

            // Número de elementos por página
            int pageSize = 5;
            int pageNumber = page ?? 1; // Página actual (por defecto 1)

            // Pasar preguntas paginadas a la vista
            return View(preguntas.ToPagedList(pageNumber, pageSize));
        }

        // Página para crear una nueva pregunta
        [HttpGet]
        public IActionResult Crear()
        {
            return View();
        }

        // Proceso de creación de una nueva pregunta
        [HttpPost]
        public async Task<IActionResult> Crear(Pregunta pregunta)
        {
            // Validar si el modelo es válido
            if (!ModelState.IsValid)
            {
                Console.WriteLine("Modelo inválido."); // Mensaje de depuración
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine($"Error en modelo: {error.ErrorMessage}");
                }
                return View(pregunta); // Regresa la vista con los errores
            }

            // Verificar si el usuario está autenticado
            int? usuarioId = HttpContext.Session.GetInt32("UsuarioID");

            if (usuarioId == null)
            {
                Console.WriteLine("Sesión no encontrada. Usuario no autenticado."); // Depuración
                TempData["Error"] = "Debe iniciar sesión para crear una pregunta.";
                return RedirectToAction("Login", "Usuario");
            }
            else
            {
                Console.WriteLine($"Usuario autenticado con ID: {usuarioId}"); // Depuración
            }

            // Asignar valores adicionales antes de guardar
            pregunta.UsuarioID = usuarioId.Value; // ID del usuario autenticado
            pregunta.FechaCreacion = DateTime.Now; // Asigna la fecha actual
            pregunta.Cerrada = false; // La pregunta inicia como abierta

            try
            {
                // Intentar agregar la pregunta
                await _preguntaRepository.AgregarPregunta(pregunta);
                Console.WriteLine("Pregunta agregada exitosamente."); // Depuración

                TempData["Success"] = "Pregunta creada exitosamente.";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Capturar y mostrar errores
                Console.WriteLine($"Error al agregar pregunta: {ex.Message}");
                TempData["Error"] = "Hubo un problema al guardar la pregunta.";
                return View(pregunta);
            }
        }



        // Cerrar una pregunta
        [HttpPost]
        public async Task<IActionResult> Cerrar(int id)
        {
            // Verificar si el usuario está autenticado
            int? usuarioId = HttpContext.Session.GetInt32("UsuarioID");

            if (usuarioId == null)
            {
                TempData["Error"] = "Debe iniciar sesión para cerrar una pregunta.";
                return RedirectToAction("Login", "Usuario");
            }

            try
            {
                // Intentar cerrar la pregunta validando el propietario
                await _preguntaRepository.CerrarPregunta(id, usuarioId.Value);
                TempData["Success"] = "Pregunta cerrada correctamente.";
            }
            catch (Exception ex)
            {
                // Mostrar error si no tiene permisos
                TempData["Error"] = $"Error: {ex.Message}";
            }

            return RedirectToAction("Index");
        }


        [HttpGet]
        public async Task<IActionResult> Detalles(int id)
        {
            var pregunta = await _preguntaRepository.ObtenerPreguntas();
            var preguntaDetalles = pregunta.FirstOrDefault(p => p.PreguntaID == id);

            if (preguntaDetalles == null)
            {
                TempData["Error"] = "La pregunta no fue encontrada.";
                return RedirectToAction("Index");
            }

            return View(preguntaDetalles);
        }

    }
}

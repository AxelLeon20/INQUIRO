using Inquiro.Data;
using Inquiro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;

namespace Inquiro.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;

        // Constructor para inyectar el repositorio
        public UsuarioController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet]//Vista de registro
        public IActionResult Registrar()
        {
            return View();
        }

        [HttpPost] // Proceso de registro de usuario
        public async Task<IActionResult> Registrar(string nombreUsuario, string contrasena)
        {
            try
            {
                // Validación para que no acepte campos vacíos
                if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(contrasena))
                {
                    ModelState.AddModelError("", "Todos los campos son obligatorios.");
                    return View();
                }

                // Intentar registrar el usuario
                await _usuarioRepository.RegistrarUsuario(nombreUsuario, contrasena);

                // Redirigir al login si tiene éxito
                return RedirectToAction("Login");
            }
            catch (SqlException ex)
            {
                // Manejar errores específicos desde el procedimiento almacenado
                if (ex.Number == 50000) // El usuario ya existe
                {
                    ModelState.AddModelError("", "Este nombre de usuario ya está en uso. Por favor, intenta con otro nombre.");
                }
                else if (ex.Number == 50001) // Campos vacíos (seguridad adicional)
                {
                    ModelState.AddModelError("", "Todos los campos son obligatorios.");
                }
                else
                {
                    // Error general para cualquier otra excepción SQL
                    ModelState.AddModelError("", "Se produjo un error inesperado. Inténtalo nuevamente más tarde.");
                }

                // Permanecer en la vista actual si hay errores
                return View();
            }
            catch (Exception)
            {
                // Manejar otros errores inesperados
                ModelState.AddModelError("", "Se produjo un error inesperado. Inténtalo nuevamente más tarde.");
                return View();
            }
        }


        [HttpGet]//Vista de Inicio de sesíon
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string nombreUsuario, string contrasena)
        {
            // Validar campos vacíos
            if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(contrasena))
            {
                TempData["Error"] = "Todos los campos son obligatorios.";
                return View();
            }

            try
            {
                // Llamar al repositorio para validar credenciales
                var resultado = await _usuarioRepository.IniciarSesion(nombreUsuario, contrasena);

                if (resultado.esValido && resultado.usuarioID.HasValue)
                {
                    HttpContext.Session.SetInt32("UsuarioID", resultado.usuarioID.Value); // Corregido
                    TempData["Success"] = resultado.mensaje;
                    return RedirectToAction("Index", "Pregunta");
                }
                else
                {
                    TempData["Error"] = resultado.mensaje; // Mensaje de error
                    return View();
                }

            }
            catch (Exception ex)
            {
                // Manejo de errores
                TempData["Error"] = $"Error inesperado: {ex.Message}";
                return View();
            }
        }
        [HttpPost]
        public IActionResult Logout()
        {
            // Limpiar la sesión
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Usuario");
        }

    }
}

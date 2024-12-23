using Inquiro.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Inquiro.Data
{
    public class PreguntaRepository : IPreguntaRepository
    {
        private readonly InquiroDbContext _context;

        public PreguntaRepository(InquiroDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Pregunta>> ObtenerPreguntas()
        {
            // Obtener las preguntas con las respuestas directamente desde la base de datos
            var preguntas = await _context.Preguntas
                .Include(p => p.Respuestas) // Incluir respuestas relacionadas
                .OrderByDescending(p => p.FechaCreacion)
                .ToListAsync(); // Materializar en memoria

            // Cargar los nombres de usuario después de materializar los datos
            var usuarioIds = preguntas.SelectMany(p => p.Respuestas)
                                       .Select(r => r.UsuarioID)
                                       .Distinct()
                                       .ToList();

            var usuarios = await _context.Usuarios
                .Where(u => usuarioIds.Contains(u.UsuarioID))
                .ToDictionaryAsync(u => u.UsuarioID, u => u.NombreUsuario);

            // Asignar el nombre del usuario a cada respuesta
            foreach (var pregunta in preguntas)
            {
                foreach (var respuesta in pregunta.Respuestas)
                {
                    respuesta.NombreUsuario = usuarios.ContainsKey(respuesta.UsuarioID)
                                              ? usuarios[respuesta.UsuarioID]
                                              : "Usuario Desconocido";
                }
            }

            return preguntas;
        }

        //public async Task<IEnumerable<Pregunta>> ObtenerPreguntas()
        //{
        //    return await _context.Preguntas
        //        .Include(p => p.Respuestas) // Incluir respuestas relacionadas
        //        .OrderByDescending(p => p.FechaCreacion)
        //        .ToListAsync();
        //}

        // Agregar una nueva pregunta
        public async Task AgregarPregunta(Pregunta pregunta)
        {
            var tituloParam = new SqlParameter("@Titulo", pregunta.Titulo);
            var descripcionParam = new SqlParameter("@Descripcion", pregunta.Descripcion);
            var usuarioIdParam = new SqlParameter("@UsuarioID", pregunta.UsuarioID);

            try
            {
                await _context.Database.ExecuteSqlRawAsync(
                    "EXEC AgregarPregunta @Titulo, @Descripcion, @UsuarioID",
                    tituloParam, descripcionParam, usuarioIdParam);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al agregar la pregunta: {ex.Message}");
            }
        }

        // Cerrar una pregunta
        public async Task CerrarPregunta(int preguntaId, int usuarioId)
        {
            var preguntaIdParam = new SqlParameter("@PreguntaID", preguntaId);
            var usuarioIdParam = new SqlParameter("@UsuarioID", usuarioId);

            try
            {
                await _context.Database.ExecuteSqlRawAsync(
                    "EXEC CerrarPregunta @PreguntaID, @UsuarioID",
                    preguntaIdParam, usuarioIdParam);
            }
            catch (SqlException ex)
            {
                throw new Exception($"Error al cerrar pregunta: {ex.Message}");
            }
        }

    }
}

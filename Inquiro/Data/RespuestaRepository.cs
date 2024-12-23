using Inquiro.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Inquiro.Data
{
    public class RespuestaRepository : IRespuestaRepository
    {
        private readonly InquiroDbContext _context;

        // Constructor
        public RespuestaRepository(InquiroDbContext context)
        {
            _context = context;
        }

        // Agregar una nueva respuesta
        public async Task AgregarRespuesta(int preguntaId, int usuarioId, string contenido)
        {
            // Parámetros SQL
            var preguntaIdParam = new SqlParameter("@PreguntaID", preguntaId);
            var usuarioIdParam = new SqlParameter("@UsuarioID", usuarioId);
            var contenidoParam = new SqlParameter("@Contenido", contenido);

            // Ejecutar procedimiento almacenado
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC AgregarRespuesta @PreguntaID, @UsuarioID, @Contenido",
                preguntaIdParam, usuarioIdParam, contenidoParam);
        }
    }
}

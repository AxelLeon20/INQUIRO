using Inquiro.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Inquiro.Data
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly InquiroDbContext _context;

        public UsuarioRepository(InquiroDbContext context)
        {
            _context = context;
        }

        // Registrar Usuario
        public async Task<Usuario> RegistrarUsuario(string nombreUsuario, string contrasena)
        {
            var nombreUsuarioParam = new SqlParameter("@NombreUsuario", nombreUsuario);
            var contrasenaParam = new SqlParameter("@Contrasena", contrasena);

            await _context.Database.ExecuteSqlRawAsync(
                "EXEC RegistrarUsuario @NombreUsuario, @Contrasena",
                nombreUsuarioParam, contrasenaParam);

            // Devolver usuario registrado
            return new Usuario
            {
                NombreUsuario = nombreUsuario,
                Contrasena = contrasena
            };
        }

        public async Task<(bool esValido, string mensaje, int? usuarioID)> IniciarSesion(string nombreUsuario, string contrasena)
        {
            var nombreUsuarioParam = new SqlParameter("@NombreUsuario", nombreUsuario ?? (object)DBNull.Value);
            var contrasenaParam = new SqlParameter("@Contrasena", contrasena ?? (object)DBNull.Value);

            int resultado = 0;
            string mensaje = string.Empty;
            int? usuarioID = null;

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "EXEC IniciarSesion @NombreUsuario, @Contrasena";
                command.CommandType = System.Data.CommandType.Text;
                command.Parameters.Add(nombreUsuarioParam);
                command.Parameters.Add(contrasenaParam);

                _context.Database.OpenConnection();
                using (var reader = await command.ExecuteReaderAsync())
                {
                    if (reader.Read())
                    {
                        resultado = reader.GetInt32(0);
                        mensaje = reader.GetString(1);
                        usuarioID = reader.IsDBNull(2) ? (int?)null : reader.GetInt32(2);
                    }
                }
            }

            return (resultado == 1, mensaje, usuarioID);
        }

    }
}

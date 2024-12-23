using Inquiro.Models;
using System.Threading.Tasks;

namespace Inquiro.Data
{
    public interface IUsuarioRepository
    {
        Task<Usuario> RegistrarUsuario(string nombreUsuario, string contrasena);
        Task<(bool esValido, string mensaje, int? usuarioID)> IniciarSesion(string nombreUsuario, string contrasena);
    }
}

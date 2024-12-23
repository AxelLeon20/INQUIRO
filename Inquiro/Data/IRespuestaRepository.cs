using System.Threading.Tasks;

namespace Inquiro.Data
{
    public interface IRespuestaRepository
    {
        Task AgregarRespuesta(int preguntaId, int usuarioId, string contenido);
    }
}

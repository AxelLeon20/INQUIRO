using Inquiro.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Inquiro.Data
{
    public interface IPreguntaRepository
    {
        Task<IEnumerable<Pregunta>> ObtenerPreguntas();
        Task AgregarPregunta(Pregunta pregunta);
        Task CerrarPregunta(int preguntaId, int usuarioId);
    }
}

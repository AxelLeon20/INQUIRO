using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace Inquiro.Models
{
    public class Pregunta
    {
        [Key]
        public int PreguntaID { get; set; }

        [Required]
        [MaxLength(255)]
        public string Titulo { get; set; }

        public string Descripcion { get; set; }

        [Required]
        public DateTime FechaCreacion { get; set; }

        public bool Cerrada { get; set; }

        public int UsuarioID { get; set; }


        [ValidateNever] // Ignorar validación
        public ICollection<Respuesta> Respuestas { get; set; }

    }

}

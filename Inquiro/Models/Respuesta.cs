using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Inquiro.Models
{
    public class Respuesta
    {
        [Key]
        public int RespuestaID { get; set; }

        [Required]
        public string Contenido { get; set; }

        [Required]
        public DateTime FechaCreacion { get; set; }

        public int PreguntaID { get; set; }
        public int UsuarioID { get; set; }

        [NotMapped]
        public string NombreUsuario { get; set; }

    }

}

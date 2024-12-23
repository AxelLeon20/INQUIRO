using System.ComponentModel.DataAnnotations;


namespace Inquiro.Models
{
    public class Usuario
    {
        [Key] //Clave primaria
        public int UsuarioID { get; set; }

        [Required]//Requerido para que no sea nulo
        [MaxLength(50)]
        public string NombreUsuario { get; set; }

        [Required]
        [MaxLength(255)]//Longitud máxima
        public string Contrasena { get; set; }

        public DateTime FechaRegistro { get; set; }
    }

}

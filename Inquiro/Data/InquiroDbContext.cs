using Inquiro.Models;
using Microsoft.EntityFrameworkCore;

namespace Inquiro.Data
{
    public class InquiroDbContext : DbContext
    {
        // Constructor para pasar opciones al DbContext
        public InquiroDbContext(DbContextOptions<InquiroDbContext> options) : base(options)
        {

        }

        // Definición de tablas
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Pregunta> Preguntas { get; set; }
        public DbSet<Respuesta> Respuestas { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

        }
    }
}

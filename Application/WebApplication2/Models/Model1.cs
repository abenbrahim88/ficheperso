namespace WebApplication2.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=dbcontext")
        {
        }

        public virtual DbSet<Civilite> Civilites { get; set; }
        public virtual DbSet<Personne> Personnes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Civilite>()
                .Property(e => e.libelle)
                .IsUnicode(false);

            //modelBuilder.Entity<Civilite>()
            //    .HasMany(e => e.Personnes)
            //    .WithRequired(e => e.Civilite)
            //    .WillCascadeOnDelete(false);

            modelBuilder.Entity<Personne>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Personne>()
                .Property(e => e.prenom)
                .IsUnicode(false);

            modelBuilder.Entity<Personne>()
                .Property(e => e.ville_naissance)
                .IsUnicode(false);

            modelBuilder.Entity<Personne>()
                .Property(e => e.adresse)
                .IsUnicode(false);

            modelBuilder.Entity<Personne>()
                .Property(e => e.ville)
                .IsUnicode(false);
        }
    }
}

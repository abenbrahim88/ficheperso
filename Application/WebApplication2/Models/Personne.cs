namespace WebApplication2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Personne")]
    public partial class Personne
    {
        [Key]
        public int id_personne { get; set; }

        [Required]
        [StringLength(32)]
        public string nom { get; set; }

        [Required]
        [StringLength(32)]
        public string prenom { get; set; }

        [Column(TypeName = "date")]
        public DateTime date_naissance { get; set; }

        public int departement_naissance { get; set; }

        [Required]
        [StringLength(32)]
        public string ville_naissance { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string adresse { get; set; }

        public int code_postal { get; set; }

        [Required]
        [StringLength(32)]
        public string ville { get; set; }

        public int id_civilite { get; set; }

        //public virtual Civilite Civilite { get; set; }
    }
}

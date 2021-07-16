using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace Data.Models
{
    public partial class Article
    {
        [Required]
        public int ArticleId { get; set; }

        [Required]
        public string Title { get; set; }
        [Required]
        public int? AuthorId { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string Content { get; set; }
        [Required]
        public string Urlarticle { get; set; }
        [Required]
        public string Urlimagen { get; set; }
        public DateTime? PublishedAt { get; set; }
        public int? Uptake { get; set; }
        [Required]
        public int? SourceId { get; set; }
        public int? CategoryId { get; set; }
        public int? CountryId { get; set; }
        public int? LanguageId { get; set; }
        public int? StateId { get; set; }
        public int? UserId { get; set; }
        public int? SortId { get; set; }

        public virtual Author Author { get; set; }
        public virtual Category Category { get; set; }
        public virtual Country Country { get; set; }
        public virtual Language Language { get; set; }
        public virtual SortBy Sort { get; set; }
        public virtual Source Source { get; set; }
        public virtual State State { get; set; }
        public virtual User User { get; set; }
    }
}

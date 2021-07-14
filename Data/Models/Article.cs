using System;
using System.Collections.Generic;

#nullable disable

namespace Data.Models
{
    public partial class Article
    {
        public int ArticleId { get; set; }
        public string Title { get; set; }
        public int? AuthorId { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Urlarticle { get; set; }
        public string Urlimagen { get; set; }
        public DateTime? PublishedAt { get; set; }
        public int? Uptake { get; set; }
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

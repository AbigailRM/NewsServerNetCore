using System;
using System.Collections.Generic;

#nullable disable

namespace Data.Models
{
    public partial class SortBy
    {
        public SortBy()
        {
            Articles = new HashSet<Article>();
        }

        public int SortId { get; set; }
        public string Name { get; set; }
        public int? StateId { get; set; }
        public int? UserId { get; set; }

        public virtual State State { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Article> Articles { get; set; }
    }
}

using System;
using System.Collections.Generic;

#nullable disable

namespace Data.Models
{
    public partial class State
    {
        public State()
        {
            Articles = new HashSet<Article>();
            Authors = new HashSet<Author>();
            Categories = new HashSet<Category>();
            Countries = new HashSet<Country>();
            Languages = new HashSet<Language>();
            SortBies = new HashSet<SortBy>();
            Sources = new HashSet<Source>();
            Users = new HashSet<User>();
        }

        public int StateId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
        public virtual ICollection<Author> Authors { get; set; }
        public virtual ICollection<Category> Categories { get; set; }
        public virtual ICollection<Country> Countries { get; set; }
        public virtual ICollection<Language> Languages { get; set; }
        public virtual ICollection<SortBy> SortBies { get; set; }
        public virtual ICollection<Source> Sources { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}

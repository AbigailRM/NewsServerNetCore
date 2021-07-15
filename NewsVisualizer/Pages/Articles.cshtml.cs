using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Data.Models;

namespace NewsViewer.Pages
{
    public class ArticlesModel : PageModel
    {
        private readonly Data.Models.NewsServerContext _context;

        public ArticlesModel(Data.Models.NewsServerContext context)
        {
            _context = context;
        }

        public IList<Article> Article { get;set; }

        public async Task OnGetAsync()
        {
            Article = await _context.Articles
                .Include(a => a.Author)
                .Include(a => a.Category)
                .Include(a => a.Country)
                .Include(a => a.Language)
                .Include(a => a.Sort)
                .Include(a => a.Source)
                .Include(a => a.State)
                .Include(a => a.User).ToListAsync();
        }
    }
}

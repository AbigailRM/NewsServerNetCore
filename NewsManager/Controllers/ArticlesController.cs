using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Data.Models;

namespace NewsManager.Controllers
{
    public class ArticlesController : Controller
    {
        private readonly NewsServerContext _context;

        public ArticlesController(NewsServerContext context)
        {
            _context = context;
        }

        // GET: Articles
        public IActionResult Index()
        {
            var newsServerContext = _context.Articles
                .Include(a => a.Author)
                .Include(a => a.Category)
                .Include(a => a.Country)
                .Include(a => a.Language)
                .Include(a => a.Sort)
                .Include(a => a.Source);
            return View(newsServerContext.ToList());
        }

        // GET: Articles/Details
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var article = _context.Articles
                .Include(a => a.Author)
                .Include(a => a.Category)
                .Include(a => a.Country)
                .Include(a => a.Language)
                .Include(a => a.Sort)
                .Include(a => a.Source)
                .FirstOrDefault(m => m.ArticleId == id);
            if (article == null)
            {
                return NotFound();
            }

            return View(article);
        }

        // GET: Articles/Create
        public IActionResult Create()
        {
            ViewData["AuthorId"] = new SelectList(_context.Authors, "AuthorId", "AuthorId");
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId");
            ViewData["CountryId"] = new SelectList(_context.Countries, "CountryId", "CountryId");
            ViewData["LanguageId"] = new SelectList(_context.Languages, "LanguageId", "LanguageId");
            ViewData["SortId"] = new SelectList(_context.SortBies, "SortId", "SortId");
            ViewData["SourceId"] = new SelectList(_context.Sources, "SourceId", "SourceId");
            return View();
        }

        // POST: Articles/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("ArticleId,Title,AuthorId,Description,Content,Urlarticle,Urlimagen,PublishedAt,Uptake,SourceId,CategoryId,CountryId,LanguageId,SortId")] Article article)
        {
            if (ModelState.IsValid)
            {
                _context.Add(article);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            ViewData["AuthorId"] = new SelectList(_context.Authors, "AuthorId", "AuthorId", article.AuthorId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", article.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "CountryId", "CountryId", article.CountryId);
            ViewData["LanguageId"] = new SelectList(_context.Languages, "LanguageId", "LanguageId", article.LanguageId);
            ViewData["SortId"] = new SelectList(_context.SortBies, "SortId", "SortId", article.SortId);
            ViewData["SourceId"] = new SelectList(_context.Sources, "SourceId", "SourceId", article.SourceId);
            return View(article);
        }

        // GET: Articles/Edit
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var article = _context.Articles.Find(id);
            if (article == null)
            {
                return NotFound();
            }
            ViewData["AuthorId"] = new SelectList(_context.Authors, "AuthorId", "AuthorId", article.AuthorId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", article.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "CountryId", "CountryId", article.CountryId);
            ViewData["LanguageId"] = new SelectList(_context.Languages, "LanguageId", "LanguageId", article.LanguageId);
            ViewData["SortId"] = new SelectList(_context.SortBies, "SortId", "SortId", article.SortId);
            ViewData["SourceId"] = new SelectList(_context.Sources, "SourceId", "SourceId", article.SourceId);
            return View(article);
        }

        // POST: Articles/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("ArticleId,Title,AuthorId,Description,Content,Urlarticle,Urlimagen,PublishedAt,Uptake,SourceId,CategoryId,CountryId,LanguageId,SortId")] Article article)
        {
            if (id != article.ArticleId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(article);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ArticleExists(article.ArticleId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["AuthorId"] = new SelectList(_context.Authors, "AuthorId", "AuthorId", article.AuthorId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", article.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "CountryId", "CountryId", article.CountryId);
            ViewData["LanguageId"] = new SelectList(_context.Languages, "LanguageId", "LanguageId", article.LanguageId);
            ViewData["SortId"] = new SelectList(_context.SortBies, "SortId", "SortId", article.SortId);
            ViewData["SourceId"] = new SelectList(_context.Sources, "SourceId", "SourceId", article.SourceId);
            return View(article);
        }

        // GET: Articles/Delete/5
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var article = _context.Articles
                .Include(a => a.Author)
                .Include(a => a.Category)
                .Include(a => a.Country)
                .Include(a => a.Language)
                .Include(a => a.Sort)
                .Include(a => a.Source)
                .FirstOrDefault(m => m.ArticleId == id);
            if (article == null)
            {
                return NotFound();
            }

            return View(article);
        }

        // POST: Articles/Delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var article = _context.Articles.Find(id);
            _context.Articles.Remove(article);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        private bool ArticleExists(int id)
        {
            return _context.Articles.Any(e => e.ArticleId == id);
        }
    }
}

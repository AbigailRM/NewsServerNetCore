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
    public class SourcesController : Controller
    {
        private readonly NewsServerContext _context;

        public SourcesController(NewsServerContext context)
        {
            _context = context;
        }

        // GET: Sources
        public IActionResult Index()
        {
            var newsServerContext = _context.Sources;
            return View(newsServerContext.ToList());
        }

        // GET: Sources/Details
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var source =_context.Sources
                .FirstOrDefault(m => m.SourceId == id);
            if (source == null)
            {
                return NotFound();
            }

            return View(source);
        }

        // GET: Sources/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Sources/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("SourceId,NameSource")] Source source)
        {
            if (ModelState.IsValid)
            {
                _context.Add(source);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(source);
        }

        // GET: Sources/Edit
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var source = _context.Sources.Find(id);
            if (source == null)
            {
                return NotFound();
            }
            return View(source);
        }

        // POST: Sources/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("SourceId,NameSource")] Source source)
        {
            if (id != source.SourceId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(source);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SourceExists(source.SourceId))
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
            return View(source);
        }

        // GET: Sources/Delete
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var source = _context.Sources
                .FirstOrDefault(m => m.SourceId == id);
            if (source == null)
            {
                return NotFound();
            }

            return View(source);
        }

        // POST: Sources/Delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var source = _context.Sources.Find(id);
            _context.Sources.Remove(source);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        private bool SourceExists(int id)
        {
            return _context.Sources.Any(e => e.SourceId == id);
        }
    }
}

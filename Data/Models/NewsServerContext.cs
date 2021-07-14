using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Data.Models
{
    public partial class NewsServerContext : DbContext
    {
        public NewsServerContext()
        {
        }

        public NewsServerContext(DbContextOptions<NewsServerContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Article> Articles { get; set; }
        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<SortBy> SortBies { get; set; }
        public virtual DbSet<Source> Sources { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=NewsServer;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Article>(entity =>
            {
                entity.Property(e => e.ArticleId).HasColumnName("ArticleID");

                entity.Property(e => e.AuthorId).HasColumnName("AuthorID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.Content).HasColumnType("text");

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.PublishedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("publishedAt");

                entity.Property(e => e.SortId).HasColumnName("SortID");

                entity.Property(e => e.SourceId).HasColumnName("SourceID");

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Urlarticle)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("URLArticle");

                entity.Property(e => e.Urlimagen)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("URLImagen");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Author)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.AuthorId)
                    .HasConstraintName("FK_AuthorID");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_CatgoriaID");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_CountryID");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_LanguageID");

                entity.HasOne(d => d.Sort)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.SortId)
                    .HasConstraintName("FK_ArSortID");

                entity.HasOne(d => d.Source)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.SourceId)
                    .HasConstraintName("FK_SourceID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_ArStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_ArUserID");
            });

            modelBuilder.Entity<Author>(entity =>
            {
                entity.Property(e => e.AuthorId).HasColumnName("AuthorID");

                entity.Property(e => e.Apellido).HasMaxLength(255);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Authors)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_AStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Authors)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_AUserID");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Categories)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_CStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Categories)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_CUserID");
            });

            modelBuilder.Entity<Country>(entity =>
            {
                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CountryCode)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Countries)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_PStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Countries)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_PUserID");
            });

            modelBuilder.Entity<Language>(entity =>
            {
                entity.Property(e => e.LanguageId).HasColumnName("LanguageID");

                entity.Property(e => e.CodigoIdioma)
                    .HasMaxLength(8)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Languages)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_IStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Languages)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_IUserID");
            });

            modelBuilder.Entity<SortBy>(entity =>
            {
                entity.HasKey(e => e.SortId)
                    .HasName("PK__SortBy__23E0746280470018");

                entity.ToTable("SortBy");

                entity.Property(e => e.SortId).HasColumnName("SortID");

                entity.Property(e => e.Name)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.SortBies)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_SortStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.SortBies)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_SortUserID");
            });

            modelBuilder.Entity<Source>(entity =>
            {
                entity.Property(e => e.SourceId).HasColumnName("SourceID");

                entity.Property(e => e.NameSource)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Sources)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_FStateID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Sources)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_FUserID");
            });

            modelBuilder.Entity<State>(entity =>
            {
                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.Property(e => e.Name)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Password).HasMaxLength(1);

                entity.Property(e => e.StateId).HasColumnName("StateID");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_UStateID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

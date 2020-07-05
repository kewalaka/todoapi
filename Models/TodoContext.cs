using Microsoft.EntityFrameworkCore;

namespace TodoApi.Models
{
    public class TodoContext : DbContext
    {

        private const string connectionString = "Filename=Todo.db";

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite(connectionString);
        }

        public TodoContext()
        {
        }

        public DbSet<TodoItem> TodoItems { get; set; }
    }
}
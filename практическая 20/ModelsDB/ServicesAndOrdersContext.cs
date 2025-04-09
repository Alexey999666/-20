using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace практическая_20.ModelsDB;

public partial class ServicesAndOrdersContext : DbContext
{
    public ServicesAndOrdersContext()
    {
    }

    public ServicesAndOrdersContext(DbContextOptions<ServicesAndOrdersContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Заказы> Заказыs { get; set; }

    public virtual DbSet<Клиенты> Клиентыs { get; set; }

    public virtual DbSet<РеестрЗаказов> РеестрЗаказовs { get; set; }

    public virtual DbSet<СправочникУслуг> СправочникУслугs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost\\sqlexpress; Database=ServicesAndOrders; User=исп-31; Password= 1234567890; Encrypt=false");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Заказы>(entity =>
        {
            entity.HasKey(e => e.Код);

            entity.ToTable("Заказы");

            entity.Property(e => e.ДатаЗаказа).HasColumnType("datetime");
            entity.Property(e => e.СтоимостьУслуги).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ФормаОплаты)
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.HasOne(d => d.КодУслугиNavigation).WithMany(p => p.Заказыs)
                .HasForeignKey(d => d.КодУслуги)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Заказы__КодУслуг__276EDEB3");

            entity.HasOne(d => d.НомерЗаказаNavigation).WithMany(p => p.Заказыs)
                .HasForeignKey(d => d.НомерЗаказа)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Заказы_РеестрЗаказов");
        });

        modelBuilder.Entity<Клиенты>(entity =>
        {
            entity.HasKey(e => e.КодКлиента).HasName("PK__Клиенты__FFB6CA691F5BC053");

            entity.ToTable("Клиенты");

            entity.Property(e => e.КодКлиента).ValueGeneratedNever();
            entity.Property(e => e.АдресКлиента)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Телефон)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ФамилияКлиента)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<РеестрЗаказов>(entity =>
        {
            entity.HasKey(e => e.НомерЗаказа).HasName("PK__РеестрЗа__33C9BE63E9767174");

            entity.ToTable("РеестрЗаказов");

            entity.Property(e => e.НомерЗаказа).ValueGeneratedNever();
            entity.Property(e => e.СтоимостьЗаказа).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.КодКлиентаNavigation).WithMany(p => p.РеестрЗаказовs)
                .HasForeignKey(d => d.КодКлиента)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__РеестрЗак__КодКл__2E1BDC42");
        });

        modelBuilder.Entity<СправочникУслуг>(entity =>
        {
            entity.HasKey(e => e.КодУслуги).HasName("PK__Справочн__2A901A73C2CD42D0");

            entity.ToTable("СправочникУслуг");

            entity.Property(e => e.КодУслуги).ValueGeneratedNever();
            entity.Property(e => e.Наименование)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Цена).HasColumnType("decimal(10, 2)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

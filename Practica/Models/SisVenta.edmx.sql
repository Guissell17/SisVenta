
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/18/2021 14:46:17
-- Generated from EDMX file: C:\Users\Estudiante\source\repos\Practica\Practica\Models\SisVenta.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SisVenta];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Proveedores'
CREATE TABLE [dbo].[Proveedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rut] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [PaginaWeb] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Compras'
CREATE TABLE [dbo].[Compras] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Descuento] float  NOT NULL,
    [ProveedorId] int  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Precio] float  NOT NULL,
    [Stock] int  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'DetalleCompraSet'
CREATE TABLE [dbo].[DetalleCompraSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CompraId] int  NOT NULL,
    [ProductoId] int  NOT NULL,
    [Cantidad] int  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rut] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Descuento] float  NOT NULL,
    [MontoFinal] float  NOT NULL,
    [ClienteId] int  NOT NULL
);
GO

-- Creating table 'DetalleVentas'
CREATE TABLE [dbo].[DetalleVentas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VentaId] int  NOT NULL,
    [ProductoId] int  NOT NULL,
    [Cantidad] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Proveedores'
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [PK_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Compras'
ALTER TABLE [dbo].[Compras]
ADD CONSTRAINT [PK_Compras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleCompraSet'
ALTER TABLE [dbo].[DetalleCompraSet]
ADD CONSTRAINT [PK_DetalleCompraSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [PK_Ventas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleVentas'
ALTER TABLE [dbo].[DetalleVentas]
ADD CONSTRAINT [PK_DetalleVentas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProveedorId] in table 'Compras'
ALTER TABLE [dbo].[Compras]
ADD CONSTRAINT [FK_ProveedorCompra]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorCompra'
CREATE INDEX [IX_FK_ProveedorCompra]
ON [dbo].[Compras]
    ([ProveedorId]);
GO

-- Creating foreign key on [CompraId] in table 'DetalleCompraSet'
ALTER TABLE [dbo].[DetalleCompraSet]
ADD CONSTRAINT [FK_CompraDetalleCompra]
    FOREIGN KEY ([CompraId])
    REFERENCES [dbo].[Compras]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompraDetalleCompra'
CREATE INDEX [IX_FK_CompraDetalleCompra]
ON [dbo].[DetalleCompraSet]
    ([CompraId]);
GO

-- Creating foreign key on [ProductoId] in table 'DetalleCompraSet'
ALTER TABLE [dbo].[DetalleCompraSet]
ADD CONSTRAINT [FK_ProductoDetalleCompra]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoDetalleCompra'
CREATE INDEX [IX_FK_ProductoDetalleCompra]
ON [dbo].[DetalleCompraSet]
    ([ProductoId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[Productos]
    ([CategoriaId]);
GO

-- Creating foreign key on [ClienteId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_ClienteVenta]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteVenta'
CREATE INDEX [IX_FK_ClienteVenta]
ON [dbo].[Ventas]
    ([ClienteId]);
GO

-- Creating foreign key on [VentaId] in table 'DetalleVentas'
ALTER TABLE [dbo].[DetalleVentas]
ADD CONSTRAINT [FK_VentaDetalleVenta]
    FOREIGN KEY ([VentaId])
    REFERENCES [dbo].[Ventas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VentaDetalleVenta'
CREATE INDEX [IX_FK_VentaDetalleVenta]
ON [dbo].[DetalleVentas]
    ([VentaId]);
GO

-- Creating foreign key on [ProductoId] in table 'DetalleVentas'
ALTER TABLE [dbo].[DetalleVentas]
ADD CONSTRAINT [FK_ProductoDetalleVenta]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoDetalleVenta'
CREATE INDEX [IX_FK_ProductoDetalleVenta]
ON [dbo].[DetalleVentas]
    ([ProductoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
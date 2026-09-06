-- 1. Tạo Database
CREATE DATABASE ShoppingServiceMVC;
GO
USE ShoppingServiceMVC;
GO

-- 2. Tạo bảng Danh mục (Category)
CREATE TABLE [dbo].[Category] (
    [categoryId] INT IDENTITY(1,1) PRIMARY KEY,
    [categoryname] NVARCHAR(255) NOT NULL,
    [images] NVARCHAR(255) NULL,
    [status] INT DEFAULT 1
);
GO

-- 3. Tạo bảng Sản phẩm (Product)
CREATE TABLE [dbo].[Product] (
    [productId] INT IDENTITY(1,1) PRIMARY KEY,
    [productName] NVARCHAR(255) NOT NULL,
    [quantity] INT DEFAULT 0,
    [unitPrice] FLOAT DEFAULT 0,
    [images] NVARCHAR(255) NULL,
    [description] NVARCHAR(MAX) NULL,
    [discount] FLOAT DEFAULT 0,
    [status] INT DEFAULT 1,
    [categoryId] INT NOT NULL,
    CONSTRAINT [FK_Product_Category] FOREIGN KEY ([categoryId]) REFERENCES [Category]([categoryId]) ON DELETE CASCADE
);
GO

-- 4. Chèn dữ liệu mẫu ban đầu
INSERT INTO [dbo].[Category] ([categoryname], [status]) VALUES (N'Điện thoại', 1), (N'Laptop', 1);

INSERT INTO [dbo].[Product] ([productName], [quantity], [unitPrice], [description], [status], [categoryId]) 
VALUES 
(N'iphone 18', 10, 20000000, N'Mô tả iPhone 18', 1, 1),
(N'redmi', 10, 7000000, N'Mô tả Redmi', 1, 1),
(N'oppo', 10, 7500000, N'Mô tả Oppo', 1, 1),
(N'macbook', 10, 30000000, N'Mô tả Macbook', 1, 2),
(N'acer', 10, 20000000, N'Mô tả Laptop Acer', 1, 2);
GO
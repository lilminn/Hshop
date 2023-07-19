CREATE DATABASE ASM_JAVA5
go
USE ASM_JAVA5
go

CREATE TABLE users
(
	userID			INT				PRIMARY KEY		IDENTITY,
	fullName		NVARCHAR(255),
	email			VARCHAR(255)	UNIQUE,
	[password]		VARCHAR(255),
	[address]		NVARCHAR(255),
	[phone]			NVARCHAR(20)	UNIQUE,
	createDate		DATE			DEFAULT GETDATE(),
	[admin]			BIT,			
	active			BIT,
	photo			NVARCHAR(255)
)
ALTER TABLE users ADD birthday DATE, gender BIT
ALTER TABLE users
ADD CONSTRAINT DF_users_admin DEFAULT 0 FOR [admin];

ALTER TABLE users
ADD CONSTRAINT DF_users_active DEFAULT 1 FOR active;


CREATE TABLE category
(
	categoryID		INT				PRIMARY KEY		IDENTITY,
	[name]			NVARCHAR(255)
)

CREATE TABLE brand
(
	brandID			INT				PRIMARY KEY		IDENTITY,
	[name]			NVARCHAR(255)
)

CREATE TABLE product
(
	productID		INT				PRIMARY KEY		IDENTITY,
	categoryID		INT,
	brandID			INT,
	[name]			NVARCHAR(255),
	[description]	NVARCHAR(MAX),
	price			FLOAT,
	available		BIT,
	FOREIGN KEY(categoryID)		REFERENCES category(categoryID),
	FOREIGN KEY(brandID)		REFERENCES brand(brandID)
)

CREATE TABLE gallery
(
	galleryID		INT				PRIMARY KEY		IDENTITY,
	productID		INT,
	imageURL		NVARCHAR(255),
	FOREIGN KEY(productID) REFERENCES product(productID)
)

CREATE TABLE invoice
(
	invoiceID		INT				PRIMARY KEY		IDENTITY,
	userID			INT,
	createDate		DATE			DEFAULT GETDATE(),
	[address]		NVARCHAR(MAX),
	FOREIGN KEY(userID) REFERENCES users(userID)
)

CREATE TABLE invoiceDetail
(
	detailID		INT				PRIMARY KEY		IDENTITY,
	invoiceID		INT,
	productID		INT,
	price			FLOAT,
	quantity		INT,
	total			FLOAT,
	FOREIGN KEY(invoiceID) REFERENCES invoice(invoiceID),
	FOREIGN KEY(productID) REFERENCES product(productID)
)

CREATE TABLE feedback
(
	feedbackID		INT				PRIMARY KEY		IDENTITY,
	userID			INT,
	[content]		NVARCHAR(MAX),
	FOREIGN KEY(userID) REFERENCES users(userID)
)

-- Thêm dữ liệu vào bảng users
INSERT INTO users (fullName, email, [password], [address], [phone], [admin], active)
VALUES
(N'Nông Ngọc Hoài', 'hoainong@gmail.com', '123', N'Hà Nội', '0912345678', 1, 1),
(N'Nguyễn Thị Hương', 'huong.nguyen@gmail.com', N'password123', 'Hà Nội', '0912345675', 0, 1),
(N'Trần Văn Tâm', 'tam.tran@gmail.com', 'qwerty456', N'Hồ Chí Minh', '0987654321', 0, 1),
(N'Lê Thị Mai', 'mai.le@gmail.com', 'abcdef789', N'Đà Nẵng', '0909123456', 0, 1),
(N'Phạm Đức Long', 'long.pham@gmail.com', 'xyz123', N'Hải Phòng', '0978654321', 0, 1),
(N'Nguyễn Minh Hoàng', 'hoang.nguyen@gmail.com', 'p@ssw0rd', N'Nha Trang', '0967543211', 0, 1),
(N'Trần Thị An', 'an.tran@gmail.com', 'qazwsx321', N'Huế', '0910123456', 0, 1),
(N'Ngô Văn Dũng', 'dung.ngo@gmail.com', 'pass123', N'Vũng Tàu', '0987654322', 0, 1),
(N'Lê Thị Hồng', 'hong.le@gmail.com', 'abcxyz789', N'Cần Thơ', '0909123455', 0, 1),
(N'Vũ Đức Hải', 'hai.vu@gmail.com', 'qweasd456', N'Bắc Giang', '0978654323', 0, 1),
(N'Nguyễn Thị Trang', 'trang.nguyen@gmail.com', 'mypass123', N'Đồng Nai', '0967543210', 0, 1);

-- Thêm dữ liệu vào bảng category
INSERT INTO category ([name])
VALUES
(N'Áo nam'),
(N'Áo nữ'),
(N'Quần nam'),
(N'Quần nữ'),
(N'Áo khoác'),
(N'Đầm'),
(N'Váy'),
(N'Phụ kiện'),
(N'Giày nam'),
(N'Giày nữ');

INSERT INTO brand ([name])
VALUES
('Zara'),
('H&M'),
('Uniqlo'),
('Adidas'),
('Nike'),
('Levis'),
('Puma'),
('Forever 21'),
('Converse'),
('Vans');

-- Thêm dữ liệu vào bảng product
INSERT INTO product (categoryID, brandID, [name], [description], price, available)
VALUES
(1, 1, N'Áo sơ mi nam trắng', N'Áo sơ mi nam trắng dễ dàng phối đồ', 500000, 1),
(1, 2, N'Áo thun nam đen', N'Áo thun nam đen trẻ trung và cá tính', 300000, 1),
(1, 3, N'Áo khoác jean nam', N'Áo khoác jean nam phong cách thời trang', 800000, 1),
(1, 4, N'Áo hoodie nam', N'Áo hoodie nam dễ dàng kết hợp với các outfit', 600000, 1),
(2, 5, N'Áo sơ mi nữ trắng', N'Áo sơ mi nữ trắng thanh lịch và tinh tế', 450000, 1),
(2, 6, N'Áo thun nữ xám', N'Áo thun nữ xám đơn giản và năng động', 250000, 1),
(2, 7, N'Áo khoác jean nữ', N'Áo khoác jean nữ phong cách trẻ trung', 750000, 1),
(2, 8, N'Áo hoodie nữ', N'Áo hoodie nữ thoải mái và cá tính', 550000, 1),
(3, 9, N'Quần jean nam', N'Quần jean nam thời trang và bền đẹp', 700000, 1),
(3, 10, N'Quần kaki nam', N'Quần kaki nam lịch lãm và dễ phối đồ', 600000, 1),
(3, 1, N'Quần shorts nam', N'Quần shorts nam thoải mái và thời trang', 400000, 1),
(3, 2, N'Quần tây nam', N'Quần tây nam sang trọng và phong cách', 900000, 1),
(4, 3, N'Quần jeans nữ', N'Quần jeans nữ phong cách và trẻ trung', 650000, 1),
(4, 4, N'Quần jogger nữ', N'Quần jogger nữ thoải mái và năng động', 550000, 1),
(4, 5, N'Quần legging nữ', N'Quần legging nữ ôm sát và thời trang', 350000, 1),
(4, 6, N'Quần culottes nữ', N'Quần culottes nữ thanh lịch và tinh tế', 750000, 1),
(5, 7, N'Áo khoác dù nam', N'Áo khoác dù nam ấm áp và thời trang', 900000, 1),
(5, 8, N'Áo khoác da nam', N'Áo khoác da nam cá tính và phong cách', 1200000, 1),
(5, 9, N'Áo khoác hoodie nam', N'Áo khoác hoodie nam trẻ trung và năng động', 800000, 1),
(5, 10, N'Áo khoác bomber nam', N'Áo khoác bomber nam thời trang và cá tính', 1100000, 1),
(6, 1, N'Đầm maxi họa tiết', N'Đầm maxi họa tiết nữ tính và duyên dáng', 650000, 1),
(6, 2, N'Đầm suông trắng', N'Đầm suông trắng đơn giản và tinh tế', 450000, 1),
(6, 3, N'Đầm xoè dự tiệc', N'Đầm xoè dự tiệc sang trọng và lộng lẫy', 850000, 1),
(6, 4, N'Đầm bodycon đen', N'Đầm bodycon đen gợi cảm và quyến rũ', 550000, 1),
(7, 5, N'Váy denim xanh', N'Váy denim xanh trẻ trung và cá tính', 400000, 1),
(7, 6, N'Váy maxi hoa', N'Váy maxi hoa nữ tính và dịu dàng', 600000, 1),
(7, 7, N'Váy xòe trắng', N'Váy xòe trắng thanh lịch và tinh tế', 550000, 1),
(7, 8, N'Váy đầm công sở', N'Váy đầm công sở lịch lãm và chuyên nghiệp', 750000, 1),
(8, 9, N'Nón baseball nam', N'Nón baseball nam thể thao và năng động', 200000, 1),
(8, 10, N'Khăn quàng cổ nữ', N'Khăn quàng cổ nữ phong cách và ấm áp', 150000, 1),
(8, 1, N'Dây chuyền vàng', N'Dây chuyền vàng sang trọng và quý phái', 500000, 1),
(8, 2, N'Găng tay da nam', N'Găng tay da nam cá tính và bảo vệ', 300000, 1),
(9, 3, N'Giày sneaker nam', N'Giày sneaker nam thoải mái và phong cách', 800000, 1),
(9, 4, N'Giày thể thao nam', N'Giày thể thao nam năng động và trẻ trung', 700000, 1),
(9, 5, N'Giày lười nam', N'Giày lười nam đơn giản và tiện lợi', 400000, 1),
(9, 6, N'Giày búp bê nữ', N'Giày búp bê nữ dễ thương và xinh xắn', 600000, 1),
(10, 7, N'Giày thể thao nữ', N'Giày thể thao nữ thoải mái và năng động', 700000, 1),
(10, 8, N'Giày cao gót nữ', N'Giày cao gót nữ quyến rũ và tự tin', 900000, 1),
(10, 9, N'Giày slip-on nữ', N'Giày slip-on nữ tiện lợi và thời trang', 500000, 1),
(10, 10, N'Giày bệt nữ', N'Giày bệt nữ thoải mái và dễ phối đồ', 400000, 1);


-- Thêm dữ liệu vào bảng gallery
INSERT INTO gallery (productID, imageURL)
VALUES
(1, '/templates/user/images/product1.jpg'),
(2, '/templates/user/images/product2.jpg'),
(3, '/templates/user/images/product3.jpg'),
(4, '/templates/user/images/product4.jpg'),
-- Thêm dữ liệu cho gallery tiếp theo
(5, '/templates/user/images/men-01.jpg'),
(6, '/templates/user/images/men-02.jpg'),
(7, '/templates/user/images/men-03.jpg'),
(8, '/templates/user/images/product8.jpg'),
-- Thêm dữ liệu cho gallery tiếp theo
(9, '/templates/user/images/instagram-01.jpg'),
(10, '/templates/user/images/instagram-02.jpg'),
(11, '/templates/user/images/instagram-03.jpg'),
(12, '/templates/user/images/instagram-04.jpg'),
-- Thêm dữ liệu cho gallery tiếp theo
(13, '/templates/user/images/instagram-05.jpg'),
(14, '/templates/user/images/instagram-06.jpg'),
(15, '/templates/user/images/kid-01.jpg'),
(16, '/templates/user/images/kid-02.jpg'),
-- Thêm dữ liệu cho gallery tiếp theo
(17, '/templates/user/images/kid-03.jpg'),
(18, '/templates/user/images/women-01.jpg'),
(19, '/templates/user/images/women-02.jpg'),
(20, '/templates/user/images/women-03.jpg');

-- Thêm dữ liệu vào bảng invoice
INSERT INTO invoice (userID, [address])
VALUES
(1, N'Hà Nội'),
(2, N'Hồ Chí Minh'),
(3, N'Đà Nẵng'),
(4, N'Hải Phòng'),
-- Thêm dữ liệu cho invoice tiếp theo
(5, N'Nha Trang'),
(6, N'Huế'),
(7, N'Vũng Tàu'),
(8, N'Cần Thơ'),
-- Thêm dữ liệu cho invoice tiếp theo
(9, N'Bắc Giang'),
(10, N'Đồng Nai');

-- Thêm dữ liệu vào bảng invoiceDetail
INSERT INTO invoiceDetail (invoiceID, productID, price, quantity, total)
VALUES
(1, 1, 500000, 2, 1000000),
(1, 2, 300000, 1, 300000),
(2, 3, 800000, 1, 800000),
(2, 4, 600000, 3, 1800000),
-- Thêm dữ liệu cho invoiceDetail tiếp theo
(3, 5, 450000, 2, 900000),
(3, 6, 250000, 1, 250000),
(4, 7, 750000, 1, 750000),
(4, 8, 550000, 2, 1100000),
-- Thêm dữ liệu cho invoiceDetail tiếp theo
(5, 9, 700000, 1, 700000),
(5, 10, 600000, 2, 1200000),
(6, 1, 400000, 1, 400000),
(6, 2, 900000, 3, 2700000),
-- Thêm dữ liệu cho invoiceDetail tiếp theo
(7, 3, 650000, 2, 1300000),
(7, 4, 550000, 1, 550000),
(8, 5, 350000, 1, 350000),
(8, 6, 750000, 2, 1500000),
-- Thêm dữ liệu cho invoiceDetail tiếp theo
(9, 7, 900000, 1, 900000),
(9, 8, 1200000, 1, 1200000),
(10, 9, 800000, 2, 1600000),
(10, 10, 1100000, 3, 3300000);

-- Thêm dữ liệu vào bảng feedback
INSERT INTO feedback (userID, [content])
VALUES
(1, N'Sản phẩm rất tốt, tôi rất hài lòng'),
(2, N'Dịch vụ giao hàng nhanh chóng và chất lượng'),
(3, N'Chất lượng sản phẩm không đạt yêu cầu'),
(4, N'Giao hàng đúng hẹn, sản phẩm tuyệt vời'),
-- Thêm dữ liệu cho feedback tiếp theo
(5, N'Hàng hóa bị hỏng trong quá trình vận chuyển'),
(6, N'Đã mua hàng lần thứ hai và vẫn rất hài lòng'),
(7, N'Phục vụ tận tâm, nhân viên thân thiện'),
(8, N'Sản phẩm không giống như hình ảnh đã đăng'),
-- Thêm dữ liệu cho feedback tiếp theo
(9, N'Rất đáng tiền, tôi sẽ giới thiệu cho bạn bè'),
(10, N'Không hài lòng về kích thước sản phẩm'),
(1, N'Giao hàng chậm, nhưng sản phẩm tốt'),
(2, N'Dịch vụ khách hàng chưa tốt');
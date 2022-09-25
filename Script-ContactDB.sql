
-- CREACION DE LA BASE DE DATOS --
CREATE DATABASE Contact 
GO

USE Contact
GO

-- Tabla Personas --
CREATE TABLE People (
	[PersonID]	INT IDENTITY(1, 1) PRIMARY KEY,
	[FirstName]	VARCHAR(80)	NOT NULL,
	[LastName]	VARCHAR(80)		NULL,
	[PhoneNumber]	VARCHAR(32)	NOT NULL,
	[Email]	VARCHAR(256)		NULL,
)
GO

-- INSERTAR DATOS DE CONTACTOS --
INSERT INTO [dbo].[People] ([FirstName], [LastName], [PhoneNumber], [Email]) VALUES
('Elonore', 'Guinn', '(925) 5030624', 'eguinn0@dot.gov'),
('Leesa', 'Tuppeny', '(316) 1406446', 'ltuppeny1@twitter.com'),
('Vinnie', 'Klausewitz', '(526) 9449491', 'vklausewitz2@google.fr'),
('Davidde', 'Heynen', '(124) 3559630', 'dheynen3@networkadvertising.org'),
('Mort', 'Lowater', '(855) 1263135', 'mlowater4@usda.gov'),
('Nancey', 'Abbott', '(613) 8075810', 'nabbott5@devhub.com'),
('Meggie', 'Pellant', '(531) 9655108', 'mpellant6@aol.com'),
('Cymbre', 'Matuska', '(352) 3022051', 'cmatuska7@auda.org.au'),
('Ingmar', 'Baile', '(103) 8319596', 'ibaile8@google.com.hk'),
('Chrystal', 'Keenan', '(261) 3303845', 'ckeenan9@homestead.com'),
('Pet', 'Andrivel', '(458) 2719530', 'pandrivela@about.me'),
('Debi', 'Peet', '(291) 5989619', 'dpeetb@globo.com'),
('Elbertina', 'Stainland', '(111) 9715769', 'estainlandc@joomla.org'),
('Gherardo', 'Luetchford', '(363) 6524910', 'gluetchfordd@hhs.gov'),
('Bobby', 'Jeeves', '(670) 3571325', 'bjeevese@webeden.co.uk'),
('Annetta', 'Sheriff', '(464) 7939178', 'asherifff@independent.co.uk'),
('Aloysius', 'Peddar', '(876) 6708025', 'apeddarg@walmart.com'),
('Astra', 'Kirkman', '(611) 3926793', 'akirkmanh@sogou.com'),
('Jennilee', 'Gruszczak', '(930) 8641600', 'jgruszczaki@yellowpages.com'),
('Sauncho', 'Christofides', '(112) 3699376', 'schristofidesj@ovh.net'),
('Hyacinthia', 'Fullard', '(909) 4039515', 'hfullardk@blogtalkradio.com'),
('Leo', 'Bielfelt', '(957) 6806078', 'lbielfeltl@mail.ru'),
('Reamonn', 'Greener', '(509) 4913319', 'rgreenerm@weibo.com'),
('Barbabra', 'Gowry', '(967) 2452542', 'bgowryn@merriam-webster.com'),
('Aubrey', 'Sumers', '(705) 8912828', 'asumerso@miibeian.gov.cn'),
('Mireielle', 'Buckthought', '(787) 3811526', 'mbuckthoughtp@ebay.com'),
('Thomas', 'Vasilov', '(825) 1522173', 'tvasilovq@google.de'),
('Clair', 'Banbrook', '(821) 7364494', 'cbanbrookr@foxnews.com'),
('Griffie', 'Janes', '(319) 4596275', 'gjaness@shutterfly.com'),
('Keelby', 'Bythway', '(488) 4567598', 'kbythwayt@dmoz.org'),
('Alastair', 'Bartens', '(731) 9287002', 'abartensu@techcrunch.com'),
('Joellyn', 'Remmers', '(368) 5191539', 'jremmersv@wix.com'),
('Marcellina', 'Petrazzi', '(865) 9084867', 'mpetrazziw@sogou.com'),
('Hirsch', 'Hobgen', '(752) 2027507', 'hhobgenx@columbia.edu'),
('Lacie', 'Eastbrook', '(495) 5179956', 'leastbrooky@imdb.com'),
('Avivah', 'Darlington', '(260) 5218407', 'adarlingtonz@lulu.com'),
('Janaye', 'Trownson', '(698) 3567688', 'jtrownson10@deliciousdays.com'),
('Raphael', 'Savil', '(577) 9857555', 'rsavil11@nature.com'),
('Hayden', 'Corballis', '(716) 9191774', 'hcorballis12@hostgator.com'),
('Lalo', 'Timmons', '(992) 6435538', 'ltimmons13@newsvine.com'),
('Del', 'Rawlison', '(859) 6365562', 'drawlison14@senate.gov'),
('Pet', 'Joisce', '(415) 6040499', 'pjoisce15@w3.org'),
('Gerhard', 'Barfitt', '(955) 2721584', 'gbarfitt16@bloomberg.com'),
('Lotta', 'Fumagall', '(479) 2642441', 'lfumagall17@furl.net'),
('Janos', 'Piddletown', '(913) 8920071', 'jpiddletown18@ehow.com'),
('Mildred', 'Mora', '(267) 6931135', 'mmora19@wordpress.com'),
('Peterus', 'Gueinn', '(344) 8691578', 'pgueinn1a@vinaora.com'),
('Hubey', 'Pren', '(968) 9941376', 'hpren1b@wix.com'),
('Lexie', 'Talks', '(343) 9901386', 'ltalks1c@google.co.jp'),
('Adah', 'Pinhorn', '(438) 2573206', 'apinhorn1d@shutterfly.com');
GO

SELECT * FROM [dbo].[People]
GO

-- PROCEDIMIENTOS ALMACENADOS --

-- REGISTAR CONTACTO --
CREATE PROCEDURE uspAddContact (
	@FirstName	VARCHAR(80),
	@LastName	VARCHAR(80),
	@PhoneNumber	VARCHAR(80),
	@Email		VARCHAR(80)
)
AS
BEGIN
	INSERT INTO [dbo].[People] ([FirstName], [LastName], [PhoneNumber], [Email]) VALUES (@FirstName, @LastName, @PhoneNumber, @Email)
END
GO

-- EDITAR CONTACTO --
CREATE PROCEDURE uspEditContact (
	@PersonID	INT,
	@FirstName	VARCHAR(80),
	@LastName	VARCHAR(80),
	@PhoneNumber	VARCHAR(80),
	@Email		VARCHAR(80)
)
AS
BEGIN
	UPDATE People SET [FirstName] = @FirstName, [LastName] = @LastName, [PhoneNumber] = @PhoneNumber, [Email] = @Email
	WHERE PersonID = @PersonID
END
GO

-- ELIMINAR CONTACTO --
CREATE PROCEDURE uspDeleteContact (
	@PersonID	INT 
)
AS
BEGIN
	DELETE FROM [dbo].[People] WHERE [PersonID] = @PersonID
END
GO
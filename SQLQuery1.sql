--create database NewsServer

--use [NewsServer]

create table Estados
(
	EstadoID int primary key identity(1,1),
	Nombre varchar(200)
)

create table Usuarios
(
	UsuarioID int primary key identity(1,1),
	Nombre varchar(255),
	Contrasena varbinary,
	EstadoID int,
	constraint FK_UEstadoID foreign key (EstadoID) references Estados(EstadoID)
)

create table Fuentes
(
	FuenteID int primary key identity(1,1),
	NombreFuente varchar(30),
	EstadoID int,
	constraint FK_FEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_FUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)

create table Categorias
(
	CategoriaID int primary key identity(1,1),
	Nombre varchar(50),
	EstadoID int,
	constraint FK_CEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_CUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)

create table Idiomas
(
	IdiomaID int primary key identity(1,1),
	CodigoIdioma varchar(8),
	Nombre varchar(100),
	EstadoID int,
	constraint FK_IEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_IUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)

create table Paises
(
	PaisID int primary key identity(1,1),
	CodigoPais varchar(10),
	Nombre nvarchar(250),
	EstadoID int,
	constraint FK_PEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_PUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)

create table Autores
(
	AutorID int primary key identity(1,1),
	Nombre nvarchar(255),
	Apellido nvarchar(255),
	EstadoID int,
	constraint FK_AEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_AUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)


create table Articulos
(
	ArticuloID int primary key identity(1,1),
	Titulo varchar(255),
	AutorID int,
	constraint FK_AutorID foreign key (AutorID) references Autores(AutorID),
	Descripcion varchar(255),
	Contenido text,
	URLArticulo varchar(255),
	URLImagen varchar(255),
	FechaPublicacion datetime,
	Fecha datetime,
	FuenteID int,
	constraint FK_FuenteID foreign key (FuenteID) references Fuentes(FuenteID),
	CategoriaID int,
	constraint FK_CatgoriaID foreign key (CategoriaID) references Categorias(CategoriaID),
	PaisID int,
	constraint FK_PaisID foreign key (PaisID) references Paises(PaisID),
	IdiomaID int,
	constraint FK_IdiomaID foreign key (IdiomaID) references Idiomas(IdiomaID),
	EstadoID int,
	constraint FK_ArEstadoID foreign key (EstadoID) references Estados(EstadoID),
	UsuarioID int,
	constraint FK_ArUsuarioID foreign key (UsuarioID) references Usuarios(UsuarioID)
)
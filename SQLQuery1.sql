--create database NewsServer

--use [NewsServer]

create table States
(
	StateID int primary key identity(1,1),
	Name varchar(200)
)

create table Users
(
	UserID int primary key identity(1,1),
	Name varchar(255),
	Password varbinary,
	StateID int,
	constraint FK_UStateID foreign key (StateID) references States(StateID)
)

create table Sources
(
	SourceID int primary key identity(1,1),
	NameSource varchar(30),
	StateID int,
	constraint FK_FStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_FUserID foreign key (UserID) references Users(UserID)
)

create table Categories
(
	CategoryID int primary key identity(1,1),
	Name varchar(50),
	StateID int,
	constraint FK_CStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_CUserID foreign key (UserID) references Users(UserID)
)

create table SortBy
(
	SortID int primary key identity(1,1),
	Name varchar(200)
)

create table Languages
(
	LanguageID int primary key identity(1,1),
	CodigoIdioma varchar(8),
	Name varchar(100),
	StateID int,
	constraint FK_IStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_IUserID foreign key (UserID) references Users(UserID)
)

create table Countries
(
	CountryID int primary key identity(1,1),
	CountryCode varchar(10),
	Name nvarchar(250),
	StateID int,
	constraint FK_PStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_PUserID foreign key (UserID) references Users(UserID)
)

create table Authors
(
	AuthorID int primary key identity(1,1),
	Name nvarchar(255),
	Apellido nvarchar(255),
	StateID int,
	constraint FK_AStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_AUserID foreign key (UserID) references Users(UserID)
)


create table Articulos
(
	ArticleID int primary key identity(1,1),
	Title varchar(255),
	AuthorID int,
	constraint FK_AuthorID foreign key (AuthorID) references Authors(AuthorID),
	Description varchar(255),
	Content text,
	URLArticle varchar(255),
	URLImagen varchar(255),
	publishedAt datetime,
	Uptake int,
	SourceID int,
	constraint FK_SourceID foreign key (SourceID) references Sources(SourceID),
	CategoryID int,
	constraint FK_CatgoriaID foreign key (CategoryID) references Categories(CategoryID),
	CountryID int,
	constraint FK_CountryID foreign key (CountryID) references Countries(CountryID),
	LanguageID int,
	constraint FK_LanguageID foreign key (LanguageID) references Languages(LanguageID),
	StateID int,
	constraint FK_ArStateID foreign key (StateID) references States(StateID),
	UserID int,
	constraint FK_ArUserID foreign key (UserID) references Users(UserID),
	SortID int,
	constraint FK_ArSortID foreign key (SortID) references SortBy(SortID)
)

--alter table Articulos
--add 



INSERT INTO dbo.States(Name) VALUES('Activo'),('Eliminado')



INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AF', 'Afganistán',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AX', 'Islas Gland',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AL', 'Albania',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DE', 'Alemania',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AD', 'Andorra',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AO', 'Angola',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AI', 'Anguilla',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AQ', 'Antártida',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AG', 'Antigua y Barbuda',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AN', 'Antillas Holandesas',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SA', 'Arabia Saudí',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DZ', 'Argelia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AR', 'Argentina',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AM', 'Armenia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AW', 'Aruba',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AU', 'Australia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AT', 'Austria',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AZ', 'Azerbaiyán',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BS', 'Bahamas',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BH', 'Bahréin',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BD', 'Bangladesh',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BB', 'Barbados',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BY', 'Bielorrusia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BE', 'Bélgica',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BZ', 'Belice',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BJ', 'Benin',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BM', 'Bermudas',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BT', 'Bhután',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BO', 'Bolivia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BA', 'Bosnia y Herzegovina',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BW', 'Botsuana',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BV', 'Isla Bouvet',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BR', 'Brasil',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BN', 'Brunéi',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BG', 'Bulgaria',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BF', 'Burkina Faso',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'BI', 'Burundi',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CV', 'Cabo Verde',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KY', 'Islas Caimán',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KH', 'Camboya',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CM', 'Camerún',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CA', 'Canadá',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CF', 'República Centroafricana',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TD', 'Chad',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CZ', 'República Checa',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CL', 'Chile',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CN', 'China',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CY', 'Chipre',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CX', 'Isla de Navidad',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VA', 'Ciudad del Vaticano',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CC', 'Islas Cocos',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CO', 'Colombia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KM', 'Comoras',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CD', 'República Democrática del Congo',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CG', 'Congo',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CK', 'Islas Cook',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KP', 'Corea del Norte',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KR', 'Corea del Sur',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CI', 'Costa de Marfil',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CR', 'Costa Rica',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HR', 'Croacia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CU', 'Cuba',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DK', 'Dinamarca',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DM', 'Dominica',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DO', 'República Dominicana',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'EC', 'Ecuador',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'EG', 'Egipto',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SV', 'El Salvador',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AE', 'Emiratos Árabes Unidos',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ER', 'Eritrea',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SK', 'Eslovaquia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SI', 'Eslovenia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ES', 'España',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'UM', 'Islas ultramarinas de States Unidos',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'US', 'States Unidos',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'EE', 'Estonia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ET', 'Etiopía',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FO', 'Islas Feroe',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PH', 'Filipinas',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FI', 'Finlandia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FJ', 'Fiyi',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FR', 'Francia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GA', 'Gabón',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GM', 'Gambia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GE', 'Georgia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GS', 'Islas Georgias del Sur y Sandwich del Sur',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GH', 'Ghana',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GI', 'Gibraltar',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GD', 'Granada',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GR', 'Grecia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GL', 'Groenlandia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GP', 'Guadalupe',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GU', 'Guam',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GT', 'Guatemala',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GF', 'Guayana Francesa',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GN', 'Guinea',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GQ', 'Guinea Ecuatorial',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GW', 'Guinea-Bissau',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GY', 'Guyana',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HT', 'Haití',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HM', 'Islas Heard y McDonald',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HN', 'Honduras',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HK', 'Hong Kong',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'HU', 'Hungría',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IN', 'India',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ID', 'Indonesia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IR', 'Irán',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IQ', 'Iraq',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IE', 'Irlanda',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IS', 'Islandia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IL', 'Israel',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IT', 'Italia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'JM', 'Jamaica',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'JP', 'Japón',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'JO', 'Jordania',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KZ', 'Kazajstán',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KE', 'Kenia',1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KG', 'Kirguistán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KI', 'Kiribati', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KW', 'Kuwait', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LA', 'Laos', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LS', 'Lesotho', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LV', 'Letonia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LB', 'Líbano', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LR', 'Liberia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LY', 'Libia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LI', 'Liechtenstein', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LT', 'Lituania', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LU', 'Luxemburgo', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MO', 'Macao', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MK', 'ARY Macedonia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MG', 'Madagascar', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MY', 'Malasia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MW', 'Malawi', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MV', 'Maldivas', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ML', 'Malí', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MT', 'Malta', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FK', 'Islas Malvinas', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MP', 'Islas Marianas del Norte', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MA', 'Marruecos', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MH', 'Islas Marshall', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MQ', 'Martinica', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MU', 'Mauricio', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MR', 'Mauritania', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'YT', 'Mayotte', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MX', 'México', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'FM', 'Micronesia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MD', 'Moldavia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MC', 'Mónaco', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MN', 'Mongolia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MS', 'Montserrat', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MZ', 'Mozambique', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'MM', 'Myanmar', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NA', 'Namibia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NR', 'Nauru', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NP', 'Nepal', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NI', 'Nicaragua', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NE', 'Níger', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NG', 'Nigeria', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NU', 'Niue', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NF', 'Isla Norfolk', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NO', 'Noruega', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NC', 'Nueva Caledonia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NZ', 'Nueva Zelanda', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'OM', 'Omán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'NL', 'Países Bajos', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PK', 'Pakistán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PW', 'Palau', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PS', 'Palestina', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PA', 'Panamá', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PG', 'Papúa Nueva Guinea', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PY', 'Paraguay', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PE', 'Perú', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PN', 'Islas Pitcairn', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PF', 'Polinesia Francesa', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PL', 'Polonia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PT', 'Portugal', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PR', 'Puerto Rico', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'QA', 'Qatar', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'GB', 'Reino Unido', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'RE', 'Reunión', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'RW', 'Ruanda', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'RO', 'Rumania', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'RU', 'Rusia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'EH', 'Sahara Occidental', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SB', 'Islas Salomón', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'WS', 'Samoa', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'AS', 'Samoa Americana', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'KN', 'San Cristóbal y Nevis', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SM', 'San Marino', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'PM', 'San Pedro y Miquelón', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VC', 'San Vicente y las Granadinas', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SH', 'Santa Helena', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LC', 'Santa Lucía', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ST', 'Santo Tomé y Príncipe', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SN', 'Senegal', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CS', 'Serbia y Montenegro', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SC', 'Seychelles', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SL', 'Sierra Leona', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SG', 'Singapur', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SY', 'Siria', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SO', 'Somalia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'LK', 'Sri Lanka', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SZ', 'Suazilandia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ZA', 'Sudáfrica', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SD', 'Sudán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SE', 'Suecia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'CH', 'Suiza', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SR', 'Surinam', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'SJ', 'Svalbard y Jan Mayen', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TH', 'Tailandia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TW', 'Taiwán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TZ', 'Tanzania', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TJ', 'Tayikistán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'IO', 'Territorio Británico del Océano Índico', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TF', 'Territorios Australes Franceses', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TL', 'Timor Oriental', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TG', 'Togo', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TK', 'Tokelau', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TO', 'Tonga', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TT', 'Trinidad y Tobago', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TN', 'Túnez', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TC', 'Islas Turcas y Caicos', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TM', 'Turkmenistán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TR', 'Turquía', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'TV', 'Tuvalu', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'UA', 'Ucrania', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'UG', 'Uganda', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'UY', 'Uruguay', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'UZ', 'Uzbekistán', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VU', 'Vanuatu', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VE', 'Venezuela', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VN', 'Vietnam', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VG', 'Islas Vírgenes Británicas', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'VI', 'Islas Vírgenes de los States Unidos', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'WF', 'Wallis y Futuna', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'YE', 'Yemen', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'DJ', 'Yibuti', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ZM', 'Zambia', 1);
INSERT INTO dbo.Countries(CountryCode,Name, StateID) VALUES( 'ZW', 'Zimbabue', 1);


INSERT INTO dbo.SortBy(Name) VALUES('popularidad'),('fecha publicación')


INSERT INTO dbo.Languages(CodigoIdioma,Name) VALUES('ar', 'árabe')
,('de','alemán'),('en','inglés'),('es','español'),('fr','francés'),('it','italiano'),('ru','ruso')

INSERT INTO dbo.Categories(Name, StateID) VALUES('NEGOCIO',1),('ENTRETTENIMIENTO',1),('GENERAL',1)
,('SALUD',1),('CIENCIAS',1),('DEPORTES',1),('TENOLOGIA',1)


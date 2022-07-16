CREATE TABLE Local
(
   Id int IDENTITY(1,1) NOT NULL,
   Descricao varchar (255) NOT NULL,
   Latitude varchar (255) NOT NULL,
   Longitude varchar (255) NOT NULL,
   CONSTRAINT Pk_Local PRIMARY KEY (Id)
);

CREATE TABLE Clima
(
   Id int IDENTITY(1,1) NOT NULL,
   DescricaoLonga varchar (255) NOT NULL,
   DescricaoCurta varchar (255) NOT NULL,
   TemperaturaMinima varchar (255) NOT NULL,
   TemperaturaMaxima varchar (255) NOT NULL,
   Umidade varchar (255) NOT NULL,   
   DirecaoVento varchar (255) NOT NULL,
   CONSTRAINT Pk_Clima PRIMARY KEY (Id)
);

CREATE TABLE ClimaTempo
(
   IdLocal int NOT NULL,
   IdClima int NOT NULL,
   DataClimaTempo Date Default GETDATE(),
   CONSTRAINT Fk_Local FOREIGN KEY (IdLocal) REFERENCES Local(Id),
   CONSTRAINT Fk_Clima FOREIGN KEY (IdClima) REFERENCES Clima(Id),
);

INSERT INTO Local (Descricao, Latitude, Longitude) VALUES ('Balneário Camboriú','26.9924395° S', '48.6339782° W')
INSERT INTO Local (Descricao, Latitude, Longitude) VALUES ('Itajaí','26.9669023° S', '48.73600512° W')
INSERT INTO Local (Descricao, Latitude, Longitude) VALUES ('Florianópolis','27.5973002° S', '48.5496098° W')
INSERT INTO Local (Descricao, Latitude, Longitude) VALUES ('Curitiba','25.4295963° S', '49.2712724° W')
INSERT INTO Local (Descricao, Latitude, Longitude) VALUES ('Porto Alegre','30.0324999° S', '51.2303767° W')

INSERT INTO Clima (DescricaoLonga, DescricaoCurta, TemperaturaMinima, TemperaturaMaxima, Umidade, DirecaoVento) 
VALUES ('23°C Pred.nublado, vento sul','Nublado', '21°C', '25°C', '86%', 'Sul')
INSERT INTO Clima (DescricaoLonga, DescricaoCurta, TemperaturaMinima, TemperaturaMaxima, Umidade, DirecaoVento) 
VALUES ('30°C Pred.ensolarado, vento leste','Sol', '28°C', '32°C', '20%', 'Leste')
INSERT INTO Clima (DescricaoLonga, DescricaoCurta, TemperaturaMinima, TemperaturaMaxima, Umidade, DirecaoVento) 
VALUES ('18°C Pred.chuvoso, vento oeste','Chuva', '16°C', '20°C', '100%', 'Oeste')
INSERT INTO Clima (DescricaoLonga, DescricaoCurta, TemperaturaMinima, TemperaturaMaxima, Umidade, DirecaoVento) 
VALUES ('9°C Chuva de granizos, vento norte','Granizo', '5°C', '12°C', '100%', 'Norte')
INSERT INTO Clima (DescricaoLonga, DescricaoCurta, TemperaturaMinima, TemperaturaMaxima, Umidade, DirecaoVento) 
VALUES ('-1°C Neve, vento sudeste','Neve', '-5°C', '2°C', '100%', 'Sudeste')

INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (1,1,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (1,2,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (1,3,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (1,4,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (1,5,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (2,1,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (2,2,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (2,3,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (2,4,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (2,5,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (3,1,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (3,2,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (3,3,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (3,4,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (3,5,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (4,1,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (4,2,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (4,3,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (4,4,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (4,5,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (5,1,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (5,2,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (5,3,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (5,4,GETDATE())
INSERT INTO ClimaTempo(IdLocal, IdClima, DataClimaTempo) VALUES (5,5,GETDATE())

SELECT * FROM Local
SELECT * FROM Clima
SELECT * FROM ClimaTempo

SELECT l.Descricao, c.DescricaoLonga FROM Local l
INNER JOIN ClimaTempo ct ON l.Id = ct.IdLocal
INNER JOIN Clima c ON ct.IdClima = c.Id

SELECT l.Descricao, l.Latitude, l.Longitude, ct.DataClimaTempo, c.DescricaoLonga, c.DescricaoCurta, c.Umidade FROM Local l
INNER JOIN ClimaTempo ct ON l.Id = ct.IdLocal
INNER JOIN Clima c ON ct.IdClima = c.Id
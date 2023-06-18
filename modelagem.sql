
-- JORNADA DO USUARIO

CREATE TABLE USUARIOS (

idUsuario  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(14) NOT NULL UNIQUE,
dataNacimento DATE,
sexo VARCHAR(10) NOT NULL,
email VARCHAR(30) NOT NULL UNIQUE,
contato VARCHAR(15) NOT NULL
);


CREATE TABLE ENDERECO ( 

idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cep INT(8) NOT NULL,
rua  VARCHAR(30) NOT NULL,
numero  VARCHAR(30) NOT NULL,
cidade  VARCHAR(30) NOT NULL,
bairro  VARCHAR(30) NOT NULL,
complemento  VARCHAR(30) NOT NULL,
uf CHAR(2) NOT NULL,
id_usuario INT UNIQUE,

FOREIGN KEY(id_usuario)
REFERENCES USUARIOS(idUsuario)
);




-- CICLO DE COMPRA

CREATE TABLE PRODUTOS ( 

codProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sku VARCHAR(6) NOT NULL,
nome  VARCHAR(30) NOT NULL,
descricao TEXT,
preco  DOUBLE NOT NULL,
link_foto  VARCHAR(255),
quantidade INT,
id_estoque INT UNIQUE

FOREIGN KEY(id_estoque)
REFERENCES ESTOQUE(idEstoque)
);



CREATE TABLE ESTOQUE ( 

idEstoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
categoria VARCHAR(45),
disponibilidade  VARCHAR(1) NOT NULL,
nome_produto VARCHAR(45),
);


-- FINALIZACAO

CREATE TABLE COMPRA ( 

idCompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_pedido DATE NOT NULL,
valor_bruto DOUBLE NOT NULL,
valor_liq DOUBLE NOT NULL,
descontos DOUBLE,
cod_produto INT UNIQUE,
id_usuario INT UNIQUE,


FOREIGN KEY(id_usuario)
REFERENCES USUARIOS(idUsuario),

FOREIGN KEY(cod_produto)
REFERENCES PRODUTOS(codProduto)
);



--Inserindo dados tabela usuarios
INSERT INTO USUARIOS VALUES (null, "Jose Alberto Neves", "098.876.123-99","1998-04-15", "MASC", "josealberto@mail.com","62 3658-3518");
INSERT INTO USUARIOS VALUES (null, "Antonio Oliveira","012.983.256-72","1975-05-11", "MASC", "antoniooli@mail.com","61 3555-0123");
INSERT INTO USUARIOS VALUES (null, "Regina Brito", "083.235.645-90", "1998-06-20", "FEM", "reginabrito@mail.com","35 3333-3518");


-- tabela endereco
INSERT INTO ENDERECO VALUES (null, "01234567", "Brasil",100,"Sao Paulo","Centro"," ","SP",1);
INSERT INTO ENDERECO VALUES (null, "98765432", "Rua Major Silva",12, "Itapecerica da Serra","Pitangueiras", "Ap 12A","SP",1);
INSERT INTO ENDERECO VALUES (null, "06545123", "Rua Vila Lobos",98, "Osasco", "Vila das Flores", "Casa 2","SP",2);
INSERT INTO ENDERECO VALUES (null, "32987122", "Av Raquel Meyer",173, "Vitoria","Centro", "Ap 42 Bl 1","ES",3);


-- tabela estoque
INSERT INTO ESTOQUE VALUES (null, "Eletronico","Y","Computador");
INSERT INTO ESTOQUE VALUES (null, "Eletronico","Y","Notebook");
INSERT INTO ESTOQUE VALUES (null, "Acessorio","Y","Cabo USB C");
INSERT INTO ESTOQUE VALUES (null, "Acessorio","N","Conector USB");
INSERT INTO ESTOQUE VALUES (null, "Games","Y","Console XBOX One");
INSERT INTO ESTOQUE VALUES (null, "Games","y","Console Playstation");


-- tabela produtos
INSERT INTO PRODUTOS VALUES (null, "ABC123","Computador Ultima Geração","Computaodr i9 32Gb Ram 1TbHD, Placa GTX1090",4000.0,"computador.jpg",1,1);
INSERT INTO PRODUTOS VALUES (null, "CDE456","Notebook Ultima Geração","Notebook i7 16 Gb Ram 500Gb HD SSD",3850.00,"notebook.jpg",1,2);
INSERT INTO PRODUTOS VALUES (null, "FGH789", "Cabo USB C","Cabo USB 2M para carregar celulares",50.0,"cabousb.jpg",3,3);
INSERT INTO PRODUTOS VALUES (null, "IJK123","Conector USB","Conector USB para recarga em tomada 3A",35,"conector.jpg",10,4);
INSERT INTO PRODUTOS VALUES (null, "LMN456","Console XBOX One","Console XBOX One com Halo e 2 controles",1999.90,"xbox.jpg",1,5);
INSERT INTO PRODUTOS VALUES (null, "OPQ789","Console Playstation 5","Nao acompanha jogo, vem com 1 controle",2999.90,"ps5.jpg",1,6);
INSERT INTO PRODUTOS VALUES (null, "XYZ222","Console Playstation 3","Nao acompanha jogo, vem com 1 controle",1500.00,"ps3.jpg",2,6);


-- tabela compra
INSERT INTO COMPRA VALUES (null, "2023-03-25", 4000.0, 4000.0,0, 1,1);
INSERT INTO COMPRA VALUES (null, "2023-06-06", 50.0, 40.0, 10, 3,1);
INSERT INTO COMPRA VALUES (null, "2023-02-11", 2999.90, 2999.90, , 6,2);
INSERT INTO COMPRA VALUES (null, "2023-04-04", 35, 35, , 4,3);
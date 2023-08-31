use ecommerce;
-- inserindo dados no banco de dados

show tables;
desc clients;
insert into clients(Fname, Minit, Lname, CPF, Address) 
					values ('Amanda','A','Silva', 08274973003, 'Rua Praça XV de Novembro, Centro - RS'),
							 ('Bruno','B','Rutz', 66367096000,'Av Romualdo Barros, Carvoeira - SC'),
							 ('Júlio','J','Romero', 28625052002,'Avenida Alemeda Caetano, Centro - MG'),
							 ('Larissa','L','França', 40801601002,'Rua Princesa Isabel 1499, Centro - PR'),
							 ('Lupita','L','Ribeiro', 49179515002,'Quadra SHCES Quadra 1307 Bloco E, Cruzeiro Novo - DF'),
							 ('Talita','T','Cruz', 93634806079,'Rua José Zeferino de Paula, s/n, Centro - pb');
                             
desc product;
insert into product(Pname, Classification_kids, Category, Feedback, Size) 
						values ('Auriculares',false,'Eletrônico','4',null),
                              ('Barbie Patins',true,'Brinquedos','3',null),
                              ('Bermudas',true,'Vestimenta','5',null),
                              ('SSD 240GB',False,'Eletrônico','4',null),
                              ('Lego Harry Potter',False,'Brinquedos','3','3x57x80'),
                              ('Açúcar mascavo',False,'Alimentos','2',null),
                              ('Cabo USB',False,'Eletrônico','3',null);

desc orders;
insert into orders (idOrderClient, OrderStatus, OrderDescription, ShippingCost)
					values (1, default,'compra via aplicativo',null),
						 (2,default,'compra via aplicativo',50),
						 (3,'Confirmado',null,null),
						 (4,default,'compra via web site',150);

desc productOrder;
select * from orders;
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) 
					values(22,1,2,null), 
						(23,2,1,null), 
						(25,3,1,null);

desc productStorage;
insert into productStorage (StorageLocation,Quantity) 
							values ('Rio de Janeiro',1000),
									('Florianópolis',500),
									('São Paulo',10),
									('Curitiba',100),
									('Porto Alegre',10),
									('Brasília',60);

show tables;
insert into storeagelocation (idLproduct, idLstorage, location) 
						values(1,2,'RJ'),
							(2,6,'GO');

insert into supplier (SocialName, CNPJ, contact) 
							values ('Almeida Geral', 123456789123456,'21985474'),
								('Eletrônicos Félix',854519649143457,'21985484'),
								('Eletrônicos Speed', 934567893934695,'21975474');


insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Techpix', null, 123456789456321, null, 'Porto Alegre', 219946287),
					    ('LojaTech',null,null,123456783,'Rio de Janeiro', 219567895),
						('Brinquelândia',null,456789123654485,null,'São Paulo', 1198657484);
                        

select * from product;
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,23,80),
                         (2,24,10);
                         
                         
select * from clients;

-- Contando clientes
select count(*) from clients;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname as Client_name, count(*) as Num_Orders
		from clients c 
        inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 

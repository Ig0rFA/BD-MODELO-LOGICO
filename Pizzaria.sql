CREATE TABLE pizza (
	id int primary key auto_increment,
	sabor  varchar (45),
	preco decimal (9,2),
	descricao varchar (45),
	tamanho varchar(45),
	ingredientes varchar(45),
	receita_pizza_id int,
	embalagem_pizza_id int,
	constraint fk_receita FOREIGN KEY(receita_pizza_id) REFERENCES receita(id),
	constraint fk_embalagem FOREIGN KEY (embalagem_pizza_id) REFERENCES embalagem (id)
	);

	CREATE TABLE embalagem(
	id int primary key auto_increment,
	material varchar (50),
	tamanho varchar (50),
	preco decimal (9,2),
	pizza_id int,
	constraint fk_pizza
	foreign key (pizza_id) references pizza(id)
	);

	CREATE TABLE receita (
	id int primary key auto_increment,
	instrucao varchar (45),
	autor varchar(45),
	pizza_id int,
	constraint fk_pizza
	foreign key (pizza_id) references pizza(id)
	);

	CREATE TABLE ingredientes (
	id int primary key auto_increment, 
	descricao varchar(100)
	);

	CREATE TABLE ingredintes_pizza (
	ingredientes_id int,
	pizza_id int,
	constraint fk_ingredientes 
	foreign key (ingredientes_id) references ingredientes(id),
	constraint fk_pizza 
	foreign key(pizza_id) references pizza(id)
	);

	CREATE TABLE pizzaiolo (
	id int primary key auto_increment,
	nome varchar (45),
	salario decimal(9,2)
	);

	CREATE TABLE pizza_pizzaiolo (
	pizza_id int,
	pizzaiolo_id int,
	constraint fk_pizza foreign key (pizza_id) references pizza(id),
	constraint fk_pizzaiolo foreign Key (pizzaiolo_id) references pizzaiolo(id),
	primary key (pizza_id, pizzaiolo_id)
	);

/*inserir dados as tabelas:*/

/*Tabela Pizza:*/

	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id) 
	VALUES ('mussarela',49.90,'explosao de sabores','grande','mussarela',1);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('brasileira', 22.99, 'Pizza  estilo brasil', 'grande', 'Queijo, molho de tomate', 2);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Margherita', 19.99, 'pizza saudavel', 'pequena', 'Queijo, molho de tomate, ervas', 3);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Frango', 17.99, 'Pizza de frango', 'grande', 'Queijo, molho de tomate, frango desfiado', 4);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Calabresa', 16.49, 'Pizza de calabresa', 'média', 'Queijo, molho de tomate, calabresa', 5);

/*Tabela Pizzaiolo*/

	
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Igor', 3000.00);
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Rafael', 2500.00);
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Fernando', 2000.00);

/*tabela Receita*/

	
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('espalhe o molho e jogue os ingredientes tais como mussarela e oregano e leve ao forno ate dourar', 'bueno', 2);
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('espalhe o molho e jogue os ingredientes tais como mussarela e as ervas e leve ao forno ate dourar', 'jacam', 3);
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('espalhe o molho e jogue os ingredientes tais como mussarela calabresa e leve ao forno ate dourar', 'paola', 5);

/*Tabela Ingredientes*/

	
	INSERT INTO ingredientes (descricao)
	VALUES ('mussarela');
	INSERT INTO ingredientes (descricao)
	VALUES ('molho de tomate');
	INSERT INTO ingredientes (descricao)
	VALUES ('ervas');
	INSERT INTO ingredientes (descricao)
	VALUES ('Calabresa');
	INSERT INTO ingredientes (descricao)
	VALUES ('frango');

/*Tabela Embalagem*/


	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('papelão', 'Pequena', 3.99, 1);
	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('papelão', 'Média', 4.99, 2);
	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('papelão', 'Grande', 5.99, 3);


/*Crie um relatório com todas as pizzas e os pizzaiolos aptos a produzi-las;*/

	select pizza.sabor, pizzaiolo.nome
	from pizza
	inner join pizzaiolo 
	on pizzaiolo.id = pizza.id;

/*Crie um relatório com todas as pizzas e seus ingredientes;*/

	
	select pizza.sabor, ingredientes.descricao
	from pizza
	inner join ingredientes
	on ingredientes.id = pizza.id;

/*Crie um relatório com todos os ingredientes e as pizzas onde são utilizados;*/
 
	select ingredientes.descricao as "Ingredientes", pizza.sabor as "pizza"
	from ingredientes
	inner join pizza 
    	on pizza.id = ingredientes.id;

/*Crie um relatório com os sabores de todas as pizzas, o nome dos pizzaiolos que as fazem e as instruções para produzi-las;*/

	select pizza.sabor as "Pizza", pizzaiolo.nome as "Nome", receita.instrucao as "Instrucoes"
	from pizza
 	inner join pizzaiolo on pizza.id = pizzaiolo.id
 	inner join receita on receita_pizza_id = pizza.id;
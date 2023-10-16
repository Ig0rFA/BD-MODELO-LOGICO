# BD-MODELO-LOGICO
## Descrição

/*Observe o modelo conceitual no slide anterior e execute as seguintes etapas:/
/*Transforme o modelo conceitual em modelo lógico;*(imagem)*/

![exer1]()

/*Escreva o script SQL que cria o banco de dados;*/

	CREATE TABLE pizza (
	id int primary key auto_increment,
	sabor  varchar (45),
	preco decimal (9,2),
	descricao varchar (45),
	tamanho varchar(50),
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

	CREATE TABLE ingredintes_has_pizza (
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

	CREATE TABLE pizza_has_pizzaiolo (
	pizza_id int,
	pizzaiolo_id int,
	constraint fk_pizza foreign key (pizza_id) references pizza(id),
	constraint fk_pizzaiolo foreign Key (pizzaiolo_id) references pizzaiolo(id),
	primary key (pizza_id, pizzaiolo_id)
	);

/*inserir dados as tabelas:*/

/*Tabela Pizza:*/

	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id) 
	VALUES ('trez queijo',49.90,'pizza saborosa','media','mussarela, provolone, parmesao',1);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Pepperoni', 14.99, 'Pizza de pepperoni saborosa', 'Grande', 'Queijo, molho de tomate, pepperoni', 2);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Margherita', 11.99, 'Uma pizza simples e deliciosa', 'Média', 'Queijo, molho de tomate, manjericão', 3);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Frango com Catupiry', 13.99, 'Pizza de frango com catupiry cremoso', 'Grande', 'Queijo, molho de tomate, frango desfiado, catupiry', 4);
	INSERT INTO pizza (sabor, preco, descricao, tamanho, ingredientes, receita_pizza_id)
	VALUES ('Calabresa', 12.49, 'Pizza de calabresa com toque picante', 'Média', 'Queijo, molho de tomate, calabresa, cebola', 5);

/*Tabela Pizzaiolo*/

	
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Tiago Santos', 5000.00);
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Maria Clara', 2800.00);
	INSERT INTO pizzaiolo (nome, salario)
	VALUES ('Luiz Cassio', 1200.00);

/*tabela Receita*/

	
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('Misture o molho de tomate com o queijo ralado. Espalhe a mistura sobre a massa da pizza. Adicione as fatias de pepperoni e leve ao forno por 15 	minutos.', 'Chef Ana', 2);
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('Espalhe o molho de tomate sobre a massa da pizza. Cubra com queijo mussarela e coloque fatias de tomate e folhas de manjericão. Asse a pizza por 12 	minutos.', 'Chef Carlos', 3);
	INSERT INTO receita (instrucao, autor, pizza_id)
	VALUES ('Espalhe o molho de tomate sobre a massa da pizza. Adicione fatias de calabresa e cebola. Leve ao forno por 15 minutos até dourar.', 'Chef Luisa', 5);

/*Tabela Ingredientes*/

	
	INSERT INTO ingredientes (descricao)
	VALUES ('Queijo mussarela');
	INSERT INTO ingredientes (descricao)
	VALUES ('Molho de tomate');
	INSERT INTO ingredientes (descricao)
	VALUES ('Pepperoni');
	INSERT INTO ingredientes (descricao)
	VALUES ('Manjericão');
	INSERT INTO ingredientes (descricao)
	VALUES ('Calabresa');

/*Tabela Embalagem*/


	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('Papelão', 'Pequena', 1.99, 1);
	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('Papelão', 'Média', 2.99, 2);
	INSERT INTO embalagem (material, tamanho, preco, pizza_id)
	VALUES ('Papelão', 'Grande', 3.99, 3);


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
	inner join pizza on pizza.id = ingredientes.id;

/*Crie um relatório com os sabores de todas as pizzas, o nome dos pizzaiolos que as fazem e as instruções para produzi-las;*/

	select pizza.sabor as "Pizza", pizzaiolo.nome as "Nome", receita.instrucao as "Instrucoes"
	from pizza
 	inner join pizzaiolo on pizza.id = pizzaiolo.id
 	inner join receita on receita_pizza_id = pizza.id;

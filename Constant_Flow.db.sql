BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categorias" (
	"id_categoria"	INTEGER,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id_categoria" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "emprestimos" (
	"id_emprestimo"	INTEGER,
	"id_usuario"	INTEGER,
	"id_equipamento"	INTEGER,
	"data_emprestimo"	TEXT NOT NULL,
	"data_devolucao_prevista"	TEXT,
	"data_devolucao"	TEXT,
	"status"	TEXT,
	PRIMARY KEY("id_emprestimo" AUTOINCREMENT),
	FOREIGN KEY("id_equipamento") REFERENCES "equipamentos"("id_equipamento"),
	FOREIGN KEY("id_usuario") REFERENCES "usuarios"("id_usuario")
);
CREATE TABLE IF NOT EXISTS "equipamentos" (
	"id_equipamento"	INTEGER,
	"nome"	TEXT NOT NULL,
	"marca"	TEXT,
	"id_categoria"	INTEGER,
	"status"	TEXT,
	PRIMARY KEY("id_equipamento" AUTOINCREMENT),
	FOREIGN KEY("id_categoria") REFERENCES "categorias"("id_categoria")
);
CREATE TABLE IF NOT EXISTS "usuarios" (
	"id_usuario"	INTEGER,
	"nome"	TEXT NOT NULL,
	"telefone"	TEXT,
	"email"	TEXT,
	PRIMARY KEY("id_usuario" AUTOINCREMENT)
);
INSERT INTO "categorias" VALUES (1,'Ferramentas elétricas');
INSERT INTO "categorias" VALUES (2,'Equipamentos de medição');
INSERT INTO "categorias" VALUES (3,'Máquinas industriais');
INSERT INTO "emprestimos" VALUES (1,1,2,'2026-10-01','2026-10-05','2026-10-04','Devolvido');
INSERT INTO "emprestimos" VALUES (2,2,1,'2026-10-03','2026-10-08',NULL,'Em andamento');
INSERT INTO "emprestimos" VALUES (3,3,3,'2026-10-05','2026-10-10',NULL,'Em andamento');
INSERT INTO "emprestimos" VALUES (4,4,2,'2026-10-06','2026-10-09',NULL,'Em andamento');
INSERT INTO "equipamentos" VALUES (1,'Furadeira','Bosch',1,'Disponível');
INSERT INTO "equipamentos" VALUES (2,'Multímetro','Fluke',2,'Emprestado');
INSERT INTO "equipamentos" VALUES (3,'Compressor de ar','Schulz',3,'Disponível');
INSERT INTO "usuarios" VALUES (1,'João Silva','(31) 99999-1111','joao@email.com');
INSERT INTO "usuarios" VALUES (2,'Maria Souza','(31) 98888-2222','maria@email.com');
INSERT INTO "usuarios" VALUES (3,'Carlos Oliveira','(31) 97777-3333','carlos@email.com');
INSERT INTO "usuarios" VALUES (4,'Ana Santos','(31) 96666-4444','ana@email.com');
COMMIT;

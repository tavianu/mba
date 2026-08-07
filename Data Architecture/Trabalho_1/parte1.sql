CREATE TABLE `Cliente`(
    `id_cliente` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(150) NOT NULL,
    `n_documento` VARCHAR(20) NOT NULL,
    `idade` TINYINT NOT NULL,
    PRIMARY KEY (`id_cliente`),
    UNIQUE KEY `documento` (`n_documento`),
    CHECK (`idade` >= 18) 
);
CREATE TABLE `Conta`(
    `id_conta` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_cliente` BIGINT UNSIGNED NOT NULL,
    `saldo` DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (`id_conta`),
    CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`)
);
CREATE TABLE `Produto`(
    `id_produto` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome_produto` VARCHAR(150) NOT NULL,
    `valor` DECIMAL(15,2) NOT NULL,
    `tipo` VARCHAR(150) NOT NULL,
    PRIMARY KEY (`id_produto`),
    CHECK (`tipo` IN ('investimento', 'credito'))
);
CREATE TABLE `Contrato`(
    `id_conta` BIGINT UNSIGNED NOT NULL,
    `id_produto` BIGINT UNSIGNED NOT NULL,
    `valor` DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (`id_conta`, `id_produto`),
    CONSTRAINT `id_conta` FOREIGN KEY (`id_conta`) REFERENCES `Conta` (`id_conta`),
    CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`)
);
CREATE TABLE `Transacao`(
    `id_transacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_conta` BIGINT UNSIGNED NOT NULL,
    `valor` DECIMAL(15,2) NOT NULL,
    `tipo` VARCHAR(150) NOT NULL,
    `data_hora` DATETIME NOT NULL,
    PRIMARY KEY (`id_transacao`),
    CONSTRAINT `id_conta` FOREIGN KEY (`id_conta`) REFERENCES `Conta` (`id_conta`),
    CHECK (`tipo` IN ('PIX', 'TED', 'DOC'))
)
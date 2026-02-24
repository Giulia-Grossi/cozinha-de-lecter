<?php
/**
 * Este arquivo estabelece a conexão com o banco de dados MySQL.
 * Ele é incluído em todas as páginas que precisam acessar dados.
 */

// Configurações do banco de dados
$host = 'localhost';           // Servidor MySQL
$db = 'cozinha_lecter';        // Nome do banco de dados
$user = 'root';                // Usuário MySQL
$password = '';                // Senha MySQL (vazia em XAMPP/WAMP)
$charset = 'utf8mb4';          // Codificação de caracteres

// Criar a string de conexão (DSN)
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    // Criar conexão PDO (PHP Data Objects)
    // PDO é uma forma segura e moderna de conectar ao banco
    $pdo = new PDO(
        $dsn,
        $user,
        $password,
        [
            // ERRMODE_EXCEPTION: Lança exceções em caso de erro
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            // Retorna arrays associativos por padrão
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
    
} catch (PDOException $e) {
    // Se houver erro na conexão, exibe mensagem
    die("❌ Erro ao conectar ao banco de dados: " . $e->getMessage());
}

// Definir fuso horário (opcional, mas recomendado)
date_default_timezone_set('America/Sao_Paulo');
?>

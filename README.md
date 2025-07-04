O projeto consiste em uma aplicação Rails para gerenciar Pessoas, seus Documentos, Endereços e Projetos com:

    CRUD completo (Create, Read, Update, Delete)

    Relacionamentos 1×1 (Pessoa–Documento), 1×N (Pessoa–Endereços) e N×N (Pessoas–Projetos)

    Autenticação (Devise) com dois perfis de usuário:

        Admin: pode criar, editar e excluir registros
            email: admin@exemplo.com
            senha: senha123

        Usuário comum: só visualiza registros
            email: teste1@exemplo.com
            senha: 123456
            (Podem ser cadastrados novos usuários)

Forma de executar:

    > rails s

Uso de JavaScript:

    Formulário de Endereços Dinâmico

        #add-endereco clona um template oculto e insere novos blocos

        .remove-endereco marca _destroy e esconde/remova campos

    Validação de Login

        Script adiciona classes was-validated em formulários com needs-validation (Bootstrap)

    Navbar toogler

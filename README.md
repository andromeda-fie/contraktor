# Contraktor - Projeto ANDROMEDA

## 🚀 Sobre o Contraktor

Contraktor é o serviço de gerenciamento de contratos espaciais emitidos pela FIE (Federação Intergaláctica Ecma), projetado para emitir, listar contratos concluídos, expirados ou em aberto e atribuir contratos à pilotos da FIE que queiram dispor seu trabalho. Desenvolvido em Elixir, este serviço se destaca pela sua robustez, tolerância a falhas e no manejo concorrente de grandes quantidades de contratos sendo emitidos e/ou concluídos.

## 🛠️ Ambiente de Desenvolvimento

### Pré-requisitos

- Elixir (versão 1.16 ou superior)
- Docker e docker-compose (opcional)
- nix e nix-flakes (opcional)
- direnv (obrigatório caso queria configurar o postgresql com nix)

### Configurando o Projeto

#### Com Docker

Basta usar os scripts prontos contidos na pasta `./scripts` como:
- `start-dev`
- `run-tests`

#### Com nix

```sh
# se tiver direnv instalado, basta executar: direnv allow
nix develop

# Basta executar comandos de desenvolvimento
mix deps.get
mix compile
iex -S mix phx.server
```

## 📜 Regras de Negócio

- `Contraktor` deve garantir a integridade e segurança de todos os contratos.
- Um **contrato** pode apenas ser concluído após o piloto completar a lista de pedidos do mesmo.
- _TODO_

## 🏗️ Estrutura do Projeto

```sh
.
├── Earthfile
├── LICENSE
├── README.md
├── config
├── docker-compose.yml
├── flake.lock
├── flake.nix
├── lib
│   ├── contraktor
│   ├── contraktor.ex
│   ├── contraktor_web
│   └── contraktor_web.ex
├── mix.exs
├── mix.lock
├── scripts
└── test
    ├── contraktor_web
    ├── support
    └── test_helper.exs
```

---

📄Tenha maestria em gerenciamento de contratos eapciais com o Contraktor! 📄

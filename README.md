# SauceDemo QA Automation (Robot Framework)

Projeto de automação E2E para https://www.saucedemo.com/ com arquitetura organizada por domínio, testes orientados a dados (JSON) e execução sequencial/paralela.

## Cobertura atual

- Login: cenários positivos/negativos, campos obrigatórios, usuário bloqueado e proteção de rota.
- HomePage: validação de componentes principais, menu lateral, ordenação e badge do carrinho.
- Components: validação de logo, carrinho, menu lateral e footer.
- Checkout: fluxo completo de carrinho, information, overview e finalização.

## Estrutura do projeto

```plaintext
.
├── Data/
│   ├── checkout_test_data.json
│   ├── components_test_data.json
│   ├── homepage_test_data.json
│   └── login_test_data.json
├── Resources/
│   ├── Base.resource
│   ├── Pages/
│   └── Settings/
├── Test/
│   ├── CheckoutPageTest.robot
│   ├── ComponentsTest.robot
│   ├── HomePageTest.robot
│   └── LoginPageTest.robot
├── results/
├── requirements.txt
└── README.md
```

## Instalação

```bash
python -m pip install -r requirements.txt
```

## Execução dos testes

Sequencial:

```bash
python -m robot -d results Test
```

Paralelo (5 processos):

```bash
python -m pabot --processes 5 --outputdir results Test
```

Paralelo (8 processos):

```bash
python -m pabot --processes 8 --outputdir results Test
```

## Boas práticas adotadas

- Separação por domínio (Login, HomePage, Components e Checkout).
- Dados de teste externalizados em `Data/*.json`.
- Screenshot somente em falha para reduzir ruído e custo de I/O.
- Um único diretório de artefatos: `results/`.

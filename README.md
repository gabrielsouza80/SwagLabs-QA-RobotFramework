# SauceDemo QA Automation (Robot Framework)

E2E automation project for https://www.saucedemo.com/ with domain-based architecture, data-driven tests (JSON), and sequential/parallel execution.

## Current Coverage

- Login: positive/negative scenarios, required fields, locked user, and route protection.
- HomePage: validation of main components, side menu, sorting, and cart badge.
- Components: validation of logo, cart icon, side menu, and footer.
- Checkout: full flow for cart, information, overview, and completion.

## Project Structure

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

## Installation

```bash
python -m pip install -r requirements.txt
```

## Test Execution

Sequential:

```bash
python -m robot -d results Test
```

Parallel (5 processes):

```bash
python -m pabot --processes 5 --outputdir results Test
```

Parallel (8 processes):

```bash
python -m pabot --processes 8 --outputdir results Test
```

## Adopted Best Practices

- Domain-based separation (Login, HomePage, Components, and Checkout).
- Test data externalized in `Data/*.json`.
- Screenshot only on failure to reduce noise and I/O cost.
- Single artifacts directory: `results/`.

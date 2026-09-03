# Starter Nest

Starter profissional para projetos usando o framework Nest.js

# Stack do Starter

- TypeScript (5)
- Zod (4.5)
- ESLint (9)
- Husky (9.1)
- Lint Staged (17)
- Prettier (3.9)
- Prisma (7.10)
- Helmet (8.3)
- Cookie-parser (1.4)
- Bcrypt (6)
- Nest.js (12)

Para mais detalhes entre no arquivo package.json.

# Requisitos necessários

- Node.js LTS
- pnpm

# Instalação

```bash
pnpm install
```

# Desenvolvimento

```bash
pnpm start:dev
```

# Build

```bash
pnpm build
```

# Lint

```bash
pnpm lint
```

# Formatação

```bash
pnpm format
```

# .Env exemple

```text
PROJECT_NAME=
DATABASE_URL=
PORT=
```

## Estrutura do projeto

```text
src/
├── commom/
├── database/
├── generate/
├── config/
├── modules/
│   └── feature/
│       ├── controllers/
│       ├── use-cases/
│       ├── repository/
│       ├── schemas/
│       ├── types/
│       └── utils/
```

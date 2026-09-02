FROM node:24-slim AS base

WORKDIR /app

RUN corepack enable

FROM base AS development

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile --ignore-scripts

COPY . .

CMD ["pnpm", "start:dev"]

FROM base AS builder

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile --ignore-scripts

COPY . .

RUN pnpm build

FROM base AS production

ENV NODE_ENV=production

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --prod --frozen-lockfile

COPY --from=builder /app/dist ./dist

CMD ["pnpm", "start:prod"]
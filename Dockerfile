FROM node:24-slim AS base

WORKDIR /app

RUN corepack enable

ENV PNPM_HOME=/root/.local/share/pnpm
ENV PATH=$PNPM_HOME:$PATH

RUN corepack prepare pnpm@11.0.8 --activate

## Development stage

FROM base AS development

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./

RUN pnpm install --frozen-lockfile

COPY . .

CMD ["pnpm", "start:dev"]

## Builder stage

FROM base AS builder

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./

RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm build

## Production stage

FROM base AS production

ENV NODE_ENV=production

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./

RUN pnpm install --frozen-lockfile --prod

COPY --from=builder /app/dist ./dist

CMD ["pnpm", "start:prod"]
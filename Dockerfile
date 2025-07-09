FROM node:18-alpine AS base

FROM base AS deps

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache libc6-compat \
    && rm -rf /var/cache/apk/*

COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
COPY ./prisma ./prisma

RUN \
  if [ -f yarn.lock ]; then yarn config set registry https://registry.npmmirror.com && yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm config set registry https://registry.npmmirror.com && npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm config set registry https://registry.npmmirror.com && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

FROM base AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN \
  if [ -f yarn.lock ]; then yarn run build; \
  elif [ -f package-lock.json ]; then npm run build; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm run build; \
  else echo "Lockfile not found." && exit 1; \
  fi

FROM base AS runner

WORKDIR /app

ENV NODE_ENV=production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

RUN mkdir -p /app/logs && chown nextjs:nodejs /app/logs && chmod 755 /app/logs

USER nextjs

EXPOSE 3000

ENV PORT=3000

ENV HOSTNAME="0.0.0.0"
CMD ["node", "server.js"]

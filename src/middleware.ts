import { rateLimiterMiddleware } from "@/middleware/rate-limiter";
import { NextRequest, NextResponse } from "next/server";
import { getToken } from "next-auth/jwt";

import createIntlMiddleware from "next-intl/middleware";
import { routing } from "./i18n/routing";

const intlMiddleware = createIntlMiddleware(routing);

export async function middleware(req: NextRequest) {
  // 国际化
  const intlResponse = intlMiddleware(req);
  if (intlResponse) return intlResponse;

  // 限流
  const rateLimiterResp = await rateLimiterMiddleware(req);
  if (rateLimiterResp) return rateLimiterResp;

  // 鉴权
  const token = await getToken({ req });
  const isAuthenticated = !!token?.user;

  const PUBLIC_PATHS = ["/", "/sign-in", "/contact", "/changelog"];

  const isPublic = PUBLIC_PATHS.some((path) => req.nextUrl.pathname.startsWith(path));

  if (!isAuthenticated && !isPublic) {
    const loginUrl = new URL("/sign-in", req.url);
    return NextResponse.redirect(loginUrl);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/", "/(en|zh)/:path*", "/((?!api|_next|.*\\..*).*)"],
};

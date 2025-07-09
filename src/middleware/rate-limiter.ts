import { NextRequest, NextResponse } from "next/server";
import { RateLimiterMemory } from "rate-limiter-flexible";
import { getIP } from "@/utils/req";

const rateLimiterMemory = new RateLimiterMemory({
  points: 5,
  duration: 1,
  blockDuration: 60,
});

export const rateLimiterMiddleware = async (req: NextRequest) => {
  const ip = getIP(req);
  if (!ip || ip === "unknown") {
    return new NextResponse("IP not found", { status: 400 });
  }
  try {
    await rateLimiterMemory.consume(ip);
  } catch (e) {
    console.error(e);
    return new NextResponse("Too many requests", { status: 429 });
  }
};
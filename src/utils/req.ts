import { NextRequest } from "next/server";
import { NextApiRequest } from "next";

// 辅助函数：处理请求头的值
function getHeaderValue(value: string | string[] | null | undefined): string | null {
  if (!value) return null;
  if (Array.isArray(value)) return value[0] || null;
  return value;
}

// 辅助函数：从转发的IP中获取第一个IP
function getFirstIP(value: string | null): string | null {
  if (!value) return null;
  return value.split(",")[0].trim();
}

export function getIP(request: NextApiRequest | NextRequest): string {
  let ip: string = "unknown";

  if ("headers" in request) {
    if ("socket" in request) {
      // API 路由请求
      const req = request as NextApiRequest;

      // 处理不同的请求头
      const cfIP = getHeaderValue(req.headers["cf-connecting-ip"]);
      const realIP = getHeaderValue(req.headers["x-real-ip"]);
      const forwardedFor = getHeaderValue(req.headers["x-forwarded-for"]);
      const socketIP = req.socket.remoteAddress;

      // 按优先级获取IP
      ip =
        getFirstIP(cfIP) || getFirstIP(realIP) || getFirstIP(forwardedFor) || socketIP || "unknown";
    } else {
      // Middleware 请求
      const req = request as NextRequest;

      // NextRequest 的 headers 已经处理好了类型
      const cfIP = req.headers.get("cf-connecting-ip");
      const realIP = req.headers.get("x-real-ip");
      const forwardedFor = req.headers.get("x-forwarded-for");

      // 按优先级获取IP
      ip =
        getFirstIP(cfIP) || getFirstIP(realIP) || getFirstIP(forwardedFor) || req.ip || "unknown";
    }
  }

  return ip;
}

// 验证IP地址格式（可选）
export function isValidIP(ip: string): boolean {
  const ipv4Regex = /^(\d{1,3}\.){3}\d{1,3}$/;
  const ipv6Regex = /^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$/;

  return ipv4Regex.test(ip) || ipv6Regex.test(ip);
}

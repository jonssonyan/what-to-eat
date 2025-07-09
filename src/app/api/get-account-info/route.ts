import { respData, respErr } from "@/utils/resp";
import { NextRequest } from "next/server";
import { getCurrentAccountInfo } from "@/services/account";
import { CodeEnum } from "@/types/enums/code";
import logger from "@/lib/logger";

export const POST = async (req: NextRequest) => {
  try {
    const current = await getCurrentAccountInfo();
    if (!current) {
      return respErr("no auth", CodeEnum.UNAUTHORIZED);
    }
    return respData(current);
  } catch (e) {
    logger.error(`get account info failed: ${e}`);
    return respErr("get account info failed");
  }
};
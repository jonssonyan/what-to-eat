import { NextRequest } from "next/server";
import { respData, respErr } from "@/utils/resp";
import { getCurrentAccountInfo } from "@/services/account";
import prisma from "@/lib/prisma";
import { CodeEnum } from "@/types/enums/code";
import logger from "@/lib/logger";

export const POST = async (req: NextRequest) => {
  try {
    const current = await getCurrentAccountInfo();
    if (!current) {
      return respErr("no auth", CodeEnum.UNAUTHORIZED);
    }
    const count = await prisma.recommend.count({
      where: {
        accountId: BigInt(current.id),
      },
    });
    return respData(count);
  } catch (e) {
    logger.error(`count recommend failed: ${e}`);
    return respErr("count recommend failed");
  }
};

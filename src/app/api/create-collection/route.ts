import { respErr, respOk } from "@/utils/resp";
import { NextRequest } from "next/server";
import { z } from "zod";
import prisma from "@/lib/prisma";
import { getCurrentAccountInfo } from "@/services/account";
import { CodeEnum } from "@/types/enums/code";
import logger from "@/lib/logger";

const schema = z.object({
  recommendId: z.string(),
});

export const POST = async (req: NextRequest) => {
  try {
    const { recommendId } = schema.parse(await req.json());
    const current = await getCurrentAccountInfo();
    if (!current) {
      return respErr("no auth", CodeEnum.UNAUTHORIZED);
    }
    const count = await prisma.collection.count({
      where: {
        accountId: BigInt(current.id),
        recommendId: BigInt(recommendId),
      },
    });
    if (count > 0) {
      return respErr("已经收藏");
    }
    await prisma.collection.create({
      data: {
        accountId: BigInt(current.id),
        recommendId: BigInt(current.id),
      },
    });
    return respOk();
  } catch (e) {
    logger.error(`create collection failed: ${e}`);
    return respErr("create collection failed");
  }
};

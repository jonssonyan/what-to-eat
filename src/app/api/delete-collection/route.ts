import { NextRequest } from "next/server";
import { z } from "zod";
import { getCurrentAccountInfo } from "@/services/account";
import prisma from "@/lib/prisma";
import { respErr, respOk } from "@/utils/resp";
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
    await prisma.collection.deleteMany({
      where: {
        accountId: BigInt(current.id),
        recommendId: BigInt(recommendId),
      },
      limit: 1,
    });
    return respOk();
  } catch (e) {
    logger.error(`delete collection failed: ${e}`);
    return respErr("delete collection failed");
  }
};

import { respData, respErr } from "@/utils/resp";
import { NextRequest } from "next/server";
import { z } from "zod";
import prisma from "@/lib/prisma";
import { getCurrentAccountInfo } from "@/services/account";
import { Prisma } from "@prisma/client";
import logger from "@/lib/logger";

const schema = z.object({
  recommendId: z.string().optional(),
});

export const POST = async (req: NextRequest) => {
  try {
    const { recommendId } = schema.parse(await req.json());
    const current = await getCurrentAccountInfo();
    if (!current) {
      return respData(0);
    }
    const where: Prisma.CollectionWhereInput = {
      accountId: BigInt(current.id),
    };
    if (recommendId) {
      where.recommendId = BigInt(recommendId);
    }
    const count = await prisma.collection.count({
      where: where,
    });
    return respData(count);
  } catch (e) {
    logger.error(`count collection failed: ${e}`);
    return respErr("count collection failed");
  }
};

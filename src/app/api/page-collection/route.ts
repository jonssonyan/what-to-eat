import { NextRequest } from "next/server";
import { respData, respErr } from "@/utils/resp";
import prisma from "@/lib/prisma";
import { getCurrentAccountInfo } from "@/services/account";
import { z } from "zod";
import { CodeEnum } from "@/types/enums/code";
import { Prisma } from "@prisma/client";
import { RecommendEntity } from "@/types/recommend";
import logger from "@/lib/logger";

const schema = z.object({
  pageNo: z.number().min(1).max(1000),
  pageSize: z.number().min(1).max(20),
});

export const POST = async (req: NextRequest) => {
  try {
    const { pageNo, pageSize } = schema.parse(await req.json());
    const current = await getCurrentAccountInfo();
    if (!current) {
      return respErr("no auth", CodeEnum.UNAUTHORIZED);
    }

    const offset = (pageNo - 1) * pageSize;

    const query = Prisma.sql`
    SELECT r.* FROM collection c left join recommend r on c.recommend_id = r.id
    where c.account_id = ${current.id} order by c.create_time desc  LIMIT ${pageSize} OFFSET ${offset}
  `;
    const rows = await prisma.$queryRaw<RecommendEntity[]>(query);
    if (!rows) {
      return respData([]);
    }
    const results = rows.map((item) => {
      return {
        id: item.id.toString(),
        dietType: item.diet_type,
        flavorPreference: item.flavor_preference.split("\n"),
        difficulty: item.difficulty,
        cookingTime: item.cooking_time,
        name: item.name,
        desc: item.desc,
        ingredient: item.ingredient.split("\n"),
        step: item.step.split("\n"),
        tip: item.tip ? item.tip.split("\n") : [],
        size: item.size,
        createTime: item.create_time,
      };
    });
    return respData(results);
  } catch (e) {
    logger.error(`page collection failed: ${e}`);
    return respErr("page collection failed");
  }
};

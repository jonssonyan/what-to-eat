import { Prisma, Recommend } from "@prisma/client";
import prisma from "@/lib/prisma";
import { RecommendEntity } from "@/types/recommend";

export const getRecommend = async (
  dietType?: string,
  flavorPreference?: string,
  difficulty?: string,
  cookingTime?: string,
  restrictions?: string
): Promise<Recommend | null> => {
  const conditions: Prisma.Sql[] = [];

  if (dietType) {
    conditions.push(Prisma.sql`diet_type = ${dietType}`);
  }

  if (flavorPreference) {
    conditions.push(
      Prisma.sql`FIND_IN_SET(${flavorPreference}, REPLACE(flavor_preference, '\n', ','))`
    );
  }

  if (difficulty) {
    conditions.push(Prisma.sql`difficulty = ${difficulty}`);
  }

  if (cookingTime) {
    conditions.push(Prisma.sql`cooking_time <= ${cookingTime}`);
  }

  const query = Prisma.sql`
    SELECT * FROM recommend
    WHERE account_id = 0
    ${conditions.length > 0 ? Prisma.sql`AND ${Prisma.join(conditions, ` AND `)}` : Prisma.empty}
    ORDER BY rand()
    LIMIT 1
  `;
  const rows = await prisma.$queryRaw<RecommendEntity[]>(query);
  if (rows && rows.length > 0) {
    return {
      id: rows[0].id,
      accountId: rows[0].account_id,
      dietType: rows[0].diet_type,
      flavorPreference: rows[0].flavor_preference,
      difficulty: rows[0].difficulty,
      cookingTime: rows[0].cooking_time,
      name: rows[0].name,
      desc: rows[0].desc,
      ingredient: rows[0].ingredient,
      step: rows[0].step,
      tip: rows[0].tip,
      size: rows[0].size,
      createTime: rows[0].create_time,
    } as Recommend;
  }
  return null;
};

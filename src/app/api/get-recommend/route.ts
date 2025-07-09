import { respData, respErr } from "@/utils/resp";
import { getRecommend } from "@/services/recommend";
import { NextRequest } from "next/server";
import { z } from "zod";
import logger from "@/lib/logger";

const schema = z.object({
  dietType: z
    .string()
    .trim()
    .min(0, { message: "饮食偏好长度必须在 0 到 16 之间" })
    .max(16, { message: "饮食偏好长度必须在 0 到 16 之间" }),
  flavorPreference: z
    .string()
    .trim()
    .min(0, { message: "口味偏好长度必须在 0 到 16 之间" })
    .max(16, { message: "口味偏好长度必须在 0 到 16 之间" }),
  difficulty: z
    .string()
    .trim()
    .min(0, { message: "烹饪难度长度必须在 0 到 16 之间" })
    .max(16, { message: "烹饪难度长度必须在 0 到 16 之间" }),
  cookingTime: z
    .string()
    .trim()
    .min(0, { message: "烹饪时间长度必须在 0 到 16 之间" })
    .max(16, { message: "烹饪时间长度必须在 0 到 16 之间" }),
  restrictions: z
    .string()
    .trim()
    .min(0, { message: "禁忌食材长度必须在 0 到 128 之间" })
    .max(128, { message: "禁忌食材长度必须在 0 到 128 之间" }),
});

export const POST = async (req: NextRequest) => {
  try {
    const { dietType, flavorPreference, difficulty, cookingTime, restrictions } = schema.parse(
      await req.json()
    );
    const recommend = await getRecommend(
      dietType,
      flavorPreference,
      difficulty,
      cookingTime,
      restrictions
    );
    if (!recommend) {
      return respErr("菜谱还没有收录");
    }
    const result = {
      id: recommend.id.toString(),
      dietType: recommend.dietType,
      flavorPreference: recommend.flavorPreference ? recommend.flavorPreference.split("\n") : [],
      difficulty: recommend.difficulty,
      cookingTime: recommend.cookingTime,
      name: recommend.name,
      desc: recommend.desc,
      ingredient: recommend.ingredient ? recommend.ingredient.split("\n") : [],
      step: recommend.step ? recommend.step.split("\n") : [],
      tip: recommend.tip ? recommend.tip.split("\n") : [],
      size: recommend.size,
      createTime: recommend.createTime,
    };
    return respData(result);
  } catch (e) {
    logger.error(`get recommend failed: ${e}`);
    return respErr("get recommend failed");
  }
};

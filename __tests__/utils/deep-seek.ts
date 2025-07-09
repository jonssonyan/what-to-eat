import { deepSeekInvoke } from "@/utils/deep-seek";
import fs from "fs/promises";
import path from "path";
import prisma from "@/lib/prisma";
import { Recommend } from "@/types/recommend";

interface MarkdownFile {
  filename: string;
  content: string;
  fullPath: string;
}

describe("deepSeek", () => {
  test("deepSeekInvoke", async () => {
    const files: MarkdownFile[] = [];
    const dirPath = "D:\\WebstormProjects\\HowToCook\\dishes\\vegetable_dish\\";

    async function walk(currentPath: string) {
      try {
        const entries = await fs.readdir(currentPath, { withFileTypes: true });

        for (const entry of entries) {
          const fullPath = path.join(currentPath, entry.name);
          if (entry.isDirectory()) {
            await walk(fullPath);
          } else if (entry.isFile() && entry.name.endsWith(".md")) {
            const content = await fs.readFile(fullPath, "utf-8");
            files.push({
              filename: entry.name,
              content,
              fullPath,
            });
          }
        }
      } catch (err) {
        console.error(`读取目录失败: ${currentPath}`, err);
      }
    }

    await walk(dirPath);

    if (!files) {
      console.log("no result");
      return;
    }
    const promises: Promise<void>[] = [];
    files.forEach((item) => {
      const promise = (async () => {
        const result = await deepSeekInvoke(
          "doubao-1-5-lite-32k-250115",
          "##角色设定\n" +
            "你是专业的美食鉴赏家和文本解析助手\n" +
            "##字段说明\n" +
            "饮食偏好:枚举，素菜/荤菜/水产/早餐/主食/汤与粥/饮料/甜品/酱料\n" +
            "口味偏好:枚举，甜/咸/酸/苦/鲜/辛辣/鲜香/醇厚/烟熏/发酵，按照口味权重从前往后排序\n" +
            "烹饪难度:枚举，轻松上手/小试牛刀/得心应手/大展身手/大厨之道\n" +
            "烹饪时间:单位分钟，1-120之间的整数\n" +
            "份量:人数，1-20之间的整数\n" +
            "##任务\n" +
            "帮我识别菜谱的饮食偏好、口味偏好、烹饪难度、烹饪时间、名称、简介(详细)、食材(详细)、步骤(详细)、小贴士(详细)、图片、份量，**输出结果必须为 JSON 格式**。\n" +
            "**结果格式如下**\n" +
            "{\n" +
            '    "dietType": "素食",\n' +
            '    "flavorPreference": ["辣"],\n' +
            '    "difficulty": "小试牛刀",\n' +
            '    "cookingTime": "30",\n' +
            '    "name": "拔丝土豆",\n' +
            '    "desc": "拔丝土豆是一道色香味俱全的特色名菜",\n' +
            '    "ingredient": ["土豆 2 个"],\n' +
            '    "step": ["土豆去皮，切均匀的小块。"],\n' +
            '    "tip": ["对于使用剩余的食用油，可以考虑重新收集到油壶。"],\n' +
            '    "image": ["./1.jpeg"],\n' +
            '    "size": "3"\n' +
            "}",
          item.content
        );
        if (!result) {
          return;
        }
        try {
          const resultJson: Recommend = JSON.parse(result);
          if (!resultJson) return;
          const tip = resultJson.tip ? resultJson.tip.join("\n") : "";
          const image = resultJson.image ? resultJson.image.join("\n") : "";
          const flavorPreference = resultJson.flavorPreference
            ? resultJson.flavorPreference.join("\n")
            : "";
          const ingredient = resultJson.ingredient ? resultJson.ingredient.join("\n") : "";
          const step = resultJson.step ? resultJson.step.join("\n") : "";
          await prisma.recommend.create({
            data: {
              dietType: "素菜",
              flavorPreference: flavorPreference,
              difficulty: resultJson.difficulty,
              cookingTime: resultJson.cookingTime,
              name: resultJson.name,
              desc: resultJson.desc,
              ingredient: ingredient,
              step: step,
              tip: tip,
              image: image,
              size: resultJson.size,
            },
          });
        } catch (error) {
          console.error("parse json error:", error);
        }
      })();
      promises.push(promise);
    });
    await Promise.all(promises);
  }, 60000);
});

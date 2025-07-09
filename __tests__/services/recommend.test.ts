import { getRecommend } from "@/services/recommend";

describe("recommend", () => {
  test("getRecommend", async () => {
    const recommends = await getRecommend("水产", "辛辣", "大展身手", "15");
    console.log(recommends);
  });
});

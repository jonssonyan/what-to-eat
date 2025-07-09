import prisma from "@/lib/prisma";

describe("collection", () => {
  test("countCollection", async () => {
    const count = await prisma.collection.count({
      where: {
        recommendId: 297,
      },
    });
    console.log(count);
  });
});

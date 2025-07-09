import OpenAI from "openai";

const deepSeekClient = (): OpenAI => {
  return new OpenAI({
    baseURL: "https://ark.cn-beijing.volces.com/api/v3",
    apiKey: process.env["DEEP_SEEK_API_KEY"],
  });
};

export const deepSeekInvoke = async (
  model: string,
  prompt: string,
  text: string
): Promise<string | null> => {
  const client = deepSeekClient();
  const completion = await client.chat.completions.create({
    model: model,
    messages: [
      { role: "system", content: prompt },
      { role: "user", content: text },
    ],
  });
  return completion.choices[0].message.content;
};

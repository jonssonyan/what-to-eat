import { ZodError } from "zod";
import { respErr } from "@/utils/resp";

export function handleZodError(e: ZodError) {
  let errorMessage = "";
  e.errors.forEach((issue) => {
    errorMessage += `- ${issue.message}\n`;
  });
  return respErr(`Invalid params.\n${errorMessage}`);
}

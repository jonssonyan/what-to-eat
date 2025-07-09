import { CodeEnum, CodeMessage } from "@/types/enums/code";

export const respData = <T>(data: T) => {
  return respJson(CodeEnum.SUCCESS, CodeMessage[CodeEnum.SUCCESS], data);
};

export const respOk = () => {
  return respJson(CodeEnum.SUCCESS, CodeMessage[CodeEnum.SUCCESS]);
};

export const respErr = (message: string, code?: number) => {
  return respJson(code ? code : CodeEnum.FAILED, message);
};

export const respJson = <T>(code: number, message: string, data?: T) => {
  const json = {
    code: code,
    message: message,
    data: data,
  } as Result<T>;
  return Response.json(json);
};

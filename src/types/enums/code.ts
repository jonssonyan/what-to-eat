export enum CodeEnum {
  SUCCESS = 20000,
  FAILED = 50000,
  UNAUTHORIZED = 50401,
  FORBIDDEN = 50403,
  INVALID = 50001,
}

export const CodeMessage: Record<CodeEnum, string> = {
  [CodeEnum.SUCCESS]: "ok",
  [CodeEnum.FAILED]: "no",
  [CodeEnum.UNAUTHORIZED]: "unauthorized",
  [CodeEnum.FORBIDDEN]: "permission denied",
  [CodeEnum.INVALID]: "invalid",
};

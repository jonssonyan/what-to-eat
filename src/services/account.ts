import { authOptions } from "@/configs/auth";
import { getServerSession } from "next-auth";
import { AccountInfo } from "@/types/account";

export const getCurrentAccountInfo = async (): Promise<AccountInfo | null> => {
  const session = await getServerSession(authOptions);
  if (!session) {
    return null;
  }
  return {
    id: session.user.id,
    role: session.user.role,
    email: session.user.email,
    nickname: session.user.nickname,
    avatarUrl: session.user.avatarUrl,
  } as AccountInfo;
};

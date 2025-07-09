import GoogleProvider from "next-auth/providers/google";
import { NextAuthOptions, User } from "next-auth";
import prisma from "@/lib/prisma";
import logger from "@/lib/logger";

export const authOptions: NextAuthOptions = {
  session: { strategy: "jwt", maxAge: 7 * 24 * 60 * 60 },
  secret: process.env.NEXTAUTH_SECRET,
  pages: {
    signIn: "/sign-in",
  },
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID!,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET!,
    }),
  ],
  callbacks: {
    async jwt({ token, user, account }) {
      if (account?.type && account?.provider && account?.providerAccountId) {
        try {
          const dbAccount = await prisma.account.upsert({
            where: {
              signInType_signInProvider_signInOpenId: {
                signInType: account.type,
                signInProvider: account.provider,
                signInOpenId: account.providerAccountId,
              },
            },
            update: {
              email: user?.email || "",
              nickname: user?.name || "",
              avatarUrl: user?.image || "",
            },
            create: {
              role: "user",
              email: user?.email || "",
              nickname: user?.name || "",
              avatarUrl: user?.image || "",
              signInType: account.type,
              signInProvider: account.provider,
              signInOpenId: account.providerAccountId,
            },
          });
          if (!dbAccount || dbAccount.deleted == 1) {
            return token;
          }
          token.user = {
            id: dbAccount.id.toString(),
            role: dbAccount.role || "user",
            email: dbAccount.email,
            nickname: dbAccount.nickname,
            avatarUrl: dbAccount.avatarUrl,
          } as User;
          return token;
        } catch (error) {
          logger.error("Error upsert account:", error);
        }
      }
      return token;
    },
    async session({ session, token }) {
      if (token?.user) session.user = token.user as User;
      return session;
    },
  },
};

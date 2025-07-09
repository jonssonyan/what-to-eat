"use client";

import React, { useEffect } from "react";
import { signIn } from "next-auth/react";
import toast from "react-hot-toast";
import { useSearchParams } from "next/navigation";
import { useTranslations } from "next-intl";

const SignIn: React.FC = () => {
  const t = useTranslations("SignIn");
  const searchParams = useSearchParams();
  const error = searchParams.get("error");

  useEffect(() => {
    if (error) {
      switch (error) {
        case "CredentialsSignin":
          toast.error(t("credentialsSignIn"));
          break;
        case "AccessDenied":
          toast.error(t("accessDenied"));
          break;
        case "OAuthSignin":
          toast.error(t("oauthSignIn"));
          break;
        default:
          toast.error(`${t("signInFailed")}: ${error}`);
      }
    }
  }, [error]);

  const handleThirdPartyLogin = async (provider: string) => {
    if (!provider) {
      return;
    }
    if (provider === "wechat") {
      toast.error(t("signInWechatTip"));
      return;
    }
    if (provider === "google") {
      await signIn("google", { callbackUrl: "/profile" });
      return;
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center p-4 bg-gradient-to-br from-emerald-50 to-emerald-100 font-sans antialiased">
      <div className="max-w-md w-full mx-auto">
        <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-2xl p-8 space-y-6 border border-emerald-100/50">
          <div className="text-center mb-8">
            <h2 className="text-2xl font-bold text-emerald-800">{t("title")}</h2>
            <p className="text-emerald-600 mt-2">{t("subTitle")}</p>
          </div>

          <div className="grid grid-cols-2 gap-4 mt-6">
            <button
              onClick={() => handleThirdPartyLogin("wechat")}
              className="
                flex items-center justify-center
                space-x-2
                py-3 px-4
                border border-emerald-300
                rounded-xl
                hover:bg-emerald-50
                transition-colors
              "
            >
              <svg className="w-5 h-5 text-green-600" viewBox="0 0 24 24" fill="currentColor">
                <path d="M8.686 13.991c-1.170 0-2.118-.949-2.118-2.118s.948-2.118 2.118-2.118 2.118.949 2.118 2.118-.949 2.118-2.118 2.118zm6.628 0c-1.170 0-2.118-.949-2.118-2.118s.948-2.118 2.118-2.118 2.118.949 2.118 2.118-.949 2.118-2.118 2.118z"></path>
                <path d="M21.755 15.339c.232-.693.359-1.426.359-2.191 0-3.882-3.681-7.031-8.226-7.031s-8.226 3.15-8.226 7.031c0 3.882 3.681 7.031 8.226 7.031.815 0 1.605-.103 2.353-.294l2.118 1.164-.67-2.022c1.528-1.032 2.566-2.537 2.926-4.272M12 2C6.027 2 1 6.159 1 11.297c0 3.191 1.837 6.153 4.856 7.988l-.891 2.678 3.175-1.592c1.216.289 2.511.445 3.86.445 5.973 0 11-4.159 11-9.297S17.973 2 12 2"></path>
              </svg>
              <span className="text-sm font-medium text-emerald-700">{t("signInWechat")}</span>
            </button>

            <button
              onClick={() => handleThirdPartyLogin("google")}
              className="
                flex items-center justify-center
                space-x-2
                py-3 px-4
                border border-emerald-300
                rounded-xl
                hover:bg-emerald-50
                transition-colors
              "
            >
              <svg className="w-5 h-5" viewBox="0 0 24 24">
                <path
                  d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                  fill="#4285F4"
                />
                <path
                  d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                  fill="#34A853"
                />
                <path
                  d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                  fill="#FBBC05"
                />
                <path
                  d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                  fill="#EA4335"
                />
              </svg>
              <span className="text-sm font-medium text-emerald-700">{t("signInGoogle")}</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SignIn;

"use client";

import React from "react";
import TopNavigation from "@/components/TopNavigation";
import { useParams, usePathname } from "next/navigation";
import { useTranslations } from "next-intl";

interface PageInfo {
  title: string;
  description: string;
}

const DefaultLayout = ({ children }: { children: React.ReactNode }) => {
  const t = useTranslations("DefaultLayout");
  const pageInfoMap: Record<string, PageInfo> = {
    "/": {
      title: t("homeTitle"),
      description: t("homeDescription"),
    },
    "/profile": {
      title: t("profileTitle"),
      description: t("profileDescription"),
    },
  };

  const params = useParams();
  const locale = params.locale as string;
  const pathname = usePathname();
  const newPathname = pathname.replace(`/${locale}`, "");
  const pageInfo = pageInfoMap[newPathname] || { title: "", description: "" };

  return (
    <div className="min-h-screen bg-gradient-to-br from-emerald-50 to-emerald-100 font-sans antialiased">
      <TopNavigation />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <header className="text-center mb-10">
          <h1 className="text-3xl font-extrabold text-emerald-900 tracking-tight">
            {pageInfo.title}
          </h1>
          <p className="mt-2 text-lg text-emerald-700 max-w-2xl mx-auto">{pageInfo.description}</p>
        </header>
        {children}
      </div>
    </div>
  );
};

export default DefaultLayout;

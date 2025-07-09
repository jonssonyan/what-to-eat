"use client";

import React, { useState } from "react";
import { Globe, History, Home, Menu, MessageCircle, MessageSquare, User, X } from "lucide-react";
import { useParams, usePathname, useRouter } from "next/navigation";
import { useTranslations } from "next-intl";

interface NavLink {
  href: string;
  label: string;
  icon: React.ReactNode;
}

const LOCALES = [
  { code: "en", label: "English" },
  { code: "zh", label: "中文" },
];

const TopNavigation: React.FC = () => {
  const t = useTranslations("TopNavigation");
  const NAV_LINKS: NavLink[] = [
    { href: "/", label: t("home"), icon: <Home size={20} className="inline-block mr-1" /> },
    {
      href: "/profile",
      label: t("profile"),
      icon: <User size={20} className="inline-block mr-1" />,
    },
    {
      href: "/changelog",
      label: t("changelog"),
      icon: <History size={20} className="inline-block mr-1" />,
    },
    {
      href: "/contact",
      label: t("contact"),
      icon: <MessageCircle size={20} className="inline-block mr-1" />,
    },
    {
      href: "https://support.qq.com/products/718032",
      label: t("support"),
      icon: <MessageSquare size={20} className="inline-block mr-1" />,
    },
  ];
  const params = useParams();
  const locale = params.locale as string;
  const pathname = usePathname();
  const newPathname = pathname.replace(`/${locale}`, "");
  const router = useRouter();
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isLocaleMenuOpen, setIsLocaleMenuOpen] = useState(false);

  const getLinkClass = (href: string): string => {
    const isActive = (newPathname === "" ? "/" : newPathname) === href;
    return `px-3 py-2 rounded-lg transition-all ${
      isActive ? "bg-emerald-500 text-white" : "text-emerald-700 hover:bg-emerald-100"
    }`;
  };

  const switchLocale = (targetLocale: string) => {
    router.push(`/${targetLocale}${newPathname}`);
    setIsLocaleMenuOpen(false);
  };

  return (
    <nav className="relative">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center py-4">
          {/* Logo */}
          <div
            className="flex items-center cursor-pointer"
            onClick={() => {
              router.push("/");
            }}
          >
            <span className="text-2xl font-extrabold text-emerald-900">{t("title")}</span>
            <span className="text-emerald-600 text-sm ml-2">{t("description")}</span>
          </div>

          {/* Desktop Navigation */}
          <div className="hidden md:flex space-x-4">
            {NAV_LINKS.map((link, i) => (
              <button
                key={i}
                onClick={() => router.push(link.href)}
                className={getLinkClass(link.href)}
              >
                {link.icon} {link.label}
              </button>
            ))}
            <div className="relative">
              <button
                onClick={() => setIsLocaleMenuOpen(!isLocaleMenuOpen)}
                className="px-3 py-2 rounded-lg text-emerald-700 hover:bg-emerald-100 flex items-center"
              >
                <Globe size={20} className="mr-1" />
                {t("language")}
              </button>
              {isLocaleMenuOpen && (
                <div className="absolute right-0 mt-2 bg-white shadow-md rounded-lg z-50 w-32">
                  {LOCALES.map((l) => (
                    <button
                      key={l.code}
                      onClick={() => switchLocale(l.code)}
                      className={`w-full text-left px-4 py-2 hover:bg-emerald-100 ${
                        l.code === locale ? "text-emerald-500 font-semibold" : "text-gray-700"
                      }`}
                    >
                      {l.label}
                    </button>
                  ))}
                </div>
              )}
            </div>
          </div>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden text-emerald-700 hover:text-emerald-900"
          >
            {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {/* Mobile Menu */}
        {isMenuOpen && (
          <div className="md:hidden absolute top-full left-0 right-0 bg-white shadow-lg z-50">
            <div className="px-4 pt-2 pb-4 space-y-2">
              {NAV_LINKS.map((link, i) => (
                <button
                  key={i}
                  onClick={() => {
                    setIsMenuOpen(false);
                    router.push(link.href);
                  }}
                  className="w-full text-left px-3 py-2 rounded-lg hover:bg-emerald-100"
                >
                  {link.icon} {link.label}
                </button>
              ))}
              <div className="border-t pt-2">
                <p className="px-3 py-1 text-sm text-gray-500">{t("language")}</p>
                {LOCALES.map((l) => (
                  <button
                    key={l.code}
                    onClick={() => {
                      switchLocale(l.code);
                      setIsMenuOpen(false);
                    }}
                    className={`w-full text-left px-3 py-2 rounded-lg hover:bg-emerald-100 ${
                      l.code === locale ? "text-emerald-500 font-semibold" : "text-gray-700"
                    }`}
                  >
                    {l.label}
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
};

export default TopNavigation;

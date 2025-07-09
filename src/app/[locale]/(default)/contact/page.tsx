"use client";

import React from "react";
import { Github, MessageCircle, Send, X, Youtube } from "lucide-react";
import { useTranslations } from "next-intl";

const Contact = () => {
  const t = useTranslations("Contact");
  return (
    <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-2xl p-8 border border-emerald-100/50 space-y-6">
      <div className="flex items-center space-x-2">
        <MessageCircle className="text-emerald-600" size={24} />
        <h2 className="text-2xl font-bold text-emerald-800">联系我们</h2>
      </div>

      <div className="space-y-4 text-emerald-700 text-sm">
        <div className="flex items-center space-x-2">
          <Youtube size={18} className="text-emerald-500" />
          <span>
            {t("youtube")}
            <a
              href="https://youtube.com/@jonssonyan"
              className="text-emerald-600 underline hover:text-emerald-800"
            >
              https://youtube.com/@jonssonyan
            </a>
          </span>
        </div>

        <div className="flex items-center space-x-2">
          <X size={18} className="text-emerald-500" />
          <span>
            {t("x")}
            <a
              href="https://x.com/jonssonyan"
              className="text-emerald-600 underline hover:text-emerald-800"
            >
              https://x.com/jonssonyan
            </a>
          </span>
        </div>

        <div className="flex items-center space-x-2">
          <Github size={18} className="text-emerald-500" />
          <span>
            {t("github")}
            <a
              href="https://github.com/jonssonyan"
              className="text-emerald-600 underline hover:text-emerald-800"
            >
              https://github.com/jonssonyan
            </a>
          </span>
        </div>

        <div className="flex items-center space-x-2">
          <Send size={18} className="text-emerald-500" />
          <span>
            {t("telegram")}
            <a
              href="https://t.me/jonssonyan_channel"
              className="text-emerald-600 underline hover:text-emerald-800"
            >
              https://t.me/jonssonyan_channel
            </a>
          </span>
        </div>
      </div>

      <p className="text-xs text-emerald-500 mt-4">{t("tip")}</p>
    </div>
  );
};

export default Contact;

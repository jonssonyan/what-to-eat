"use client";

import React, { useEffect, useState } from "react";
import { ChevronRight, Filter } from "lucide-react";
import { Preferences } from "@/types/preferences";
import { Recommend } from "@/types/recommend";
import request from "@/utils/axios";
import { dietTypeList, difficultyList, flavorPreferenceList } from "@/configs/recommend";
import toast from "react-hot-toast";
import RecommendFC from "@/components/Recommend";
import { useTranslations } from "next-intl";

const DefaultPage = () => {
  const t = useTranslations("DefaultPage");

  const [preferences, setPreferences] = useState<Preferences>({
    dietType: "",
    flavorPreference: "",
    cookingTime: "10",
    difficulty: "",
    restrictions: "",
  });
  const [recommend, setRecommend] = useState<Recommend | null>(null);
  const [hasCollection, setHasCollection] = useState<number | null>(0);

  useEffect(() => {
    getRecommend();
  }, []);

  const getRecommend = async () => {
    toast(t("recommend_start"));

    const { data } = await request({
      url: "/api/get-recommend",
      method: "post",
      data: preferences,
    });
    setRecommend(data);
    await countCollection(data.id);

    // 向下滑动
    if (window.innerWidth <= 768) {
      // 页面加载后延迟执行滚动（避免页面未渲染完）
      window.addEventListener("load", () => {
        setTimeout(() => {
          const scrollAmount = window.innerHeight * 0.6;
          window.scrollBy({
            top: scrollAmount,
            behavior: "smooth",
          });
        }, 100);
      });
    }

    toast.success(t("recommend_success"));
  };

  const countCollection = async (recommendId: number) => {
    const { data } = await request({
      url: "/api/count-collection",
      method: "post",
      data: {
        recommendId,
      },
    });
    setHasCollection(data);
  };

  const createCollection = async () => {
    if (!recommend) return;
    const params = { recommendId: recommend.id };
    await request({
      url: "/api/create-collection",
      method: "post",
      data: params,
    });
    setHasCollection(1);
    toast.success("收藏成功");
  };

  return (
    <div className="grid md:grid-cols-2 gap-10">
      <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-2xl p-8 space-y-6 border border-emerald-100/50">
        <div className="space-y-4">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-semibold text-emerald-800">定制</h2>
            <Filter className="text-emerald-600" />
          </div>

          <div>
            <label className="block text-sm font-medium text-emerald-800 mb-3">饮食偏好</label>
            <div className="grid grid-cols-4 gap-2">
              {dietTypeList.map((option) => {
                const Icon = option.icon;
                return (
                  <button
                    key={option.value}
                    onClick={() => setPreferences({ ...preferences, dietType: option.value })}
                    className={`
                      flex flex-col items-center justify-center 
                      py-3 rounded-xl transition-all 
                      ${
                        preferences.dietType === option.value
                          ? "bg-emerald-500 text-white"
                          : "bg-emerald-100 text-emerald-700 hover:bg-emerald-200"
                      }
                    `}
                  >
                    <Icon className="mb-1" size={20} />
                    <span className="text-xs">{option.label}</span>
                  </button>
                );
              })}
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-emerald-800 mb-3">口味偏好</label>
            <div className="grid grid-cols-4 gap-2">
              {flavorPreferenceList.map((option) => {
                const Icon = option.icon;
                return (
                  <button
                    key={option.value}
                    onClick={() =>
                      setPreferences({ ...preferences, flavorPreference: option.value })
                    }
                    className={`
                      flex flex-col items-center justify-center 
                      py-3 rounded-xl transition-all 
                      ${
                        preferences.flavorPreference === option.value
                          ? "bg-emerald-500 text-white"
                          : "bg-emerald-100 text-emerald-700 hover:bg-emerald-200"
                      }
                    `}
                  >
                    <Icon className="mb-1" size={20} />
                    <span className="text-xs">{option.label}</span>
                  </button>
                );
              })}
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-emerald-800 mb-3">烹饪难度</label>
            <div className="grid grid-cols-3 gap-2">
              {difficultyList.map((level) => {
                const Icon = level.icon;
                return (
                  <button
                    key={level.value}
                    onClick={() =>
                      setPreferences({
                        ...preferences,
                        difficulty: level.value,
                      })
                    }
                    className={`
                      flex flex-col items-center justify-center 
                      py-3 rounded-xl transition-all 
                      ${
                        preferences.difficulty === level.value
                          ? "bg-emerald-500 text-white"
                          : "bg-emerald-100 text-emerald-700 hover:bg-emerald-200"
                      }
                    `}
                  >
                    <Icon className="mb-1" size={20} />
                    <span className="text-xs">{level.label}</span>
                  </button>
                );
              })}
            </div>
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-emerald-800 mb-3">
            烹饪时间 ({preferences.cookingTime} 分钟)
          </label>
          <input
            type="range"
            min="5"
            max="120"
            step="5"
            value={preferences.cookingTime}
            onChange={(e) =>
              setPreferences({
                ...preferences,
                cookingTime: e.target.value,
              })
            }
            className="w-full h-2 bg-emerald-200 rounded-lg appearance-none cursor-pointer"
          />
          <div className="flex justify-between text-sm text-emerald-600 mt-2">
            <span>5分钟</span>
            <span>120分钟</span>
          </div>
        </div>

        {/*<div>*/}
        {/*  <label className="block text-sm font-medium text-emerald-800 mb-3">禁忌食材</label>*/}
        {/*  <textarea*/}
        {/*    value={preferences.restrictions}*/}
        {/*    onChange={(e) =>*/}
        {/*      setPreferences({*/}
        {/*        ...preferences,*/}
        {/*        restrictions: e.target.value,*/}
        {/*      })*/}
        {/*    }*/}
        {/*    placeholder="请输入您想要避免的食材，用逗号分隔（例如：花生，牛奶，鸡蛋）"*/}
        {/*    rows={3}*/}
        {/*    className="*/}
        {/*        w-full px-3 py-2 */}
        {/*        border border-emerald-300 rounded-lg */}
        {/*        focus:outline-none focus:ring-2 focus:ring-emerald-500*/}
        {/*        resize-none*/}
        {/*        text-emerald-800*/}
        {/*        placeholder-emerald-500*/}
        {/*      "*/}
        {/*  />*/}
        {/*  <p className="text-xs text-emerald-600 mt-2">*/}
        {/*    <AlertTriangle className="inline-block mr-1 align-middle" size={14} />*/}
        {/*    输入您希望避免的食材，以逗号分隔*/}
        {/*  </p>*/}
        {/*</div>*/}

        <button
          onClick={getRecommend}
          className="
            w-full mt-6 py-4
            bg-emerald-600 text-white
            rounded-xl
            hover:bg-emerald-700
            transition-colors
            flex items-center justify-center
            space-x-2
            font-semibold
            group
          "
        >
          <span>发现美食</span>
          <ChevronRight className="transition-transform group-hover:translate-x-1" size={20} />
        </button>
      </div>

      {/* 推荐菜品展示区 */}
      {recommend && (
        <RecommendFC
          createCollection={createCollection}
          hasCollection={hasCollection}
          recommend={recommend}
        />
      )}
    </div>
  );
};

export default DefaultPage;

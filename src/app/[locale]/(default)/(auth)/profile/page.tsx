"use client";

import React, { useEffect, useState } from "react";
import { Recommend } from "@/types/recommend";
import { Clock, Flame, Heart, User, X } from "lucide-react";
import { useAppContext } from "@/contexts/app";
import request from "@/utils/axios";
import { getAccountTitle } from "@/configs/recommend";
import { signOut } from "next-auth/react";
import LoginOut from "@/components/LoginOut";
import RecommendDetailFC from "@/components/RecommendDetail";
import Image from "next/image";

const ProfilePage = () => {
  const { accountInfo } = useAppContext();
  const [collections, setCollections] = useState<Recommend[]>([]);
  const [collectionTotal, setCollectionTotal] = useState<number>(0);
  // const [recommendNo, setRecommendNo] = useState<number>(0);
  const [hasMore, setHasMore] = useState(true);
  const [pageNo, setPageNo] = useState(1);
  const [logoutOpen, setLogoutOpen] = useState(false);
  const [selectedRecommend, setSelectedRecommend] = useState<Recommend | null>(null);
  const [detailOpen, setDetailOpen] = useState(false);

  useEffect(() => {
    pageCollection(1);
    // countRecommend();
    countCollection();
  }, []);

  const countCollection = async () => {
    const { data } = await request({
      url: "/api/count-collection",
      method: "post",
      data: {},
    });
    setCollectionTotal(data);
  };

  const pageCollection = async (nextPage: number) => {
    const params = {
      pageNo: nextPage,
      pageSize: 10,
    };
    const { data } = await request({
      url: "/api/page-collection",
      method: "post",
      data: params,
    });

    if (data.length <= 10) {
      setHasMore(false);
    }

    if (nextPage === 1) {
      setCollections(data);
    } else {
      setCollections((prev) => [...prev, ...data]);
    }
  };

  // const countRecommend = async () => {
  //   const { data } = await request({
  //     url: "/api/count-recommend",
  //     method: "post",
  //   });
  //   setRecommendNo(data);
  // };

  const deleteCollection = async (recommendId: string) => {
    const newCollections = collections.filter((item) => item.id !== recommendId);
    setCollections(newCollections);
    setCollectionTotal((prev) => prev - 1);
    if (newCollections.length <= 10) {
      setHasMore(false);
    }
    await request({
      url: "/api/delete-collection",
      method: "post",
      data: { recommendId },
    });
  };

  const logout = async () => {
    await signOut({ callbackUrl: "/" });
  };

  const handleCollection = async (recommend: Recommend) => {
    setSelectedRecommend(recommend);
    setDetailOpen(true);
  };

  return (
    <div className="grid md:grid-cols-4 gap-6">
      <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-xl p-6 col-span-1 flex flex-col items-center">
        <div className="w-24 h-24 bg-emerald-100 rounded-full flex items-center justify-center mb-4">
          <Image
            src={accountInfo?.avatarUrl}
            alt="User Avatar"
            width={96}
            height={96}
            className="rounded-full border border-gray-300"
          />
        </div>
        <h2 className="text-xl font-semibold text-emerald-900">@{accountInfo?.nickname}</h2>
        <p className="text-emerald-600 mb-4">称号: {getAccountTitle(collections.length)}</p>
        <div className="flex space-x-4">
          <div className="text-center">
            <span className="block text-emerald-900 font-bold">{collectionTotal}</span>
            <span className="text-emerald-600 text-sm">收藏菜谱</span>
          </div>
          {/*<div className="text-center">*/}
          {/*  <span className="block text-emerald-900 font-bold">{recommendNo}</span>*/}
          {/*  <span className="text-emerald-600 text-sm">生成菜谱</span>*/}
          {/*</div>*/}
        </div>
        <button
          onClick={() => setLogoutOpen(true)}
          className="mt-2 w-full py-2 px-4 bg-emerald-50 text-emerald-700 font-medium rounded-xl hover:bg-emerald-100 transition"
        >
          退出登录
        </button>
      </div>

      {/* 确认弹窗 */}
      <LoginOut open={logoutOpen} onClose={() => setLogoutOpen(false)} onConfirm={logout} />

      <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-xl p-6 col-span-3 space-y-4">
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-2xl font-semibold text-emerald-900">我的收藏</h2>
        </div>

        {collections.length === 0 ? (
          <div className="text-center py-10 text-emerald-600">
            <Heart className="mx-auto mb-4" size={48} />
            <p>你还没有收藏任何菜谱</p>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 gap-4">
            {collections.map((recipe) => (
              <div
                key={recipe.id}
                className="bg-emerald-50 rounded-2xl p-4 flex justify-between items-start"
              >
                <div onClick={() => handleCollection(recipe)}>
                  <h3 className="text-xl font-bold text-emerald-900 mb-2">{recipe.name}</h3>
                  <p className="text-emerald-600 text-sm mb-3">{recipe.desc}</p>
                  <div className="flex space-x-3">
                    <div className="flex items-center space-x-1">
                      <Clock className="text-emerald-600" size={16} />
                      <span className="text-emerald-700">{recipe.cookingTime}分钟</span>
                    </div>
                    <div className="flex items-center space-x-1">
                      <Flame className="text-emerald-600" size={16} />
                      <span className="text-emerald-700">新手级别</span>
                    </div>
                  </div>
                </div>
                <div className="flex flex-col space-y-2">
                  <button
                    onClick={() => deleteCollection(recipe.id)}
                    className="text-emerald-600 hover:text-emerald-800 transition"
                  >
                    <Heart size={20} fill="currentColor" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}

        {hasMore && (
          <div className="text-center mt-4">
            <button
              onClick={() => {
                const nextPage = pageNo + 1;
                setPageNo(nextPage);
                pageCollection(nextPage);
              }}
              className="px-4 py-2 bg-emerald-100 text-emerald-600 rounded hover:bg-emerald-200 transition"
            >
              加载更多
            </button>
          </div>
        )}
      </div>
      {selectedRecommend && (
        <div
          className={`fixed inset-0 bg-black/30 backdrop-blur-sm z-50 transition-all duration-300 ${
            detailOpen ? "opacity-100 visible" : "opacity-0 invisible"
          } flex items-center justify-center p-4`}
          onClick={() => setDetailOpen(false)}
        >
          <div
            className="relative bg-gradient-to-br from-white to-gray-50 rounded-3xl shadow-2xl w-full max-w-3xl max-h-[90vh] overflow-hidden transform transition-all duration-300 ease-out border border-gray-100"
            onClick={(e) => e.stopPropagation()}
            style={{
              transform: detailOpen ? "scale(1)" : "scale(0.98)",
              opacity: detailOpen ? 1 : 0,
            }}
          >
            {/* 关闭按钮 */}
            <button
              className="absolute top-5 right-5 z-10 p-2 rounded-full hover:bg-gray-100 transition-all duration-200 text-gray-500 hover:text-gray-700 bg-white shadow-sm"
              onClick={() => setDetailOpen(false)}
              aria-label="Close modal"
            >
              <X size={20} />
            </button>

            <div className="overflow-y-auto max-h-[90vh] scrollbar-hide p-8">
              <div className="space-y-8">
                <RecommendDetailFC recommend={selectedRecommend} />
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProfilePage;

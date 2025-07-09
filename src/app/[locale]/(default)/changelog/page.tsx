"use client";

import React from "react";
import { CalendarDays, FileText, ListChecks } from "lucide-react";

const changelog = [
  {
    version: "v1.0.3",
    date: "2025-05-13",
    changes: ["新增「国际化」，切换语言"],
  },
  {
    version: "v1.0.2",
    date: "2025-05-12",
    changes: ["新增「Google 登陆」"],
  },
  {
    version: "v1.0.1",
    date: "2025-05-01",
    changes: [
      "新增「更新日志」模块，用户可随时查看历史版本变更",
      "新增「联系我们」模块，用户可加入交流社区，一起交流进步",
    ],
  },
  {
    version: "v1.0.0 首发上线",
    date: "2025-04-30",
    changes: [
      "用户注册 / 登录 / 注销功能上线",
      "个性化「菜品推荐」系统上线，支持饮食偏好、口味喜好、烹饪时间等多项条件定制",
      "新增收藏夹模块，支持查看和管理已收藏内容",
      "新增用户称号系统，根据收藏自动授予等级称号",
      "提升移动端展示兼容性",
      "提供产品反馈入口，收集用户建议与意见",
    ],
  },
];

const ChangeLog = () => {
  return (
    <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-2xl p-8 border border-emerald-100/50 space-y-6">
      <div className="flex items-center space-x-2">
        <FileText className="text-emerald-600" size={24} />
        <h2 className="text-2xl font-bold text-emerald-800">更新日志</h2>
      </div>

      <div className="space-y-6">
        {changelog.map((log) => (
          <div key={log.version} className="space-y-2">
            <div className="flex items-center justify-between">
              <span className="text-emerald-700 font-semibold">{log.version}</span>
              <div className="flex items-center text-sm text-emerald-500 space-x-1">
                <CalendarDays size={14} />
                <span>{log.date}</span>
              </div>
            </div>
            <ul className="list-disc pl-6 space-y-1 text-emerald-800 text-sm">
              {log.changes.map((item, idx) => (
                <li key={idx} className="flex items-start space-x-2">
                  <ListChecks size={16} className="mt-0.5 text-emerald-500" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ChangeLog;

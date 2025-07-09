export interface Recommend {
  id: string;
  accountId: string;
  dietType: string; // 饮食偏好
  flavorPreference: string[]; // 口味偏好
  difficulty: string; // 烹饪难度
  cookingTime: string; // 烹饪时间
  name: string; // 名称
  desc: string; // 简介
  ingredient: string[]; // 食材
  step: string[]; // 步骤
  tip?: string[]; // 小贴士
  image?: string[]; // 图片
  size: string; // 人数
  createTime: Date; // 创建时间
}

export interface RecommendEntity {
  id: bigint;
  account_id: bigint;
  diet_type: string;
  flavor_preference: string;
  difficulty: string;
  cooking_time: string;
  name: string;
  desc: string;
  ingredient: string;
  step: string;
  tip: string;
  size: string;
  create_time: Date;
}

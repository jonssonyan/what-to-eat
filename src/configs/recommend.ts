import {
  Apple,
  ChefHat,
  Coffee,
  CookingPot,
  EggFried,
  Leaf,
  LeafyGreen,
  Utensils,
} from "lucide-react";

// 饮食偏好
export const dietTypeList = [
  { value: "素菜", label: "素菜", icon: Apple },
  { value: "荤菜", label: "荤菜", icon: Apple },
  { value: "水产", label: "水产", icon: LeafyGreen },
  { value: "早餐", label: "早餐", icon: LeafyGreen },
  { value: "主食", label: "主食", icon: LeafyGreen },
  { value: "汤与粥", label: "汤与粥", icon: LeafyGreen },
  { value: "饮料", label: "饮料", icon: LeafyGreen },
  { value: "甜品", label: "甜品", icon: LeafyGreen },
  { value: "酱料", label: "酱料", icon: LeafyGreen },
];

// 口味偏好
export const flavorPreferenceList = [
  { value: "甜", label: "甜", icon: Leaf },
  { value: "咸", label: "咸", icon: Leaf },
  { value: "酸", label: "酸", icon: Leaf },
  { value: "苦", label: "苦", icon: Leaf },
  { value: "鲜", label: "鲜", icon: Leaf },
  { value: "辛辣", label: "辛", icon: Leaf },
  { value: "鲜香", label: "鲜香", icon: Leaf },
  { value: "醇厚", label: "醇厚", icon: Leaf },
  { value: "烟熏", label: "烟熏", icon: Leaf },
  { value: "发酵", label: "发酵", icon: Leaf },
];

// 烹饪难度
export const difficultyList = [
  { value: "轻松上手", label: "轻松上手", icon: Coffee },
  { value: "小试牛刀", label: "小试牛刀", icon: Utensils },
  { value: "得心应手", label: "得心应手", icon: EggFried },
  { value: "大展身手", label: "大展身手", icon: CookingPot },
  { value: "大厨之道", label: "大厨之道", icon: ChefHat },
];

// 称号
export const getAccountTitle = (len: number): string => {
  if (len > 5) {
    return "厨房新手";
  } else if (len > 10) {
    return "炒菜达人";
  } else if (len > 15) {
    return "家常美食家";
  } else if (len > 20) {
    return "厨房魔法师";
  } else if (len > 25) {
    return "美食艺术家";
  } else if (len > 30) {
    return "菜谱鉴赏家";
  } else if (len > 35) {
    return "菜谱宝库";
  } else if (len > 40) {
    return "舌尖上的舞者";
  } else if (len > 45) {
    return "味觉大师";
  } else if (len > 50) {
    return "美食传承者";
  } else if (len > 55) {
    return "烹饪宗师";
  } else if (len > 60) {
    return "食神在世";
  }
  return "美食小白";
};

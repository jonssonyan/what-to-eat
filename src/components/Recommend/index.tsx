import { Clock, Flame, Heart, Leaf, PersonStanding } from "lucide-react";
import React from "react";
import { Recommend } from "@/types/recommend";

type RecommendProps = {
  createCollection: () => void;
  hasCollection: number | null;
  recommend: Recommend;
};

const RecommendFC = ({ createCollection, recommend, hasCollection }: RecommendProps) => {
  return (
    <div className="bg-white/80 backdrop-blur-md rounded-3xl shadow-2xl p-8 space-y-6 border border-emerald-100/50 relative">
      <div className="flex justify-between items-start">
        <div>
          <h2 className="text-3xl font-bold text-emerald-900 mb-2">{recommend.name}</h2>
          <p className="text-emerald-600 italic">{recommend.desc}</p>
        </div>
        <button
          onClick={createCollection}
          className={`
                absolute top-4 right-4 
                bg-emerald-100 text-emerald-600 
                p-2 rounded-full 
                hover:bg-emerald-200 
                transition
                ${
                  hasCollection && hasCollection > 0
                    ? "bg-red-100 text-red-600 hover:bg-red-200"
                    : "bg-emerald-100 text-emerald-600 hover:bg-emerald-200"
                }`}
        >
          <Heart size={20} />
        </button>
      </div>

      <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
        {[
          { icon: Leaf, text: recommend.dietType },
          { icon: Flame, text: recommend.difficulty },
          { icon: Clock, text: `${recommend.cookingTime}分钟` },
          { icon: PersonStanding, text: `${recommend.size}人` },
        ].map(({ icon: Icon, text }, index) => (
          <div
            key={index}
            className="
                  flex items-center justify-center
                  space-x-2 bg-emerald-100
                  p-3 rounded-xl
                "
          >
            <Icon className="text-emerald-600" size={20} />
            <span className="text-emerald-800 font-medium">{text}</span>
          </div>
        ))}
      </div>

      <div className="grid gap-6">
        <div>
          <h3 className="font-semibold text-emerald-700 mb-3">食材清单</h3>
          <ul className="space-y-2 text-emerald-800">
            {recommend.ingredient.map((ingredient) => (
              <li
                key={ingredient}
                className="flex items-center space-x-2 bg-emerald-50 px-3 py-2 rounded-lg"
              >
                <Leaf className="text-emerald-500" size={16} />
                <span>{ingredient}</span>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="font-semibold text-emerald-700 mb-3">烹饪步骤</h3>
          <ol className="space-y-2 text-emerald-800">
            {recommend.step.map((step, index) => (
              <li
                key={index}
                className="flex items-start space-x-3 bg-emerald-50 px-3 py-2 rounded-lg"
              >
                <span className="font-bold text-emerald-500">{index + 1}.</span>
                <span>{step}</span>
              </li>
            ))}
          </ol>
        </div>

        <div>
          <h3 className="font-semibold text-emerald-700 mb-3">小贴士</h3>
          <ul className="space-y-2 text-emerald-800">
            {recommend.tip &&
              recommend.tip.map((tip) => (
                <li
                  key={tip}
                  className="flex items-center space-x-2 bg-emerald-50 px-3 py-2 rounded-lg"
                >
                  <Leaf className="text-emerald-500" size={16} />
                  <span>{tip}</span>
                </li>
              ))}
          </ul>
        </div>
      </div>
    </div>
  );
};
export default RecommendFC;

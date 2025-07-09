import { Clock, Flame, Leaf, PersonStanding } from "lucide-react";
import React from "react";
import { Recommend } from "@/types/recommend";

type RecommendProps = {
  recommend: Recommend;
};

const RecommendDetailFC = ({ recommend }: RecommendProps) => {
  return (
    <div className="p-8 space-y-6 relative">
      <div className="flex justify-between items-start">
        <div>
          <h2 className="text-3xl font-bold text-emerald-900 mb-2">{recommend.name}</h2>
          <p className="text-emerald-600 italic">{recommend.desc}</p>
        </div>
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
export default RecommendDetailFC;

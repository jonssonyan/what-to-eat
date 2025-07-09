create table account
(
    id              integer      default nextval('account_id_seq'::regclass) not null
        primary key,
    role            text         default ''::text                            not null,
    deleted         integer      default 0                                   not null,
    create_time     timestamp(3) default CURRENT_TIMESTAMP                   not null,
    update_time     timestamp(3) default CURRENT_TIMESTAMP                   not null,
    avatar_url      text         default ''::text                            not null,
    email           text         default ''::text                            not null,
    nickname        text         default ''::text                            not null,
    signin_openid   text         default ''::text                            not null,
    signin_provider text         default ''::text                            not null,
    signin_type     text         default ''::text                            not null
);

alter table account
    owner to postgres;

create unique index account_id_key
    on account (id);

create unique index account_signin_type_signin_provider_signin_openid_key
    on account (signin_type, signin_provider, signin_openid);

create table collection
(
    id           serial
        primary key,
    account_id   integer      default 0                 not null,
    recommend_id integer      default 0                 not null,
    create_time  timestamp(3) default CURRENT_TIMESTAMP not null,
    update_time  timestamp(3) default CURRENT_TIMESTAMP not null
);

alter table collection
    owner to postgres;

grant select, update, usage on sequence collection_id_seq to anon;

grant select, update, usage on sequence collection_id_seq to authenticated;

grant select, update, usage on sequence collection_id_seq to service_role;

create unique index collection_id_key
    on collection (id);

grant delete, insert, references, select, trigger, truncate, update on collection to anon;

grant delete, insert, references, select, trigger, truncate, update on collection to authenticated;

grant delete, insert, references, select, trigger, truncate, update on collection to service_role;

create table recommend
(
    id                serial
        primary key,
    account_id        integer      default 0                 not null,
    diet_type         text         default ''::text          not null,
    flavor_preference text         default ''::text          not null,
    difficulty        text         default ''::text          not null,
    cooking_time      text         default ''::text          not null,
    name              text         default ''::text          not null,
    "desc"            text         default ''::text          not null,
    ingredient        text         default ''::text          not null,
    step              text         default ''::text          not null,
    tip               text         default ''::text          not null,
    image             text         default ''::text          not null,
    size              text         default '1'::text         not null,
    ip                text         default ''::text          not null,
    create_time       timestamp(3) default CURRENT_TIMESTAMP not null,
    update_time       timestamp(3) default CURRENT_TIMESTAMP not null
);

alter table recommend
    owner to postgres;

grant select, update, usage on sequence recommend_id_seq to anon;

grant select, update, usage on sequence recommend_id_seq to authenticated;

grant select, update, usage on sequence recommend_id_seq to service_role;

create unique index recommend_id_key
    on recommend (id);

grant delete, insert, references, select, trigger, truncate, update on recommend to anon;

grant delete, insert, references, select, trigger, truncate, update on recommend to authenticated;

grant delete, insert, references, select, trigger, truncate, update on recommend to service_role;

INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (1, 0, '素菜', e'酸
甜', '轻松上手', '30', '话梅煮毛豆', '酸甜可口、营养价值高的一种简易美食', e'毛豆 300g
话梅 6 颗
食用盐 2g', e'清水加入食用盐，毛豆浸泡 15 分钟
加入开水，倒入毛豆、话梅，水煮 20 - 30 分钟
起锅开吃', '', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (2, 0, '酱料', e'甜
酸', '小试牛刀', '5', '糖醋汁的做法', '介绍了糖醋汁的制作方法，包括所需原料、计算用量、操作步骤等，可用于糖醋鱼、糖醋里脊、糖醋排骨等菜品制作。', e'清水50ml
生抽40ml
白糖30g
白醋20ml
料酒10ml', e'按照比例将各调料在小碗中搅拌均匀。
按不同菜肴的方式处理完毕后，将配制好的糖醋汁倒入锅中。
根据各菜肴的不同，烹制5 - 10分钟。
大火收汁，可增加菜的浓度、香味和光泽。', '', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (3, 0, '素菜', '', '小试牛刀', '3', '莴笋叶煎饼', '莴笋叶煎饼营养、好吃', e'莴笋叶50g
鸡蛋2个
食用油30ml
生抽5ml
淀粉15g
鸡精2g', e'莴笋叶剁碎，加入鸡蛋、生粉、生抽、鸡精搅拌均匀备用
起锅烧油，倒入莴笋叶浆汁，均匀平铺在锅面上
第一面炸120S后，翻面再炸60S后出锅', e'选择莴笋叶是某省市买到的蔬菜包基本都包含莴笋，可以换成韭菜等
莴笋叶直接焯水后凉拌有苦味，所以选择做成煎饼的配菜', e'./1.jpeg
./2.jpeg
./3.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (4, 0, '汤与粥', '鲜', '大展身手', '2', '生汆丸子汤', '生汆丸子汤，吃的就是一个鲜、嫩、弹。', e'前腿肉
盐
胡椒粉
葱姜花椒水
一个鸡蛋的鸡蛋清
土豆淀粉
熟豆油
木耳
黄花
小香葱
泡好的粉丝
鸡粉
香油
香菜
辣椒油（可选）', e'1. 肉改刀切开，肥瘦三七分，上刀剁一剁，用刀背砸一砸，把肉筋打开打松疏，剁成肉末。
2. 每斤肉加入6克盐，1克胡椒粉，上手抓匀。
3. 葱姜花椒水分次加，边加边搅，用手揉匀，让肉吸饱水，每斤肉末加入80克葱姜花椒水。
4. 放入鸡蛋清，继续顺着一个方向搅。
5. 加入40克土豆淀粉，搅匀。
6. 加入熟豆油。
7. 起锅烧水，烧开，改小火，似开非开的样子。
8. 上手挤丸子，全部漂起来，用小火煮1分钟。
9. 粉丝放碗底，加木耳，黄花，小香葱并用盐、胡椒粉、鸡粉打底调味。
10. 连汤带丸子冲如碗中，淋3 - 5滴香油，加一小颗香菜。
11. 辣椒油可根据口味添加。', '剁肉时尽量自己剁，机器打的太黏糊。葱姜花椒水要分次加入，让肉充分吸收水分。挤丸子时注意手法。可根据个人口味添加辣椒油。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (5, 0, '素菜', '鲜', '轻松上手', '3', '炒滑蛋', '炒滑蛋是一道简单易做的菜，一般初学者5分钟即可完成。', e'鸡蛋4颗
牛奶30ml
食用油10ml', e'鸡蛋加入牛奶以及5ml食用油搅拌均匀，备用。
大火烧热平底锅约30s，加入5ml食用油。
烧30s转小火，并且放入搅拌好的鸡蛋。
在锅中静置5秒后，用锅铲将蛋液从边缘缓慢推向中间。
翻炒至鸡蛋大致凝固后关火，装盘。', '最后可根据个人口味撒些黑胡椒或者盐来调味。', './炒滑蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (6, 0, '素菜', '鲜', '小试牛刀', '3', '洋葱炒鸡蛋', '洋葱炒鸡蛋是中国日常生活中熟知的菜品', e'鸡蛋2个
洋葱50g
食用油50ml
盐2g
葱半根
料酒2ml', e'鸡蛋打入大碗中，加入洋葱片、盐后搅拌60S
起锅烧油，倒入鸡蛋，一面煎炸30 - 45S，翻面继续翻炒，反复2 - 3分钟后散上料酒出锅
鸡蛋装盘，散上葱花', '如果遵循本指南制作流程发现问题或可改进流程，请提出Issue或Pull request。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (7, 0, '酱料', '甜', '小试牛刀', '30', '草莓酱', '用便宜的小草莓制作而成的草莓酱，抹在面包上非常好吃', e'草莓1200克
白糖400克（可根据低糖需求调整为200克）', e'草莓洗净去叶。
将草莓切碎放入合适的碗中。
将白糖倒入碗中与草莓搅拌均匀。
碗用保鲜膜覆盖静置1小时。
将静置的草莓和糖的混合物倒入不粘锅中开大火烧开。
烧开后转小火不断搅拌直至果酱呈粘稠状关火。
待草莓酱冷却后装入准备好的密封罐中。', e'可根据个人对甜度的喜好调整白糖用量，如需低糖饮食可适当减少白糖量。
搅拌过程中要小火并不断搅拌，防止粘锅。
装罐时确保罐子干燥、密封良好，利于保存。', e'./洗好的草莓.jpeg
./混合好的草莓.jpeg
./熬煮的草莓.jpeg
./做好的草莓酱.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (8, 0, '酱料', '鲜香', '得心应手', '25', '葱油的做法', '葱油是用热油萃取以葱为主的各类香辛料得到的产物，可用于调制肉馅、做凉拌菜、在热炒菜中作为出锅明油使用。', e'油200g
葱80g
姜20g
料酒10ml
洋葱150g
开洋50g
香菜（可选）', e'开洋泡入50度温水中，加入10ml料酒去腥，泡10分钟后取出沥干水分。
葱、香菜洗净，切成5cm长的段，擦干表面水份。
洋葱切成丝，在锅里用热水煮5分钟，取出沥干水份。
姜去皮，切成片。
锅里倒入全部油，放入上述预处理好的材料，开中小火炸20分钟。', e'渣后的开洋葱渣也可以食用，葱油可以滤掉这些料渣，也可以保留。
开洋可以极大提升葱油鲜香，并增加鲜甜风味。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (9, 0, '酱料', '鲜香', '小试牛刀', '1', '蒜香酱油', '这是一种简单易做的特色酱料，蒜香与酱油香完美融合。', e'蒜头2瓣
白芝麻5克
花生油15毫升
酱油30毫升
蘸料碟1个', e'拍碎蒜头
往蘸料碟中加入酱油
起锅，加入花生油，等到油温滚烫后加入拍好的蒜头，炸半分钟
半分钟后，关火，把热油倒入蘸料碟，用筷子搅拌即可', '', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (10, 0, '酱料', '甜', '轻松上手', '0', '蔗糖糖浆', '蔗糖糖浆用于在配制饮料（特别是冷饮）时给饮料增甜，将糖事先溶解好便于使用。', e'白砂糖100克
水100克', e'将称好的白砂糖与饮用水于容器混匀。
容器封盖放冰箱冷藏。', e'水无论冷热都可，如果比较急用，可用热水溶解后再冷却糖浆。
配制好的糖浆不会轻易变质，在冷藏状态下保存一周通常是没问题的。', './bottle.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (11, 0, '饮料', '甜', '轻松上手', '1', '奇异果菠菜特调', '这是一款仿照宜家奇异果菠菜汁研制的饮品，将奇异果、苹果和菠菜叶搭配制作而成。', e'奇异果2个
苹果1/2个
菠菜叶4叶
水700ml
白砂糖12克', e'将猕猴桃切成两半，每半再分四份小块
将苹果切丁
将菠菜叶去梗，只留叶子部分
将菠菜切碎
一起倒入榨汁机搅拌杯
注水
加入白砂糖
启动搅拌机，搅拌约4个15秒（每15秒停下看状态）', '白砂糖的量可根据个人情况在0-12g中调整', './kiwi-example.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (12, 0, '素菜', e'甜
酸', '轻松上手', '10', '糖拌西红柿', '新鲜可口，制作简便，营养价值高，适合夏季食用，家庭餐桌上的一道美味凉菜。西红柿含有大量的维生素C', e'西红柿2个
白砂糖20g', e'用刀将西红柿皮米字型划开
用筷子插入西红柿的菊花，在燃气上转动烤10秒（或用开水冲30秒），直到西红柿皮卷边
把西红柿去皮
将西红柿沿纹路切成大块，去掉头部根蒂部，备用
全部切好后，将西红柿在盘子中均匀码一层
撒上白糖，重复上面一步直到全部西红柿放完
放入冰箱冷藏10分钟', e'制作过程中小心使用刀具
如果遵循本指南制作流程发现有问题或可改进的流程，请提出Issue或Pull request', './火山飘雪.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (13, 0, '素菜', '鲜', '小试牛刀', '1', '水油焖蔬菜', '水油焖蔬菜通过添加油提升口感，增加脂溶性维生素摄入，相比生吃蔬菜好处更多。', e'叶菜类蔬菜300g - 500g
食用油2ml
盐3g
蚝油3ml（可选）', e'洗净蔬菜
锅中加入150ml水烧开（水不需要完全没过蔬菜）
加入3g盐
（可选）加入3ml蚝油
加入2ml食用油
下菜，翻拌一下，然后盖上锅盖焖1分钟
盛盘', e'不确定咸淡时先少放盐，出锅前尝味调整
可用鸡汤、骨头汤等替代水，味道更好
焖的时间不可过长', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (14, 0, '素菜', e'酸
辣', '轻松上手', '3', '酸辣土豆丝', '酸辣土豆丝是一道简单易做的菜，色泽光亮，酸辣可口，辅料辣椒富含维生素C，用料简单，好学易做。', e'土豆240g
大蒜4瓣
青椒0.5个
红椒0.5个
干辣椒3个
葱1根
生抽5ml
陈醋10ml
盐2g
食用油10 - 15ml', e'土豆去皮、切丝（或用刨丝器）。
切好的土豆丝用清水清洗，去除多余的淀粉，然后对土豆丝焯水10秒。沥干，备用。
葱蒜干辣椒切小块，青红椒切丝。
热锅，小火热油爆香蒜和干辣椒。
加入青红椒翻炒几下，加入土豆丝翻炒至变色。
加5ml生抽，10ml陈醋，蒜末，最后加入盐翻炒均匀即可。', e'清洗土豆丝淀粉一定要去干净，不然会全黏在一起
加入蒜末、盐后应尽快出锅，保留蒜香以及避免破坏口感。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (15, 0, '饮料', '甜', '小试牛刀', '10', '海边落日', '一款精心调配的特色饮品', e'红石榴糖浆15ml
NFC橙汁35 - 50ml
苏打水50ml
白朗姆30ml
蓝橙力娇酒15ml
柠檬汁15ml
冰块适量
柠檬1片', '柠檬洗净切出一片；选择一个350 - 400毫升的透明玻璃杯，放入大冰块，用搅拌棒搅拌冰杯；加入红石榴糖浆；让橙汁沿搅拌棒导入酒杯至一半，轻轻搅拌半圈；倒入苏打水；在调酒杯中加入白朗姆、蓝橙力娇酒、柠檬汁和冰块，shake；轻轻倒入酒杯中，插上柠檬片和习惯', '', './海边落日.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (16, 0, '水产', '鲜', '小试牛刀', '10', '清蒸鲈鱼', '清蒸鲈鱼是一道制作相对简单且味道鲜美的菜肴，关键在于把握好火候，能展现出鲈鱼本身的鲜嫩口感。', e'鲈鱼一条
香葱三根
姜一块
食用油10 - 15ml
蒸鱼豉油10 - 15ml
料酒10 - 15ml
食用盐5 - 10g', e'姜切片切丝、香葱的葱白切段，葱绿切丝，切丝后放入冷水浸泡备用。
鲈鱼处理好后洗净，用厨房纸擦干，两面分别划几刀，用盐洗掉鱼身的粘液，并用10g盐抹遍鱼身的内外，腌制10分钟以上。
鱼肚内塞上姜和葱白，鱼身也撒上姜和葱白，量为备用的一半。蒸鱼的碟子用筷子将鱼跟碟子隔开蒸。
水烧热感觉到水温后放进入鱼。
大火清蒸10分钟。
蒸好的鱼，用干净的盘子装起来并去除身上姜蒜。
鱼身浇上15ml蒸鱼豉油。
鱼身重新撒上姜和葱丝，锅内加上10ml食用油并烧热，将食用油淋至鱼身即可出菜。', e'注意鱼的大小与火候的关系，大火蒸鱼一般10分钟内较佳，避免鱼肉太老或没熟。
蒸鱼时用筷子隔开装鱼的盘子，防止鱼接触盘中的水导致腥味，同时能使鱼均匀受热。', e'./改刀.jpg
./摆盘.jpg
./清蒸鲈鱼.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (17, 0, '素菜', '鲜', '轻松上手', '1', '菠菜炒鸡蛋', '这道菜难度系数简单，营养丰富', e'菠菜350g
鸡蛋2个
食用油15ml
食用盐5g', e'菠菜去根，洗净，放在篮子里，焯水
将鸡蛋打入碗中，搅匀
热锅，加入10ml油
油热后，倒入鸡蛋液，中火翻炒15秒，先煎成蛋饼，然后再用锅铲切成小块
关火，将鸡蛋块盛到盘子中，不要洗锅
重新开火，倒入5ml油，油热后，放入菠菜，大火翻炒15秒后，倒入鸡蛋块，翻炒均匀
加入5g盐、100ml饮用水，大火翻炒10秒
关火，盛盘', '如果您遵循本指南的制作流程而发现有问题或可以改进的流程，请提出Issue或Pull request 。', './菠菜炒鸡蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (18, 0, '水产', '鲜香', '小试牛刀', '30', '黄油煎虾', '黄油煎虾是一道制作相对简单、风味极佳的菜式，主要耗时在于处理活虾，总耗时在一个小时内，适合初学者进行烹饪。', e'鲜虾300g
黄油7g
黑胡椒粒15ml
食用油45ml
生抽10ml
米酒5ml
白糖10ml
盐2.5ml', e'鲜虾摘除头部，顺带扯出虾线（这步处理不好可在下一步开背时取出虾线），使用剪刀剪开或菜刀片开虾背，沥干水分备用。
调制酱汁：小碗放入上述量的全部生抽、米酒、白糖、盐搅匀备用。
中大火热锅，热锅内放入食用油，等待10秒让油温升高。
虾全部放入锅中，开始瓶磨黑胡椒，均匀地撒在虾上翻炒。
虾变色后加入黄油，黄油完全融化后倒入调制酱汁，继续翻炒。
大火翻炒15秒收汁即可装盘。', e'虾开背才更好入味，不过处理时切记切记小心用刀，新手容易伤到手。
可参考[冯小厨的菜谱](https://www.bilibili.com/video/BV1g541177cd)。', './黄油煎虾.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (19, 0, '素菜', e'咸
鲜', '轻松上手', '5', '凉拌油麦菜', '凉拌油麦菜是一道简单易做的清爽素菜', e'油麦菜1颗（约200g）
芝麻酱10ml*份数
酱油5ml*份数
醋15ml*份数
蚝油10ml*份数
白糖5g*份数
香油5ml*份数
蒜2头*份数', e'蒜拍碎切末。
将醋，酱油，芝麻酱，香油，糖，蚝油，蒜末放到碗里搅拌均匀。
油麦菜切段，每段不超过4cm。
把油麦菜放到一个大点的盆里，倒入上述碗中酱料，充分搅拌均匀。', e'芝麻酱可以用花生酱代替。
芝麻酱一定要和油麦菜混合均匀才更好吃。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (20, 0, '水产', '鲜', '大展身手', '36', '葱油桂鱼', '这是一道制作精美的水产菜肴，通过独特的处理和烹饪方法，保留了桂鱼的鲜嫩和鲜味，同时融入葱油的香气，味道十分鲜美。', e'桂鱼1斤(500g)
小葱1根（长度为30cm）
小米辣2个
姜50g
料酒25g
植物油15g
盐8g
蒸鱼豉油10g
清水5L', e'去菜市场买已处理好的鱼，刮净鱼身表面鳞片。
用厨房纸擦净鱼肚子里的贴骨血和黑膜。
用菜刀刮掉鱼身黏液，清水冲洗鱼内外。
将鱼平放在砧板，擦干水分，从鱼鳃边开始每隔3cm纵向划一刀，另一面同样处理。
鱼平放在盆中，确保无多余水分。
姜去皮洗净，切成3mm厚姜片。
小米辣洗净去蒂，切成2mm厚小圆片或1mm宽丝状。
小葱洗净去根须，切成3cm小段，粗一点的可劈开。
在盆中加入8g盐、25g料酒，戴一次性手套对鱼全身按摩1分钟。
在鱼身刀口中塞入姜片，鱼肚中放3片姜片，腌制10分钟。
蒸锅中加5L清水烧开，放上蒸笼。
鱼腌制好后，倒掉多余水分、料酒和姜片，冲洗鱼身和鱼肚，擦干。
将鱼平放在蒸鱼盘，在鱼身、鱼肚刀口处重新塞入姜片，放入蒸笼，中火蒸20分钟。
出锅后不要倒掉鱼汤。
用防烫夹夹出蒸鱼盘，淋上10g蒸鱼豉油。
在鱼身和周围均匀撒上小葱段和小米辣。
铁锅中倒入15g植物油，中小火慢熬5分钟。
将热油均匀慢慢淋在鱼身上。', e'处理鱼时要尽量去除腥味来源，如贴骨血和黑膜。
腌制时间不宜过长，以免降低鱼的鲜度。
蒸鱼的汤汁是鲜味精华，不要倒掉。
熬油用中小火，避免油挥发过快。
可根据个人口味调整葱姜蒜和蒸鱼豉油的用量。
用鲈鱼、多宝鱼等海鱼代替桂鱼时，处理方式类似，但淡水鱼因寄生虫较多不建议使用。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (21, 0, '水产', '鲜', '小试牛刀', '3', '蒜蓉虾', '蒜蓉虾是广东省地方传统名菜，色香味俱全。', e'海虾8只
蒜蓉酱50g
食用油20ml
生抽5ml', e'用刀从从虾头中间切开，切到距离虾尾1cm
将蒜蓉酱铺在虾身中间，放在盘子中
锅中倒入热水，将盘子放入锅中，大火蒸3分钟
烧热油，倒入虾盘中，倒入生抽', '', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (22, 0, '素菜', e'鲜
酸', '轻松上手', '3', '凉拌莴笋', '凉拌莴笋是一道开胃小菜', e'莴笋1根
萝卜0.25根
小米辣2个
姜1片
蒜头2粒
盐5g
食用油25ml', e'莴笋削皮，切小条。萝卜切条，一起放入大碗，加入盐搅拌，放置10分钟
放置后的莴笋用水清洗1-2遍
起锅烧水，放入莴笋，水煮1分钟捞出，沥干水分，放入大碗
起锅烧油，放入姜片、蒜粒、小米椒煸炒30-45S，倒入莴笋中
搅拌充分，端盘', e'萝卜非必须，只是为了增加菜色
端盘后，可以根据个人口味，额外增加生抽、白砂糖、香醋、芝麻等佐料
莴笋条的大小看个人口感决定，但莴笋皮要尽量多削点，不然真的影响口感
冰镇效果更加', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (23, 0, '素菜', '甜', '轻松上手', '4', '炒青菜', '炒青菜制作简单方便，预计10分钟即可完成。加入白糖会让青菜颜色更绿。', e'青菜（100g*份数）
食用油（10 - 15ml）
食盐（2g*份数）
饮用水（70ml*份数）
白糖（5g*份数）', e'青菜掰成小瓣，用清水洗净，备用。
中火或大火热锅后，锅内放入10 - 15ml食用油，等待30秒让油温升高。
将准备好的青菜倒入锅中，翻炒至青菜变软（约1分钟）。
倒入计算好的清水，水位应当完全浸润或即将没过青菜，加入食盐 （2g*份数），继续翻炒约1分钟。
最后加入白糖小火加热2分钟，加热时盖上锅盖。
盛盘。', e'加入白糖，会让青菜颜色更绿。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '份数', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (24, 0, '素菜', '鲜', '轻松上手', '8', '金针菇日本豆腐煲', '金针菇日本豆腐煲是一道容易上手的日常料理。', e'金针菇1 - 2把
日本豆腐2袋
小米椒3 - 5根
蒜2 - 3瓣
生抽15ml
蚝油5ml
老抽3ml
糖3g
食用油10 - 15ml', e'豆腐切片，小火煎到两面金黄出锅备用。
切蒜成蒜末；将生抽，蚝油，老抽，糖，100ml水调汁备用。
热锅放油，油热放小米椒、蒜末爆香，先放金针菇，炒软，把煎好的豆腐平铺在金针菇上，倒入配好的料汁，焖5分钟，大火收汁。', e'金针菇一定要先炒软
豆腐尽量不要翻炒，容易碎', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (25, 0, '水产', '辛辣', '得心应手', '20', '鲤鱼炖白菜', '这道菜是用鲤鱼和白菜一起炖煮而成，味道鲜美。鲤鱼清洗干净改刀方便入味，通过煎制后加入调料和白菜炖煮，还可根据个人喜好添加粉条。', e'食用油10ml
姜3片
蒜3瓣
鲤鱼1.2斤
白菜心/娃娃菜13片
盐5 - 8克
老抽3ml
生抽6ml
桂皮1块
八角3个
郫县豆瓣酱20克
干辣椒4 - 6个
粉条适量（可选择添加）', e'鲤鱼清洗干净，改刀（在鱼身上多划几个伤口，方便入味）
娃娃菜清洗干净放入盘中备用
锅中加油，等油热放入“少盐” “姜” “蒜” “郫县豆瓣酱” “桂皮” “八角” 炒出香味
把鱼放锅里煎（3分钟）每30秒需要翻面
加入“水”（水量尽量和鱼平齐，可以少一点点） 放入 “生抽” “老抽” “娃娃菜”
大火炖15 - 20分钟，汤汁快干时添加 “盐” 即可出锅
若添加粉条，先将粉条用凉水或热水泡软，和娃娃菜一起放入锅中。', e'调料根据鱼的大小进行换算
煎鱼时要注意翻面，防止煎糊
水量尽量和鱼平齐，可稍少一点
粉条可根据个人喜好选择是否添加以及添加量', './鲤鱼炖白菜.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (26, 0, '素菜', '鲜', '轻松上手', '7', '西葫芦炒鸡蛋', '西葫芦炒鸡蛋是一道简单易做的家常菜。简单易购的食材，好吃又下饭。', e'西葫芦500g
鸡蛋3个
西红柿100g
食用油10 - 20ml
食用盐6g', e'西红柿洗净，切成小块，备用
西葫芦洗净，切成边长约为4cm的菱形，备用
打三个鸡蛋到碗里，打散搅匀，备用
热锅，锅内放入5ml - 10ml食用油
倒入鸡蛋，保持翻炒至鸡蛋成固体，用锅铲分成小块后盛到碗里，备用
锅内放入5ml - 10ml食用油，倒入西红柿，炒至变软
倒入西葫芦一起翻炒均匀，放入6g食用盐，将火调小然后等待4 - 5分钟
倒入备用的鸡蛋，中火翻炒15秒
关火，盛盘', '', './西葫芦炒鸡蛋.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (27, 0, '水产', e'咸
鲜
辛辣', '大展身手', '10', '红烧鱼', '这是一道通用的红烧鱼做法，详细介绍了必备原料、可添加材料、用量计算及具体操作步骤，还提醒了新手注意事项。', e'一条中等大小的鲫鱼
姜2 - 3片
蒜瓣3 - 4个
干辣椒2 - 3个
油30 - 50ml
盐10g
料酒
醋5ml
酱油5ml
白砂糖10g
葱1 - 2根
小米椒1 - 2个
蚝油5g
味精5g
香菜', e'姜蒜切碎，干辣椒切碎，将它们放在一起备用。
加入30 - 50ml油，等待锅热。
放入擦干水分的鱼，晃动锅，用小火煎鱼，然后翻面重复油煎过程。
放入姜蒜辣椒，翻炒出香味。
倒入料酒，注意安全，会起大量油烟。
倒入醋（可根据个人喜好多放）。
放入白砂糖和酱油（老抽）。
加入冷水，以刚好淹没鱼身为宜，调成中火，盖上锅盖，1分钟后将鱼翻身，继续盖上锅盖。
3 - 4分钟后，加入盐、小米椒、蚝油（味精、鸡精等），继续盖上锅盖，后续继续翻身。
当锅内汤汁收汁到鱼的脊背线上的鱼鳍下面一点点的时候（或者汤汁不多的时候），转小火，加入香菜，葱花，然后盖上锅盖20秒，关火，起锅。', e'使用锋利菜刀剁肉有风险，需小心操作。
煎鱼时鱼要擦干水分，防止热油溅出。
倒入料酒会起大量油烟，注意安全。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (28, 0, '素菜', '鲜', '小试牛刀', '3', '西红柿豆腐汤羹', '西红柿豆腐汤羹是一道很清淡美味的汤羹', e'西红柿1个
鸡蛋1个
豆腐100g
食用油5ml
盐2g
淀粉5g
鸡精2g
香葱0.5根
姜1片
开水350ml', e'西红柿切成小丁、鸡蛋打入碗中搅拌、豆腐切块备用
起锅烧油，放入姜片5S后倒入入西红柿翻炒30S
锅中加入开水，汤水烧开，60S后到入鸡蛋液、豆腐块
汤水重新烧开后，加入水淀粉，沿一个方向搅拌2圈
加入鸡精、盐、香葱，30S后起锅', '如果您遵循本指南的制作流程而发现有问题或可以改进的流程，请提出Issue或Pull request 。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (29, 0, '饮料', '酸', '轻松上手', '5', '酸梅汤（半成品加工）', '介绍了酸梅汤（半成品加工）的做法，包括必备原料、计算用量、操作步骤以及附加内容等', e'酸梅晶固体饮料120克
饮用水1177克
方糖9克（可选）
北京二锅头酒48克（可选）', e'取饮用水1177克。
放入酸梅晶固体饮料60克，使用汤匙顺时针搅拌50圈。
再放入剩下60克酸梅晶固体饮料，再次使用汤匙顺时针搅拌50圈。
放入9克的方糖，使用汤匙顺时针搅拌100圈。
放入北京二锅头酒48克，用汤匙顺时针搅拌30圈。', e'如果没有准备方糖或北京二锅头，可以省略操作中的第4步或第5步。
放入冰箱冷藏后再饮用效果更佳。
饮酒请勿驾车。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (30, 0, '素菜', '辛辣', '小试牛刀', '6', '小炒藕丁', '小炒藕丁是一道简单易做的菜，莲藕营养丰富，非常适合素食。', e'大葱1段
小米辣1-2根
莲藕1段
生抽30ml
老抽15ml
耗油15ml
食用油10-15ml', e'大葱、小米辣切小段，备用
莲藕去皮，切成不超过3cm的小块，放入水中备用（防止氧化发黑）
取炒锅，锅内放入500ml凉水，煮沸
将藕丁下入沸水中，焯水2分钟后，取出放入盘中备用
将锅中水倒掉后，将锅加热干燥，加入10-15ml食用油
待油温升高后，下入葱花，小米辣爆香
将处理好的藕丁下入锅中，大火翻炒
加入生抽、老抽、耗油
翻炒2分钟即可出锅', e'食用莲藕要挑选外皮呈黄褐色、肉肥厚而白的。如果发黑，有异味，则不宜食用。
请尽量不要使用铁器，会导致莲藕发黑', './小炒藕丁.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (31, 0, '素菜', '鲜香', '得心应手', '73', '包菜炒鸡蛋粉丝', '包菜炒鸡蛋粉丝是中国一道常见的家常菜', e'包菜半颗
鸡蛋2个
粉丝1把
胡萝卜半根
菜籽油20ml
盐2g
生抽15ml
老抽10ml
蚝油10ml
葱半根
蒜瓣2片
干辣椒5根', e'胡萝卜、包菜切丝备用
粉丝先用冷水浸泡1小时，然后将粉丝放入锅中，加入开水烧至粉丝烫软捞出备用
鸡蛋打入碗中，加入盐后搅拌15秒
葱、蒜、辣椒切成小粒备用
起锅烧油，倒入鸡蛋，打散炒熟盛出
再倒入油，放入葱、蒜、干辣椒翻炒8秒
下胡萝卜、包菜丝儿翻炒30秒
放入粉丝
放调料，生抽15ml，老抽10ml，蚝油10ml，盐2克
放入之前炒好的鸡蛋，翻炒约15秒
出锅摆盘', e'制作过程中注意控制火候和翻炒时间，避免食材炒糊
粉丝浸泡时间不宜过长，以免失去韧性', './1.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (32, 0, '水产', e'甜
酸', '大展身手', '10', '糖醋鲤鱼', '糖醋鲤鱼是一道色香味俱全的传统名菜，以鲤鱼为主料，经过炸制后，淋上由番茄酱、白糖、白醋等调制而成的糖醋汁，色泽红亮油润，外焦里嫩，酸甜可口。', e'鲤鱼约3斤
番茄酱40g
白糖20g
白醋10g
淀粉10g
盐30g
葱30g
姜30g
料酒25g
面粉100g
淀粉200g
水180g
鸡蛋1个
香菜1颗', e'将鱼清洗干净，确保无鱼鳞等异物。
将鱼头朝左，鱼肚朝下，右手持刀，刀竖直切下1cm，按紧鱼身往左片3 - 4cm，再将鱼片中间轻轻划一刀。
将鱼放进盆里，大姜切片，大葱切段，挤汁到盆中，加入20g盐，25g料酒，给鲤鱼搓匀腌制30分钟以上。
找个干净盆，加入100g面粉、200g淀粉、180g水、5g盐，搅拌均匀成粘稠可拉丝面糊，打入一个鸡蛋再次搅匀。
等待30分钟后，将鱼放在案板上，用干毛巾擦干。
起锅烧油，加入约1L油，烧至7成热（200 - 240度），捏起鱼尾巴，将鱼头沉入锅底，用勺子淋热油，待面糊成型后将鱼慢慢放入锅中，用锅铲轻轻铲起鱼头部，垫上笊篱，防止底部炸糊。
准备盛鱼盘子放在锅旁，用锅铲从鱼身处轻轻铲入，配合笊篱将鱼翻面，再炸两分钟后盛入盘中。
将锅中油倒入擦干盆中放置一边，刷净锅。
将50g清水、40g番茄酱、20g白糖、10g白醋放入小碗搅拌均匀，另准备小碗加入10g淀粉、10g水搅拌成水淀粉。
开大火将锅烧热，倒入料汁大火烧开，转小火，加入调好的水淀粉，边倒边搅拌，20秒后关火。
将熬好的糖醋汁用勺子均匀浇在鱼身上，加点香菜或葱花点缀。', e'鱼腌制时间越长，腥味越小，推荐腌30分钟以上。
炸鱼时要控制好油温，7成热约200 - 240度。
给鱼挂糊时要搅拌均匀，使面糊状态合适。
炸鱼过程中注意用工具配合翻面，防止炸糊。
熬糖醋汁时要边倒水淀粉边搅拌，注意火候和时间。', e'./腌制.jpg
./成品.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (33, 0, '饮料', '甜', '小试牛刀', '60', '冬瓜茶', '冬瓜茶是一种清爽的传统饮料', e'冬瓜 1000g
冰糖 300g', e'将冬瓜去皮，去籽，切成小块（每块不超过 4cm）。
冬瓜加入冰糖，搅拌均匀，盖上保鲜膜放冰箱冷藏 2 小时以上。
此时冬瓜出了很多水，倒入锅中大火煮开，然后转中小火慢慢熬制 1 - 2 个小时，中途多搅拌防止糊锅。
使用过滤网将煮好的冬瓜茶液过滤，取出冬瓜块，只保留茶液。
将冬瓜茶液放凉后，倒入干净的容器中，放入冰箱冷藏即可。
熬好的冬瓜茶液是浓缩汁，根据个人喜好添加水或其他饮品，冷热皆宜。', e'冰糖的用量可以调整，以达到个人喜好的甜度。
冷藏保存，建议 1 周内喝完。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (34, 0, '饮料', '甜', '轻松上手', '5', '砂糖椰子冰沙', '砂糖椰子冰沙是一种制作极其快速方便的饮料，若原料选择得当则口感丰富。然而制作时动静较大，适合白天在家制作以作为下午茶。', e'瓶装椰汁500ml
咖啡调糖10g
坚果碎（可选）', e'500ml瓶装椰汁倒掉200ml，立刻拧紧瓶盖。
将这瓶椰汁放入冰箱冷冻区并冷冻10小时以上。
将这瓶椰汁取出，若确认瓶中椰汁已彻底冻结，则在墙角、椅背、桌角等坚硬表面上用力抽打。（请务必确认表面不会因此受到损伤）
当抽打到冻结椰汁变成冰沙状态，打开瓶盖倒出冰沙。
在冰沙表面均匀撒上咖啡调糖或坚果碎。', '瓶装椰汁可以提前冰冻，但是不宜超过7天，否则有变质风险。', './砂糖椰子冰沙-1.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (35, 0, '荤菜', e'辛辣
鲜香', '得心应手', '10', '小米辣炒肉', '一道具有辛辣鲜香口味的菜品，不建议清淡饮食者尝试。', e'小米辣20个
花生油20ml
五花肉或瘦肉200g
盐1 - 2g
生抽10ml
蚝油10ml
大蒜和姜共50g
豆瓣酱10g
鸡精10g
白糖5g（可根据喜好调整调料用量，还可加老抽增添香味）', e'将小米辣洗净，斜刀切大一点。
肉切丝或切片，倒入生抽、蚝油、盐腌制5分钟。
热锅倒油，先把肉炒好盛起。
姜蒜爆香，倒入豆瓣酱翻炒，再倒入切好的小米辣，接着倒入瘦肉，翻炒一下，放入生抽、鸡精、盐、糖翻炒。', '调料可根据个人喜好添加，加入老抽会更香。', '', '', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (36, 0, '饮料', '醇厚', '小试牛刀', '20', '泰国手标红茶', '泰国手标红茶是泰国街头随处可见的奶茶，味道香纯，绵密。', e'水600cc
茶粉20g
白糖24g
牛奶18ml
炼乳24g', e'1. 600cc水大火烧开。
2. 在过滤袋中装入20g茶粉，开水倒入过滤袋中，过滤20遍。
3. 使用克称量取24g炼乳、24g白糖和18ml牛奶放入1000ml以上的水壶中。
4. 将过滤好的茶水倒入水壶中搅拌，直到白糖融化。
5. 将水壶放到冰箱4小时以上。
6. 喝前可以加6 - 8颗冰块。', e'制作过程中需注意各原料的用量准确，过滤茶水时尽量保证充分过滤。
过滤袋使用后要及时清洗，避免茶渍残留影响下次使用。
将水壶放入冰箱冷藏时，注意不要让其他物品挤压到水壶，防止损坏。', './泰国手标红茶.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (37, 0, '饮料', '鲜', '得心应手', '1', 'Mojito莫吉托', 'Mojito是一种传统的古巴高球鸡尾酒，酒精含量相对较低。', e'一块青柠（切成两个半块）
五珠薄荷叶
糖浆20ml
金色朗姆酒45ml
蓝天原味伏特加10ml
打碎的冰块
冰镇苏打水', e'将切成半块的青柠之一切成小块，放入海波杯，随后用研杵将其捣出汁；
用3 - 4珠薄荷叶沿着杯口涂抹，随后将其放入杯中；
加入糖浆20ml；
加入金色朗姆酒45ml；
将剩下的半块青柠压出汁水放入杯中；
轻轻搅拌，使砂糖/糖浆处于半融合状态；
将打碎的冰块放入杯中，直到占杯中3/4；
加入冰镇苏打水直到刚好淹没碎冰；
旋转搅拌半分钟；
使用碎冰将海波杯补满；
将剩下的一株薄荷叶拍醒，插入碎冰，作装饰。', '无', '无', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (38, 0, '饮料', e'酸
甜', '轻松上手', '10', '菠萝咖啡特调', '菠萝咖啡特调是非常适合家庭出品的饮料，酸甜可口。', e'咖啡液 30ml
菠萝汁 60ml
冰块 50g
苏打水 30ml
奶油 30ml
牛奶 10ml
糖 8g
海盐 0.5g
朗姆酒 5ml', e'杯子里依次加入冰块，咖啡液，菠萝汁和苏打水。
奶油加糖打发至湿性发泡，加入朗姆酒和牛奶均匀只有流动性。
在第一部混合液上方倒入奶油。
奶油顶面撒上海盐。', e'咖啡液建议选用花果风味，浓缩可以用中烘豆，冷萃可以用普通水洗或者日晒。
倒入奶油时，高度尽量放低，让奶油能均匀漂浮在饮料表面形成奶盖。
用新鲜的咖啡液和菠萝汁能大大提升整体风味口感。', './菠萝咖啡特调.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (39, 0, '素菜', '鲜', '得心应手', '5', '茭白炒肉', '茭白味道鲜美，有一定营养价值，与瘦肉搭配炒制，色香味俱全。', e'茭白2根
瘦肉100g
淀粉15g
食用油30ml
鸡精5g
姜1片
蒜1个
料酒5ml
盐2g', e'茭白切片，每片厚度0.5cm。
瘦肉切条，厚度0.3 - 0.5cm，加入料酒、生粉、盐、水搅拌。
姜切片、蒜头剁碎。
起锅水烧开，放入茭白，水煮60 - 90S后取出沥干。
起锅，倒入15ml油，倒入瘦肉，反复翻炒60S取出。
起锅，倒入15ml油，倒入姜、蒜翻炒30S，加入茭白继续翻炒30S。
继续加入瘦肉翻炒60S，加入20ml水，加入盐、鸡精后翻炒60S出锅。', e'最后一个步骤，可以考虑加蚝油、生抽代替盐上色。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (40, 0, '饮料', '醇厚', '小试牛刀', '3', 'B52轰炸机', 'B-52是鸡尾酒中喝法比较独特的一种，要配上短吸管，餐巾纸和打火机。把酒点燃，用吸管一口气喝完，能体验到先冷后热冰火两重天的感觉。用吸管适用于女士，最刺激的喝法是一口喝下，喝的时候注意尽量避免碰到杯口引起烫伤，让火在嘴里灭掉，才能喝出最好的味道。', e'甘露咖啡酒10ml
爱尔兰百利甜酒10ml
蓝天原味伏特加10ml
吧勺
利口酒杯
打火机', e'在利口酒杯的最底层倒入甘露咖啡酒到1/3处(10ml)。
顺着吧勺缓缓倒入爱尔兰百利甜酒，也是1/3处(10ml)。注意要慢，保证层次分明。（太快甜酒会和咖啡混合）
最后在上层倒入蓝天原味伏特加（10ml)。
用打火机热一下杯口。
最后一步点火。', '喝的时候注意尽量避免碰到杯口引起烫伤，让火在嘴里灭掉，才能喝出最好的味道。由于吸管太细，其中氧气不足，所以火苗会灭掉，不必担心。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (41, 0, '饮料', '鲜', '轻松上手', '10', '金汤力', '金汤力是一款经典的鸡尾酒，制作简单且口感清爽。', e'金酒30 - 40毫升
汤力水气泡水1罐
柠檬1个
冰块100克
新鲜绿叶（可选，装饰用）', e'柠檬处理：将柠檬对半切（刀方向垂直于柠檬的头尾连线），并从其中的一半中切取一片柠檬备用；再次将柠檬对半切，将得到的4角柠檬用压汁器压出柠檬汁置于容器中备用。
正式调配：选择一个容量在350 - 400毫升的透明玻璃杯，将100克冰块放置在杯底；倒入30 - 40毫升金酒；倒入15毫升柠檬汁（如果喜酸可以加多点或全加）；用勺子搅拌均匀；将之前准备的一片柠檬放置好；缓慢沿杯壁注入汤力水直至满杯（不要倒在冰上，避免起泡流失）；用勺子轻轻上下提拉将液体搅拌均匀（不要旋转搅拌，避免起泡流失）；在液面放置好装饰用的绿叶（可选）。', e'选择合适容量的透明玻璃杯，便于观察饮品。
注入汤力水时要缓慢沿杯壁注入，避免倒在冰上导致起泡流失。搅拌时用勺子轻轻上下提拉，不要旋转搅拌。
柠檬汁的用量可根据个人喜酸程度调整。', './gin-tonic.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (42, 0, '饮料', e'甜
酸', '轻松上手', '10', '金菲士', '金菲士是一款经典的鸡尾酒，口感清爽，酸甜适中，适合在夏日饮用。', e'金酒 30 - 40 毫升
苏打气泡水 1 罐
柠檬 1 个
蔗糖糖浆 30 - 40 克
冰块 100 克
新鲜绿叶（可选）', e'柠檬处理：将柠檬对半切（刀方向垂直于柠檬的头尾连线），切取一片柠檬备用，再次将柠檬对半切，用压汁器压出柠檬汁置于容器中备用。
无雪克瓶调配：选择一个 350 - 400 毫升的透明玻璃杯，杯底放 100 克冰块，倒入 30 - 40 毫升金酒，20 毫升柠檬汁（喜酸可多加或全加），30 - 40 克蔗糖糖浆，用勺子搅拌均匀，放入之前准备的一片柠檬，缓慢沿杯壁注入苏打气泡水直至满杯（不要倒在冰上），用勺子轻轻上下提拉搅拌均匀（不要旋转搅拌），液面放置装饰用绿叶（可选）。
有雪克瓶调配：将冰块、金酒、柠檬汁、蔗糖糖浆倒入雪克瓶雪克均匀，倒到杯子中（冰太碎可过滤后重新补冰）。', e'选择合适容量的透明玻璃杯便于观察饮品状态。
切柠檬时注意刀的方向。
搅拌时注意方式，避免气泡流失。
沿杯壁缓慢注入苏打气泡水可减少气泡流失。', './gin-fizz.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (43, 0, '素菜', '鲜', '轻松上手', '10', '蒸箱鸡蛋羹', '蒸箱鸡蛋羹是一道简单快捷易做的菜，制作时长约为15分钟。适用于有家庭蒸箱的厨师。', e'鸡蛋1个
食用盐1g
食用油5ml
生抽6ml（可选）', e'一个鸡蛋放入碗中打散
向碗中加入鸡蛋体积1.0 - 1.5倍60度纯净水，并且搅拌均匀
加入食用盐1g
加入食用油5ml
过滤蛋液，去掉蛋液中的浮沫（可选）
确认蒸箱的水源已经补充至足够
将已经完全搅拌均匀的鸡蛋液碗放入蒸箱
调节至100摄氏度蒸10分钟
打开蒸箱 （注意：蒸箱在开启时会有蒸气瞬间喷出，注意缓慢开启）
出锅（可加入生抽调味）
享用', '注意水和鸡蛋的比例，超出范围会影响口感。过滤蛋液可使蒸出来的蛋更美观。蒸箱开启时注意防止蒸气烫伤。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (44, 0, '饮料', e'酸
甜', '大展身手', '60', '酸梅汤', '酸梅汤是传统的消暑饮品，具有独特的酸甜风味，制作过程虽有些复杂，但能带来美味的享受。', e'水 2 升
乌枣 25 克
乌梅 25 克
山楂片 30 克
黄冰糖 100 克
甘草 2 克
陈皮 4 克
红豆蔻 1 克
干桂花 3 克', e'冲洗乌枣、乌梅、山楂片、甘草、陈皮、红豆蔻，用 1.5 升水常温浸泡两小时以上。
开中大火煮沸，盖盖，转小火煮 40 分钟，得头煎。
将冰糖放入盆内，倒入沥好用材的头汤，搅拌至冰糖融化。
药材重新装回锅内，加 600 毫升水，开大火煮沸，盖盖，转中火煮 20 分钟，得二煎。
将二煎和冰糖水趁热混合，在 60 - 70℃加入干桂花，加盖晾凉后放入冰箱冷藏 3 小时以上，饮用时沥出干桂花。', e'材料浸泡时间要足够，以充分释放味道。
煮制过程中注意火候和时间控制，避免煮干或煮糊。
冷藏后的酸梅汤口感更佳。', './imges/sour_plum_soup.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (45, 0, '早餐', '鲜', '小试牛刀', '11', '溏心蛋', '喜欢健身的小伙伴可以在每颗鸡蛋中获得6克蛋白质，大约15分钟可以完成制作溏心蛋。', e'鸡蛋 1颗或更多
淹过鸡蛋约2公分的冷水', e'将鸡蛋放入电锅中，鸡蛋不可互相堆叠，应皆在底部，并留有空间可以晃动。
倒入淹过鸡蛋约2公分的冷水。
开盖，使用最大功率加热至水滚起（大约85 - 95度，稍微滚动，不需完全沸腾）。
关火，盖上盖子，让鸡蛋静置。想要中央有流动的蛋黄，需静置6分钟；若想要完全煮熟的易碎蛋黄，需静置10分钟。
沥干水分，用冷水冲洗鸡蛋约1分钟，即可去壳食用。', e'如果觉得鸡蛋不够熟的小伙伴可以依照自己的喜好添加更多的水。
溏心蛋有沙门氏菌感染的风险，不建议静置5分钟以内。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (71, 0, '荤菜', e'鲜
咸', '轻松上手', '15', '黔式腊肠娃娃菜', '黔式腊肠娃娃菜制作简单，无需掌握火候和调料，口味咸鲜可口，南北皆宜，是一道适合懒人的菜肴。', e'黔式腊肠200g
娃娃菜300g
水750ml', e'锅内放入750ml水，开火加热至沸腾
放入腊肠，计时13分钟
放入娃娃菜，计时2分钟
关火，夹出腊肠及娃娃菜
娃娃菜切段、腊肠切片，装盘', e'根据锅的大小，建议以水量没过食材为宜，宁多勿少
如果没有刀具，娃娃菜和腊肠不切也可以', './黔式腊肠娃娃菜.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (46, 0, '早餐', '鲜', '轻松上手', '4', '蒸水蛋', '教程教您做出水滑嫩香的蒸水蛋，饭店同款美味。', e'新鲜鸡蛋 2 个
盐 2g
热水 260ml', e'鸡蛋打入碗中，打散。
取其他容器，倒入 1.5 倍（半个蛋壳为 0.5 倍水）于蛋液的温水（温度 20~30），将盐倒入水中化开。
将盐水倒入鸡蛋液中，顺时针或逆时针单方向搅拌均匀，气泡之类的可以用舀出丢弃，过筛则口感更加。
使用锡纸包裹盛蛋液的碗（或用盘子盖住），置入提前带盖并加入大约 3cm 深度水的锅中。
中火烧至水开，转最小的火继续蒸 4 分钟。', '出锅稍晾即可食用，保留鸡蛋原香的终极口感，也可加入蒸鱼豉油，葱花香油作为佐料。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (47, 0, '素菜', e'酸
咸', '轻松上手', '15', '凉拌黄瓜', '凉拌黄瓜是一道清爽可口的凉拌菜，制作简单，口感丰富。', e'黄瓜 200 克 * 份数
醋 7.5 ml + 4 ml * 份数
酱油 5 ml + 2.5 ml * 份数
蒜 3 瓣 * 份数
盐 0.4 克 + 0.2 克 * 份数
香油 5 ml + 2 ml * 份数
蚝油 5 ml', e'用菜刀将黄瓜拍扁，再剁成长 3 厘米的碎块。
将碎黄瓜装入碗中。
将蒜拍碎切成碎末。
将醋，酱油，盐，蚝油和蒜依次倒入碗中搅拌均匀并腌制 15 分钟。
将香油倒入碗中并均匀搅拌。', e'部分情况下黄瓜端头有苦味，请洗净切下后确认。
做好之后直接开吃，亦可先准备好后放入冰箱冷藏（并非冷冻）后食用。
若放入冰箱冷藏，则需使用保鲜膜包紧，并在 8 小时内食用完毕，否则黄瓜会因过度腌制失去清脆口感。
推荐黄瓜去皮，口感更好。', '', '份数', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (48, 0, '荤菜', '鲜', '小试牛刀', '3', '瘦肉土豆片', '瘦肉土豆片是一道简单易做的小炒家常菜，方便快速，适合上班族用于带饭。', e'纯瘦肉200g
土豆200g
蒜苗2根（约20g）
生粉5g
生抽15g
老抽3g
食用盐2g', e'土豆去皮、对半切开，再切成约2mm的薄片，备用。
蒜苗洗净，切成约1cm的段，备用。
瘦肉洗净切成约2mm的薄片，放入碗中，加入5g生粉、5g生抽、3g老抽腌制十分钟，备用。
瘦肉腌制时，烧一锅开水，将土豆片放入锅中，焯水，约5分钟。
热锅，锅内放入10ml - 15ml食用油。等待10秒让油温升高。
放入瘦肉，翻炒至变色，倒入蒜苗一起炒，蒜苗炒约20秒。
放入土豆，保持翻炒，加入2g食用盐、5g生抽。
炒约3分钟，盛盘。', e'土豆片焯水注意不宜太久，防止土豆片变软。
腌制瘦肉要搅拌均匀。', './瘦肉土豆片.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (49, 0, '素菜', e'咸
酸', '小试牛刀', '6', '虎皮青椒', '这道菜谱介绍了虎皮青椒的详细做法，包括必备原料、工具以及具体的操作步骤。', e'青椒5个
大蒜2 - 3瓣
油20ml
白糖15g
生抽15ml
香醋15ml
盐4g', e'去掉青椒蒂，用自来水冲洗干净。
青椒切长片，平均一个青椒纵向切成3 - 4片。
大蒜去皮，切成碎末，体积在2mm x 2mm x 2mm。
拿一个小碗倒入20ml油，将大蒜末放入其中。
白糖、生抽、醋、盐全部倒入砵（碗）等容器，搅拌。
将调料1倒入锅中，开火加热5成放入青椒，青椒片不要叠在一起，单独成片放置锅中。
用锅铲不停的按压青椒，合适的时候翻面。
翻炒约2分钟，待青椒表皮出现褶皱时，倒入调料2。
加大火候继续翻炒30s后即可出锅盛入盘中。', '', './虎皮青椒.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (50, 0, '早餐', '甜', '轻松上手', '8', '蛋煎糍粑', '蛋煎糍粑做法简单，无需太多厨艺基础，热量高，美味顶饿又便宜，十分钟即可完成。', e'糍粑两块
鸡蛋1个
白糖或红糖10g（建议8g - 15g之间）
食用油10 - 15ml
食用盐2g', e'把糍粑切成长方形小块。
碗里打入一个鸡蛋搅碎，加入2g食用盐。
将切好的小糍粑依次放入搅碎的鸡蛋里，涂抹完糍粑双面。
锅里倒入10ml植物油，放入涂抹好的糍粑小块小火煎软。
将剩下的鸡蛋液慢慢倒在糍粑表面。
用筷子或勺子为糍粑翻面，来回煎至金黄色。', e'放糍粑进去时注意间隔开，防止粘在一起。
鸡蛋的量根据糍粑的量而定。
糖的量根据个人喜好调整。', 'https://www.dachu.co/recipe/378826', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (51, 0, '早餐', '', '得心应手', '28', '温泉蛋的做法', '一种传统的日式小吃，可以用于各种佐餐，注意与溏心蛋区分，溏心蛋是蛋黄不熟蛋白熟了，温泉蛋是蛋白不熟蛋黄熟了', e'鸡蛋 1个
昆布酱油（可选）
香葱（可选）', e'在锅中盛装一定量自来水，确保水面没过约鸡蛋3cm，水中插入温度计。
开火或打开电磁炉，逐渐调整电磁炉功率或火苗大小，使得水温保持在70摄氏度。
将鸡蛋放入锅中。鸡蛋不可互相堆叠，应皆在底部，并留有空间可以晃动。
保持当前温度25分钟。
准备一杯冰水。
捞出鸡蛋，并立刻放入冰水中，等待3分钟。
将鸡蛋打入小碗，完成制作。', e'若使用机械式温度计（无需供电）则温度计探头需没入水中至少6cm，若使用电子温度计则无特殊要求。
锅可以采用稍厚的锅，方便控制温度。
虽然70摄氏度25分钟已经完全可以杀死沙门氏菌，但还是要尽量少吃，或购买正规可生食鸡蛋制作。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (52, 0, '早餐', '鲜', '轻松上手', '5', '美式炒蛋', '美式炒蛋具有松软鲜嫩的口感，与平时的炒蛋不同，美式炒蛋中加入了少量牛奶，使得蛋花更加的细密均匀，并且营养丰富', e'鸡蛋 3 个
全脂牛奶/奶油 10g
黄油 5 克
盐 1 克', e'鸡蛋打入大碗中，加盐搅打至起泡，静置 15 分钟。
黄油切小块入锅，倒入蛋液，开小火不断搅拌。
黄油一融化，就快速翻动蛋液，将其打碎成细密状，在蛋液大体凝固前关火。
加入牛奶搅拌 15 秒，至炒蛋湿润绵密，装盘。', e'想吃的更丰富可以在最后一步那里加上炒好的番茄丁，洋葱丁，培根丁，切好的芝士小丁等不会再出水的食材。
使用平底锅（不粘锅）。
考虑到很多人是一人食就炒一两个鸡蛋，口径比较小的锅或许更方便在锅中均匀搅拌。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (53, 0, '素菜', e'辛辣
鲜香', '得心应手', '7', '榄菜肉末四季豆', '榄菜肉末四季豆是一道色香味俱全的家常菜，由四季豆、五花肉、橄榄菜等食材制作而成。', e'四季豆220g
五花肉100g
橄榄菜20g
大蒜10g
小米辣10g
20ml油
10ml冷油
2ml酱油
2g盐
1g鸡精
1g胡椒粉
0.5g糖', e'将四季豆洗净，撕去筋，切成均匀颗粒备用。
大蒜拍碎剁成蒜末备用。
小米辣切成均匀颗粒备用。
五花肉去皮，剁成肉末备用。
将锅烧热，加入20ml油滑锅，滑好后倒出热油，加入10ml冷油（也可不滑锅，直接放肉末煸炒），小火煸炒两分钟，炒出猪油。
肉末炒香后加入蒜末、橄榄菜和小米辣，炒出香味。
加入四季豆开中火煸炒至少5分钟，确保四季豆熟透。
四季豆炒熟后加入2ml酱油从锅边淋入，再加入2g盐、1g鸡精、1g胡椒粉和0.5g糖。
翻炒均匀后出锅装盘。', e'制作这道菜时，四季豆一定要炒熟，否则可能会食物中毒。
如果没有晾油瓶，也可不进行滑锅操作。', './榄菜肉末四季豆.JPG', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (54, 0, '素菜', '鲜', '得心应手', '14', '上汤娃娃菜', '上汤娃娃菜是一道色香味俱全的素菜，也是减肥餐的不错选择。', e'娃娃菜700g
金针菇10g
皮蛋一个
午餐肉（火腿肠）适量
葱3g
姜10g
蒜10g
盐
糖
淀粉
蚝油
味精', e'娃娃菜洗净，竖着切开切成段。
葱切小段，蒜切片，姜切小片。
皮蛋切成丁，火腿肠或者午餐肉切成1cm大小的丁。
金针菇洗净撕开。
烧热水，娃娃菜放进去十秒钟出一下水捞出。
热锅凉油，加热锅倒入油过一遍就倒出来，重新倒入一点油。
调至小火加入葱姜蒜，煎炒出香味。
加入300g清水（水量没过娃娃菜即可），放入娃娃菜、金针菇、午餐肉。
加入调味料蚝油、糖、盐、味精烧开。
煮3分钟，煮开后开始装盘，盛出娃娃菜后皮蛋放在上面把汤汁浇上去。', e'根据个人口味调整调味料的用量。
煎炒葱姜蒜时用小火，避免炒糊。
煮娃娃菜的时间不宜过长，以免影响口感。', './上汤娃娃菜.png', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (55, 0, '素菜', '鲜', '轻松上手', '30', '芹菜拌茶树菇', '芹菜拌茶树菇是一道简单易做的凉拌菜，富含多种人体所需的维生素和矿物质。', e'闽星茶树菇1瓶
芹菜250 - 300g
香油5ml
蚝油大约7ml
味极鲜3ml
食用盐大约2g', e'（如果是芹菜苗这一步略过）用热水壶烧一壶热水，备用。
新鲜的芹菜苗或者芹菜摘去黄叶清洗，备用。
（如果是芹菜苗这一步略过）将芹菜摘去叶子单独放一个盆中，将芹菜茎用刀划成2 - 3毫米宽的芹菜条备用。
芹菜苗切成4cm的芹菜段，备用。
（如果是芹菜苗这一步略过）起锅开火，将热水壶的开水倒入锅中待水起泡沸腾。
（如果是芹菜苗这一步略过）将切好的芹菜条放入锅中焯水，大约20秒放入芹菜叶，5秒后关火全部捞出过凉水，备用。
将盆中焯好的芹菜或者芹菜苗撒上准备好的食盐，香油，耗油和味极鲜搅拌均匀。
将茶树菇倒入盆中搅拌均匀。
装盘。', e'焯水时的水位需要没过芹菜。
芹菜叶太老太硬的话可以不要。', e'./芹菜拌茶树菇.jpg
./闽星茶树菇.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (56, 0, '素菜', e'咸
酸
鲜', '轻松上手', '4', '凉拌木耳', '凉拌木耳是一道简单易做的凉拌菜，由于发放物资中有很多干货，木耳是较为健康的食物，烹饪方式也相对简单。', e'干木耳20g（湿木耳120g）
蒜瓣2 - 3个
小米辣2个
盐2g
白糖5 - 10g
生抽15ml
醋15ml
香油5ml
芥末约2cm（可不加）', e'若用干木耳，水量约400ml，泡发约45分钟，湿木耳跳过此步骤。
将泡发好的木耳去根并彻底洗净。
起锅烧水，水开后放入木耳，大火煮1.5 - 2分钟。
将蒜瓣、小米辣切碎放入碗中，依次加入盐、糖、生抽、醋、香油、芥末。
木耳盛出后沥水，放入碗中搅拌均匀，端盘。', e'调味品数量可根据个人口味调整，不喜欢芥末可不加。
等木耳冷却入味后口味更佳，约15分钟。', e'./1.jpg
./2.jpg
./3.jpg
./4.jpg
./5.jpg
./6.jpg
./7.jpg
./8.jpg
./9.jpg
./10.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (57, 0, '素菜', '咸', '小试牛刀', '3.5', '椒盐玉米', '这道菜介绍了椒盐玉米的做法，详细说明了所需原料、工具、操作步骤及附加内容。', e'玉米粒（袋装）350g
淀粉40 - 70g
椒盐粉10g
芝麻粒10g
油
吸油纸', e'玉米粒解冻，可温水泡15分钟或灶上开水煮5分钟（带着包装一起煮，撕掉一个口）。
拿出一个簸箕垫上吸油纸，倒入解冻好的玉米粒，摇晃至吸油纸变湿，再倒入第二个垫有吸油纸的簸箕重复操作，直到玉米表面无明显水滴但保持湿润。
倒入大量淀粉，摇晃至淀粉裹住玉米粒。
开灶放锅，倒入油尽量铺满锅底，油热8成，倒入裹淀粉的玉米粒。
中火先煎30s，不翻炒，然后轻微翻炒3分钟出锅。
撒上3g椒盐和芝麻粒。', e'玉米粒可直接在外卖软件买剥好的，30分钟送达后温水解冻。
开水解冻慢就拿开水煮，但别煮玉米本身，带着包装一起煮，撕掉一个口。', './椒盐玉米.jpeg', '标准分量（未明确具体人数，假设为1）', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (58, 0, '早餐', e'咸
甜', '轻松上手', '18', '水煮玉米', '水煮玉米是一道简单易做的美食，将新鲜玉米经过水煮的方式制作而成，口感香甜，营养丰富。', e'新鲜玉米
水
盐
糖（可选）', e'将新鲜玉米剥去外皮，剩部分玉米皮入锅。
加入淹过玉米约半节指头的水，加盐和糖。
水煮开之后转至小火，加盖继续煮15 - 20分钟。
煮熟后沥干水分，冷却后食用。', e'煮玉米的水要淹过玉米约半节指头。
盐和水的比例大约是2克盐加50ml的水。
糖可根据个人口味选择添加或不添加。
玉米煮久点一般也没事。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (59, 0, '素菜', '鲜', '得心应手', '4', '脆皮豆腐', '浓郁的酱汁裹满豆腐，吃一口就停不下来，别提有多好吃。', e'老豆腐 1 块
鸡蛋 2 只
生抽 20 g
蚝油 10 g
老抽 5 g
白糖 10 g
玉米淀粉 50 g
清水 200 ml
食用油 18 ml', e'鸡蛋搅拌形成蛋液放置备用。
配置酱料 （20 g 生抽+10 g 蚝油+5 g 老抽+10 g 白糖+10 g 玉米淀粉+200 ml 清水）。
老豆腐切片 （个人建议，仅供参考  人 * 5 片，厚度 1.2 cm）。
玉米淀粉倒入盘中，将老豆腐片粘上淀粉后，粘上蛋液，放置一旁。
热锅，锅内放入 18ml 食用油。等待 10 秒让油温升高。
将粘上蛋液的老豆腐片均匀放入锅中，铺好锅底，小火煎至金黄翻面。
待两面煎至金黄后，倒入酱料，让每块豆腐都沐浴在酱料中，大火 3 分钟至酱汁浓稠。
关火。', '如果遵循本指南的制作流程而发现有问题或可以改进的流程，请提出 Issue 或 Pull request 。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (60, 0, '早餐', '鲜', '轻松上手', '1', '微波炉荷包蛋', '微波炉荷包蛋是一道简单易做且富含蛋白质的菜，适合通勤社畜作为早餐。', e'鸡蛋2个
饮用水35ml
芝麻油3ml
盐0.8g', e'将鸡蛋打入小碗中，用筷子在所有鸡蛋黄上扎2个洞。
向碗内倒入常温饮用水。
向碗内倒入食用盐。
加入芝麻油。
将放好材料的碗放入微波炉中，高火加热80秒。
到达设定时间后，使用抹布垫着手取出成品。', e'微波炉加热前，可在碗上盖个盖子避免蛋黄和蛋白溅射弄脏微波炉。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (61, 0, '早餐', '甜', '轻松上手', '60', '桂圆红枣粥', '具有补血安神，健脑益智，补养心脾的功效', e'糯米（或大米）100g
红枣15颗
桂圆15颗', e'将桂圆肉扒出，用清水洗两次，放入碗中浸泡10分钟
红枣用清水洗两次，放入碗中浸泡10分钟
糯米放入电饭锅中，清水淘米两次后，加入2000ml水
将桂圆和红枣加入电饭锅
打开电饭锅煮饭模式，1小时后粥成', '对粥的稀稠程度有不同喜好的朋友可以酌情增加或减少水的用量，煮出来的粥是甜的，可以通过控制加入桂圆的数量控制甜度', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (62, 0, '早餐', '', '轻松上手', '5', '空气炸锅面包片', '健康饱肚子，适宜正在减脂期的程序员食用', '面包片两片', e'取出两片面包片（建议使用粗粮面包片）
将面包片垂直放入空气炸锅
200°C烘烤5分钟
取出即可使用', '', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (63, 0, '水产', '鲜', '小试牛刀', '11', '白灼虾', '白灼虾简单容错、有营养、有满足感，类似清蒸鱼', e'活虾250g * 份数
洋葱一头
姜一块
蒜5 - 8瓣
葱一根
食用油10 - 15ml
料酒20ml
酱油10 - 15ml
芝麻一把
香醋10ml
蚝油10ml', e'洋葱切小块，姜切片，平铺平底锅。
活虾冲洗一下（去除虾线、剪刀减掉虾腿虾须子都是可选操作），控水，铺在平底锅的洋葱、姜片之上。
锅内倒入料酒，盖上锅盖，中火1分钟，小火5分钟，关火5分钟。
和上一步并行操作，制作蘸料：葱切成葱花、蒜切碎、倒入酱油、芝麻、香醋，搅拌之。油烧热，淋入蘸料。
虾出锅，用干净的盘子装好。', e'开始不能大火、防止糊底。
如果锅盖有通气口、时间要相应调节一下（考虑增加30秒中火）。
蘸料其实也是可选的、也可以是纯的醋，大自然馈赠的鲜虾在没有水带走冲淡鲜甜的情况下口感味道都非常棒的。', './白灼虾.webp', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (64, 0, '早餐', '鲜香', '小试牛刀', '15', '茶叶蛋', '茶香浓郁，鲜香可口的高蛋白快速营养早餐', e'鸡蛋400g（约8颗）
八角4g（约2颗）
香叶0.5 - 1g（约2片）
桂皮3g（1小块）
茴香5g
冰糖15g
红茶20g
生抽15g
老抽25g
食盐3g', e'用冷水将鸡蛋煮熟，大火大约8分钟（根据自家厨具决定）
鸡蛋捞出，过冷水
将鸡蛋互相碰撞，使每个鸡蛋产生裂缝
将鸡蛋下锅，放入八角，香叶，桂皮，茴香，冰糖，红茶，生抽，老抽，食盐
加水直至没过鸡蛋
大火煮开之后，转中小火煮15分钟
中火煮15分钟之后，捞出料渣，鸡蛋再浸泡一会口感更佳', e'鸡蛋捞出过冷水是为了让鸡蛋和壳之间产生间隙
食盐可根据个人口味选择不加
八角，香叶，桂皮，茴香，冰糖，自己没有这么多食材可以买现成的卤料包', '', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (65, 0, '早餐', '咸', '轻松上手', '7', '燕麦鸡蛋饼', '燕麦鸡蛋饼是极具营养、便于制作、适宜快速制作的早餐，尤其适宜热爱健身的上班族。', e'鸡蛋两个或两个蛋清一个蛋黄
纯干燕麦片50g
牛奶约250ml
蔬菜碎叶一把（可根据口味选择增加50g蔬菜，如菠菜）
黄油适量
盐、胡椒等调料（可根据口味添加）', e'将牛奶与干燕麦混合搅拌均匀至黏稠状。
将鸡蛋搅拌均匀至颜色单一程度。
将鸡蛋液倒入燕麦牛奶中继续搅拌至黏稠、均匀。
平底锅中加入一层黄油并覆盖均匀。
下入搅拌好的食材，并摊开至饼状。
小火加热两到三分钟，如想要加入蔬菜，可以在加热过程中加入碎菜叶。
翻面继续加热两分钟。
出锅，搭配剩下的牛奶作为早餐。', e'如果口味偏咸口，可以在搅拌鸡蛋液时加入盐，胡椒等调料。
煎饼时使用小火，避免燕麦部分煎糊。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (66, 0, '素菜', '', '得心应手', '7', '茄子炖土豆', '一道家常菜，将茄子、土豆与肉搭配炖煮，味道鲜香可口。制作时先准备好食材，按步骤操作，注意火候和翻炒时机，能做出美味的茄子炖土豆。', e'茄子（份数*1个，每个约150g）
土豆（份数*1个，每个约150g）
肉（份数*180克）
青辣椒50克
酱油（份数*15毫升）
盐（份数*5克）
蒜3瓣', e'将茄子、土豆、辣椒洗净，蒜扒皮并拍碎。
将茄子、土豆切成约6立方厘米的块，辣椒切成5克的小块，肉切成3厘米的丝。
开火，热锅，加入份数*13毫升的油。
当能看到锅里的油冒出一丝烟时，放入辣椒。
煸出辣椒香气后，立刻放入肉，用铲子翻炒30秒。
放入土豆，翻炒30秒。
放入茄子，翻炒30秒。
放入酱油和盐，继续翻炒5分钟。
加入水，水面高度为锅内食材高度的0.9倍，并盖上锅盖。
等待，直到锅内水的高度剩余食材高度的0.1倍时，开盖，放入蒜，搅拌均匀，关火。', e'在操作的第5-7步骤中，如果锅底没有液体（油或水），则加5毫升的水再继续翻炒。
一份正好够2-3个人食用，需根据实际份数准备食材。', '', '份数（2-3人一份）', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (67, 0, '早餐', '', '轻松上手', '2', '吐司果酱', '这是一款能快速搞定的饱腹感懒人营养早餐，操作简单，味道美味，适合程序员等人群，耗时短且不会产生额外垃圾和需要清洗工具。', e'新鲜吐司两片
足够涂满一面吐司的果酱', e'将吐司放入面包机
设置好档位，等待两分钟，吐司加热完成弹出
先取出一片吐司，涂满果酱再盖上另一片吐司即可
用餐巾纸包一下可边走边吃或吃完再出门', e'面包机价格一般不超过一百块
吐司可去楼下超市或通过美团买菜购买，一包十块钱八片，保质期短但干净卫生', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (68, 0, '素菜', '鲜香', '得心应手', '6', '葱煎豆腐', '这道菜是一道美味可口的家常菜，通过煎制豆腐并搭配葱和辣椒，使其色香味俱全。', e'白豆腐（数量 = 份数 * 0.8 向上取整）
葱（数量 = 2 根/三人）
青辣椒（数量 = 1.5 只/三人）
盐（盐量 = 份数 * 3g）
鸡精（鸡精量 = 份数 * 1.5g）', e'豆腐洗净，切约 5mm 厚度，置于碟中。
葱洗净，除去根部，切成葱花，备用。
辣椒洗净，切开，去籽，切成 1cm * 1cm 状，备用。
热锅，加入份数 * 9ml 油。
油入锅后，使其均匀布于锅底，均匀放入豆腐，小火煎至金黄翻面。
待两面金黄，盛入碟中备用。
补油至覆盖锅底，倒入辣椒大火翻炒，并铲碾 3 分钟。
倒入豆腐，翻炒，加入盐与鸡精，中火翻炒 1 分钟后倒入 10ML 水，大火收汁。
出锅前撒上之前计算好的葱花，起锅盛盘。', e'根据个人口味调整盐和鸡精的用量。
煎豆腐时要小火慢煎，确保两面金黄且熟透。
翻炒辣椒时要注意火候，避免炒焦。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (69, 0, '荤菜', '鲜', '轻松上手', '15', '肉饼炖蛋', '肉饼炖蛋是一道传统的中国家常菜，也是一道非常受欢迎的下饭菜。', e'猪肉末300g
鸡蛋2个
料酒10ml
生抽20ml
白胡椒粉5g
芝麻香油10 - 15ml', e'在碗中加入猪肉末、料酒、生抽、白胡椒粉、鸡蛋和芝麻香油，搅拌均匀。
将调好味的猪肉末铺在盘子里，肉末中间用勺子挖一个洞，往洞中打入1个鸡蛋。
锅中加水至1/4高度，水烧开后，将盘子放入锅中，盖上锅盖，蒸15分钟。', '在取出肉饼炖蛋时，注意盘子很烫，请小心操作。', '', '', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (70, 0, '荤菜', e'咸
鲜香', '小试牛刀', '30', '烤鸡翅', '这是一道制作烤鸡翅的菜谱，详细介绍了必备原料、工具、计算方法、操作步骤以及附加内容。', e'鸡翅中
盐
黑胡椒粉
酱油
料酒', e'鸡翅放入碗中，加盐、黑胡椒粉、酱油、料酒进行腌制30 - 40分钟。
将烤箱预热至200℃，把腌制好的鸡翅均匀地放在烤盘上，放入烤箱中层，烤15 - 20分钟。
取出烤盘，将鸡翅翻面，再烤15 - 20分钟，直到熟透。', e'可以在腌制鸡翅时加入蜂蜜、酱油、姜蒜粉、五香粉等作为调味料，提升口感和香气。
烤鸡翅时，建议将烤盘底部垫上一层锡纸，便于清洁烤盘。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (72, 0, '素菜', '鲜香', '小试牛刀', '18', '烤茄子', '烤茄子是一道制作简单且香气浓郁的菜品，最终成品和楼下烧烤摊的烤茄子差不多。', e'茄子1个（大约200g）
食用油20 - 30毫升
酱油4 - 6克
小米椒1个（大约20g）
蒜蓉3 - 4瓣
孜然1 - 3克
食用盐0.5 - 2克', e'将酱油、孜然、食用盐、蒜蓉和切碎的小米椒置于碗中，均匀搅拌备用。
茄子洗净，用纸巾擦干表面的水分。
用叉子在茄子的一侧扎4 - 8下。
使用15 - 25ml的食用油涂满茄子表面。
将烤箱温度设置为200℃（打开烤箱风扇 大火），预热2分钟。
将茄子放入烤箱中层或者上层，烤制12 - 15分钟（茄子表面有褶皱，且能按压0.3 - 0.5cm的深度即可）。
取出茄子，用刀茄子上竖着划一个口子。口子居中，上下距1 - 1.5cm。
用小刀或者叉子伸入口子，竖着切割茄子内部。
将口子微微掰开，倒入第一步准备的酱料。
再次将茄子放入烤箱，将烤箱温度设置为200℃，烤制4 - 7分钟。
取出，关闭烤箱电源。', e'茄子表面有水分、未涂满食用油或未使用叉子扎孔可能导致茄子在烤制的过程中爆裂。
第一次用刀划口子的时候，可以直接将茄子竖直切成两半，然后切割出纹路后涂抹上酱料。', './烤茄子.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (73, 0, '荤菜', e'咸
甜', '轻松上手', '10', '洋葱炒猪肉', '咸中带甜，简单上手，一不小心可能让人多吃一碗饭。一般只需15分钟即可完成。', e'洋葱一颗
猪肉250g
蒜头3瓣
食用油15ml
黑胡椒1.25g
酱油30ml
糖15g
麻油5ml
番茄酱15ml
料酒15ml', e'洋葱切片，猪肉，蒜头拍碎，以及混合上述调味料备用
炒锅内倒入1大匙食用油（等待10秒让油温升高），倒入猪肉
炒至变色后下蒜头炒香盛起备用
原锅下洋葱翻炒3 - 4分钟后加入调味料炒匀
下刚盛起备用的猪肉翻炒至猪肉熟后
待猪肉熟后再翻炒1、2分钟即可起锅', e'可以考虑购买[茶匙，大匙](https://www.sohu.com/a/127293243_570657)来精准确定用料的量
猪肉可选猪肩肉片或是切好的肉丝看个人喜好', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (74, 0, '荤菜', '辛辣', '小试牛刀', '2', '小炒黄牛肉', '小炒黄牛肉是一道简单易做的湘菜，口味十分劲爆爽口。', e'牛里脊400g
芹菜200g
小米椒30g
野山椒30g
香菜30g
食用油15ml
酱油6ml', e'牛里脊切成不超过3cm宽，3mm厚的薄片，倒入6ml酱油，用手抓匀备用
芹菜切成不超过5cm的小段，备用
小米椒切成丝状，备用
野山椒切成颗粒，备用
香菜切成成不超过3cm的小段，备用
热锅，锅内放入15ml食用油，大火等待30秒让油温升高
放入小米椒和野山椒爆香
放入牛里脊和芹菜，然后大火翻炒1分钟
关火，撒上香菜，盛盘', '操作时，全程需要开大火', './小炒黄牛肉.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (75, 0, '荤菜', '鲜香', '轻松上手', '6', '蒜苔炒肉末', '这是一道北方家常菜，做法简单，味道上乘，备受北方人民喜爱。', e'蒜苔1扎（每扎约190g）
五花肉薄片4片（约20g）
食用油10ml
蒜瓣2瓣
生抽15ml
食盐2g', e'蒜苔切成5cm小段，备用。
五花肉切成5mm*5cm丝状，备用。
蒜瓣拍碎切成末，备用。
热锅，锅内放入10ml食用油，等待10秒让油温升高。
放入蒜末，中火翻炒10秒将蒜末炒出香味。
放入五花肉和5ml生抽，中火翻炒30秒将肉炒熟并上色。
将蒜苔放入锅内并加入10ml生抽，翻炒30秒。
锅内加入20g水，中火翻炒5分钟将蒜苔炒至稍稍变软。
最后加入2g食盐，中火翻炒30秒，即可出锅装盘。', e'加入食盐前可尝一下咸淡，自行决定是否增减盐量。
选用五花肉薄片是因为切肉简单且不用腌制即可入味。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (76, 0, '素菜', '鲜', '得心应手', '6', '蚝油三鲜菇', '几分钟就能做出的蚝油蘑菇，滑嫩入味鲜美可口', e'鲜香菇2朵
蟹味菇30g
白玉菇30g
小米辣1根
菜椒0.5颗
食用油10ml
盐5g
料酒2ml
淀粉10g
生抽10ml
鸡精3g
香葱0.5根
姜末1粒
蚝油5ml
开水350ml
西蓝花100g', e'蟹味菇、白玉菇去掉根部泥土，掰散菌朵
香菇切片（每片厚度0.5 - 1cm）
生粉倒入小碗中，加入50ml水，搅拌成水淀粉备用
水开，放入西蓝花，清水煮3分钟，放入碗中备用
洗锅烧开水，加入5g食用盐，倒入蟹味菇、白玉菇、香菇，水煮1分钟
1分钟后，捞出沥干水分
起锅烧油，待油开始冒小泡，放入姜末、小米辣、菜椒煸炒30S
倒入三鲜菇，然后依次倒入生抽、蚝油、鸡精，翻炒均匀后，倒入水淀粉
中火烧干汁，加入料酒、葱花出锅
摆上西蓝花', e'制作过程中注意食材的处理大小和厚度，以便更好地入味和掌握烹饪时间。水淀粉的调制要充分搅拌，确保没有颗粒，以免影响菜品的口感。
煮西蓝花的时间不宜过长，以免营养流失和影响口感。
炒三鲜菇时，火候不宜过大，避免炒焦，影响菜品的色泽和口感。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (77, 0, '素菜', '鲜', '得心应手', '10', '蒲烧茄子', '蒲烧茄子是一道具有特色的素菜，从外观上之于鳗鱼正如`土豆炖.*`中的生姜之于土豆。', e'1个长的上小下大的茄子
20ml蜂蜜
15ml白糖
40ml生抽
10ml老抽
20ml料酒
100ml水', e'茄子削皮、横着切成两段。
蒸5分钟。
纵向切开，不要切断，在两边切面各划2 - 3刀至可以摊平。
煎至两面金黄。
往茄子上浇蒲烧汁至没过1/2茄子高度。
煎至背面上色，翻面，同时收汁，若无法收汁可以加入水淀粉（生粉和水的比例在1:4到1:10根据收汁情况而定）。
把剩下的蒲烧汁浇在茄子上。
出锅。', e'根据锅的类型决策不同量的油，不粘锅油汇聚成滴后要散布在茄子的面积，铁锅摊开后油可以刚好覆盖锅底。
如果觉得腻可以在装盘后撒点切成2 - 5mm的小葱，颜色搭配上也能不那么单调。
炒茄子（鱼香茄子、酱爆茄子）墙裂推荐浙茄，细长所以切成滚刀块刚刚好，皮很嫩不像这里需要去皮，茄子的味道适中。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (78, 0, '素菜', '鲜', '轻松上手', '4', '微波炉鸡蛋羹', '微波炉鸡蛋羹是一道简单易做的菜，适合夜间突然饿了的时候充当夜宵，快捷简单。', e'鸡蛋 2 个 * 份数
水 200ml * 份数
虾皮 10 个 * 份数（可选）
葱 5g *份数（可选）
盐 3g * 份数
酱油（可选）
芝麻油（香油） 1ml（可选）', e'将鸡蛋打入可使用微波炉加热的陶瓷碗中，使用筷子将其打散。
加入水和盐，搅拌均匀。
将虾皮放入碗中，搅拌均匀，保证所有虾皮不会堆积在一起。
葱切碎至边长 0.6±3mm 状，放入碗中搅拌均匀。
将此碗及内容物放入微波炉中，容器表面覆盖保鲜膜或以可微波瓷盘加盖（注意：不得密封，必须留有涨缩量）加热 2 分钟(500W)。
小心地取下保鲜膜或其他覆盖物，然后继续加热 2 分钟。
若微波炉不带旋转式加热盘，将碗缓慢的水平旋转 180 度，以确保内容物加热均匀。
放入芝麻油。
小心地从微波炉中拿出碗（真的很烫）。
如果选择放入酱油，则确保酱油在鸡蛋羹表面流动后能以最薄的形式沾满鸡蛋羹表面即可。', e'鸡蛋 1 个约为 50±5g。若使用其他品种蛋品可按比例增减水量。
一定要确保将鸡蛋打散，否则可能会发生轻度鸡蛋爆炸。
鸡蛋和水不能超过碗容量的 2/3，否则可能发生溢出。', './微波炉鸡蛋羹.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (79, 0, '素菜', '鲜香', '得心应手', '5', '干锅花菜', '干锅花菜是湘菜常见的一道菜', e'花菜 400 g
五花肉 100 g
辣椒 1 - 2 根
生抽 10 ml
白糖 5 g
蒜 3 - 4 个
盐 2 g
油 10 ml', e'花菜朵朝下，没入淡盐水中浸泡 20 分钟。然后洗净用小刀拆成小朵
入开水锅中焯水 1 分钟，捞出立即用冷水冲淋至完全凉透，沥水备用
五花肉切成薄片，大蒜白色切下用刀背拍扁，小红辣椒切成段
锅烧热放油，油热下大葱白爆香
下五花肉片入锅，用中火煸炒至表面全部变色，继续煸炒一会儿，把肥肉部分的油份逼出一部分
倒入红辣椒段和花菜，翻炒几下
加入 10 ml 生抽
再加入 5 g 白糖，转大火不断翻炒 1 分钟
把大蒜叶部分切成段，放入锅中，翻炒几下后，关火盖上盖子焖 1 分钟即可', '如果遵循本指南制作流程发现问题或可改进流程，请提出 Issue 或 Pull request 。', './干锅花菜.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (80, 0, '汤与粥', '鲜', '大展身手', '30', '菌菇炖乳鸽', '菌菇炖乳鸽汤鲜、肉嫩、营养丰富', e'乳鸽300g
菌菇100g
玉米200g
姜30g
料酒15ml
食用盐10g', e'冷水洗干净热心摊主处理好的乳鸽。
冷水锅中放入洗干净的乳鸽，加入15ml料酒与姜，水煮开即可捞出乳鸽。
把乳鸽放到高压缩或者瓦罐中、倒入的水要没过乳鸽，放入生姜20g，玉米200g、菌菇100g。注意：高压锅30分钟，瓦罐需在水烧开后转小火慢炖40 - 60分钟。
时间到了，盛到碗中，加入3 - 5g盐即可。', '', './菌菇炖乳鸽.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (81, 0, '素菜', '鲜', '轻松上手', '2', '水油焖蔬菜', '水油焖蔬菜中添加了油，提升了口感，还可提升脂溶性维生素的摄入，相比生吃蔬菜好处更多。', e'叶菜类蔬菜300g - 500g
食用油
盐3g
蚝油3ml（可选）', e'洗净蔬菜。
锅中加入150ml水，并烧开。
加入3g盐。
（可选）加入3ml蚝油。
加入2ml食用油。
下菜，翻拌一下，然后盖上锅盖焖1分钟。
盛盘。', e'不确定咸淡时，可先少放盐，出锅前尝味再调整加盐量。
可以用鸡汤、骨头汤等替代水，味道更好。
焖的时间不可过长。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (82, 0, '早餐', '', '轻松上手', '10', '煎饺', '介绍了速冻水饺制作煎饺的方法，包括所需工具、原料、具体操作步骤及注意事项。', e'速冻水饺（根据个人食量选择，约10 - 15个）
食用油10ml - 15ml
黑芝麻
葱花', e'取出平底锅（不沾平底锅最佳）。
加入10ml - 15 ml食用油。
开火，放入饺子（尽量平均铺开，不宜堆叠）。
立刻加入清水，水线没过饺子平均高度的1/2。
盖上锅盖（此时炉灶应该处于大火）。
等待8 - 10分钟。
当锅中水分仅剩2mm时，转中火开始煎制。
当水分全部蒸发后，摇晃平底锅使饺子受热均匀。
放入黑芝麻和葱花再焖10s。
1 - 2分钟夹出一个饺子观察底部，若出现金黄色脆皮立即取出。', '操作时，需时刻观察锅内情况，切记不可分神玩手机。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (83, 0, '早餐', '鲜', '轻松上手', '5', '金枪鱼酱三明治', '饱腹感很强的懒人早餐，营养很丰富，高蛋白', e'水浸金枪鱼罐头65g
方形吐司片2片
蛋黄酱50mL
俄式酸黄瓜汁10 - 15mL
芝士片（可选）
火腿片（可选）', e'将金枪鱼、蛋黄酱、俄式酸黄瓜汁倒入碗中，用勺子搅拌，保证将金枪鱼块搅碎，酱整体呈糊状，并备用
将1片吐司放在轻食机上
将做好的金枪鱼酱涂抹到吐司上，建议10 - 15ml
将另一片方形吐司片覆盖在上面，并按压轻食机，开机
待轻食机自动停止加热，即可装盘使用', e'金枪鱼酱可以在前一天晚上在冰箱冷藏
金枪鱼酱建议冷藏时间不超过一周，切需要使用保鲜膜盖住
注意在按压操作之前不要将轻食机电源接通，以免引发安全问题', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (84, 0, '主食', e'酸
甜', '轻松上手', '10', '酱拌荞麦面', '酱拌荞麦面营养健康、酸甜可口', e'荞麦面 100g
黄瓜 0.5 根
红萝卜 0.5 根
老干妈 20ml', e'荞麦面下冷水煮熟，8 - 10 分钟后捞出沥干备用
黄瓜、萝卜切成小条
将荞麦面、黄瓜、萝卜放入盘子，放上老干妈，搅拌', e'荞麦面沥干后放冰箱冰镇口感更佳
配料可根据个人喜好选择虾仁、肉沫等
酱料可根据个人喜欢选择花生酱、芝麻酱等
荞麦面与其他面条热量几乎一致，不适合作为减脂主食', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (85, 0, '早餐', '甜', '轻松上手', '1.3', '微波炉蛋糕', '利用微波炉快速制作蛋糕，简单易操作', e'黄油
面粉
泡打粉
鸡蛋
白（红）糖
盐
咖啡粉
巧克力
麦片
牛奶
坚果
饼干屑
香蕉', e'挖半个鸡蛋大的黄油放进容器，在微波炉加热15秒至融化。
将巧克力/香蕉融化/搅碎成颗粒/糊状。
打入一个鸡蛋并打散搅和。
加入15g白（红）糖。
加入1g盐。
加入2.5g泡打粉。
加入15g面粉。
加入喜欢的口味食材，搅和至看不见干粉的稠酸奶状。
加入可选的干燥食材在顶端。
微波炉高火加热1分钟至蓬松蛋糕形态。
取出杯子。', e'在夸赞自己之前的操作可以重复多遍做出更大的蛋糕。
泡打粉用来让蛋糕更蓬松，大多不含铝，几块钱一包，可以买了在家备着。
食材不要超过容器的3/4。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (86, 0, '主食', '鲜香', '得心应手', '4', '韭菜盒子', '韭菜盒子是一道美味的传统小吃，外皮酥脆，内馅鲜香，富含维生素和蛋白质。', e'韭菜 500g
虾仁 100g
鸡蛋 3 枚
香油 10ml
盐 5g
面粉 250g', e'将面粉放入大碗中，加入水，搅拌成光滑的面团，静置 30 分钟。
韭菜洗净切碎，加入打散的鸡蛋、5g 盐，搅拌均匀。
将面团分成小剂子，擀成薄圆饼，包入韭菜、虾仁、鸡蛋液。
热锅，加入食用油，放入包好的韭菜盒子，煎至两面金黄，约 3 - 4 分钟。
盛盘，稍凉后即可享用。', e'制作时可根据个人口味添加豆腐干等配料。
注意煎制时火候，避免外焦内生。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (87, 0, '荤菜', '鲜香', '小试牛刀', '35', '姜葱捞鸡', '这道菜嫩滑爆汁，是白饭杀手，做法简单易做。', e'鸡腿4个（约400g）
盐焗鸡粉5g
姜50g
葱1根
盐5g
糖5g
油35ml', e'四个鸡腿清洗干净，放入碗中。
碗中加入盐焗鸡粉和5ml油，搅拌均匀。
让鸡腿静置腌制15分钟，同时准备蒸锅并把水煮开。
鸡腿腌制完成后，放入水开后的蒸锅中，蒸制20分钟。
将姜根据个人口味切成姜蓉或姜丝或姜粒。
将葱切成0.5cm小段。
将葱姜放入蘸料碗，并加入盐和糖。
将剩余的油倒入另一个锅中加热至六至七层热。
将热油淋入葱姜碗中。
鸡腿蒸好后将其撕碎成鸡丝，大概1cm粗即可。
将葱姜油淋在鸡丝上，搅拌均匀即可。', '可根据个人口味调整姜的形态和调料用量。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (109, 0, '水产', '鲜', '得心应手', '8', '蛏抱蛋', '蛏抱蛋是流行于福建省福州地区的传统家常菜', e'蛏子200g
鸡蛋2个
食用油100ml
洋葱0.25个
淀粉20g
生抽5ml
鸡精5ml
料酒5ml', e'烧开水，将蛏子放入水中，水煮2分钟后，捞上来去壳，放入大碗。
往大碗中加入洋葱、生抽、料酒、鸡精、生粉后，充分搅拌。
往大碗中打入2个鸡蛋，继续搅拌。
起锅烧油，倒入碗中蛏子，煎炸至单面金黄后，翻面继续煎炸。', e'更多情况下，福州当地会选用马蹄（解腻）和马铃薯（洗油），因为疫情期间买不到，所以选用了凤梨。
闽菜以甜为主，如果吃不惯的可以放弃白糖。
可以通过勺子敲打瘦肉块，听到声响来判断是否炸透瘦肉。', e'./1.jpeg
./2.jpeg
./3.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (88, 0, '荤菜', e'辛辣
鲜香', '小试牛刀', '6', '姜炒鸡', '姜炒鸡是一道湖南口味菜，下饭五颗星，食材平平无奇又十分容易烹制，一学就会。', e'半只土鸡（约650g）
250g生姜
250ml啤酒
20ml生抽
10ml老抽
3g盐
0-5个小米椒（0-50g）
0-5个美人辣（0-50g）
5个泡椒（50g）
3头大蒜（50g）
50ml食用油（茶油最好，没有就用菜籽油）', e'鸡尽量剁成1cm的小块，洗净后滤干，再放生抽和料酒腌制30分钟
热锅到微微冒烟，放入食用油，等5秒
下入姜片后转中火炒30秒
下入鸡块翻炒3分钟，炒干水分，炒出鸡油
放入各种剁碎的辣椒和大蒜子，加盐和老抽继续翻炒30秒
倒入啤酒，中小火焖2分钟
大火收汁盛盘', e'根据个人对辣的接受程度调整小米椒和美人辣的用量
使用土鸡制作，味道更佳
焖煮时注意火候和时间，避免糊锅', './姜炒鸡.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (89, 0, '荤菜', '鲜香', '大展身手', '30', '番茄红酱', '番茄红酱香浓可口，营养丰富，可作为薄饼、意面等主食的百搭酱料。做法有些繁琐，适合有烹饪经验的人尝试。一次吃不完可冷冻后随时加热。', e'碎牛肉500g
蒜瓣2个
胡萝卜半根
芹菜1根
洋葱半个
橄榄油
糖2g
食盐10g
胡椒粉5g
番茄酱300g
牛奶300ml
干罗勒或百里香（可选）', e'将胡萝卜、芹菜、洋葱切碎，蒜瓣切片。
加入10ml橄榄油，热油下锅蔬菜，大火翻炒开始略微变色后盛出。
锅内加油10ml，加蒜翻炒10秒，加入碎牛肉、糖、盐、胡椒粉和香料将牛肉炒脆（有颗粒感）。
加入炒好的蔬菜们和番茄酱继续翻炒，搅拌均匀。
分多次缓缓倒入牛奶，中小火煮30分钟，完成。', e'考虑各个品牌的番茄酱内含盐量不同，建议在炒牛肉时少放盐，煮的时候尝一下再调味。
煮酱料期间请搅动，以免粘锅。如果酱料变粘稠就可以出锅啦！
可根据个人口味，将碎牛肉替换成一半碎猪肉一半碎牛肉，牛奶替换成鸡汤或饮用水。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (90, 0, '荤菜', '醇厚', '轻松上手', '10', '香煎五花肉', '香煎五花肉是一道简单易上手的菜。五花肉肥而不腻，生菜叶脆爽健康。稍微有下厨经验的人半小时便可制作完毕。', e'五花肉条（推荐长宽高为20cm*6cm*5cm）
生菜
酱油8g
盐1g
味精1g
料酒10g
姜两片
大蒜两朵
油5ml
豆瓣酱', e'将五花肉条沿长边切片，每片厚1mm - 1.5mm，备用
将切好的五花肉放置碗中，依次加入8g酱油，1g盐，1g味精，10g料酒，两片姜，两朵拍扁的大蒜腌制10分钟
将生菜叶直接用手扒下来，洗干净，备用
热锅，倒入5ml食用油。油轻微冒烟后下入五花肉。单面煎制焦黄色后翻面，另一边同理
五花肉出锅后，装盘
将豆瓣酱抹到菜叶上，卷着五花肉即可食用', '操作时，小心被溅出的油烫到', './香煎五花肉.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (91, 0, '荤菜', '鲜香', '小试牛刀', '15', '咖喱肥牛', '咖喱肥牛美味营养并且下饭，吃多了炒炸菜后再吃个咖喱肥牛相当美滋滋。适合在家吃或者做成便当带去公司吃（微波炉加热也不会有太大味道~）。并且所需材料少，容易购买。', e'香叶 1 片
纯牛奶 50ml
洋葱 100g
胡萝卜 150g
土豆 200g
肥牛卷 300g
咖喱块 2 块（大约 100g）', e'洋葱切成条状、胡萝卜以及土豆切成块状，备用
烧一锅开水，水沸时将肥牛卷下锅，捞出血沫后放在一边沥水，备用
热锅，锅内放入 10ml - 15ml 食用油，等待 10 秒让油温升高
放入洋葱，翻炒至洋葱变软变透明
放入土豆以及胡萝卜翻炒 2 分钟
加入冷水至淹没所有食材即可
将香叶、咖喱块投入锅中，盖上锅盖，待水沸腾后将火调小然后等待直至土豆块以及胡萝卜块炖至软烂（可用筷子确认）
加入肥牛卷以及牛奶，盖上锅盖再小火煮 2 - 3 分钟即可出锅（用勺子搅拌食材，注意力度，避免肥牛卷破碎）', e'咖喱块不用捣碎，直接整块投入即可。
操作时，需要注意搅拌食材，避免食材调味料不均匀。', './咖喱肥牛.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (92, 0, '荤菜', '醇厚', '大展身手', '36', '徽派红烧肉', '徽式红烧肉是一道由五花肉等食材制成的菜肴', e'五花肉300g
白砂糖100g
食用油200g
生抽10ml
蚝油5ml
老抽5ml
姜片2片
蒜头3颗
料酒100ml
葱1根
五香粉10g
盐10g', e'五花肉切块，每块2 - 3cm大小。
锅中加入150ml食用油，倒入五花肉，煎炸2分钟后，加入盐，翻炒五花肉，2分钟后出锅。
锅中加入50ml食用油，倒入白砂糖，翻炒到咖啡色。
倒入五花肉，翻炒30S，加入姜片、蒜头后翻炒30S。
加入料酒，五香粉、葱，加入水没过五花肉，盖上锅盖煮10分钟。
加入生抽、老抽、蚝油，中火煮20分钟。
开锅，大火烧汁，端盘。', e'葱是整根，不需要切碎。
步骤二加盐的目的是锁住五花肉的油脂。
制作过程，用部分五花肉做了水煮处理，跟未处理的一起做后续制作，发现未水煮的肉质更Q弹。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (93, 0, '荤菜', '辛辣', '得心应手', '19', '麻辣香锅', '一道以多种食材搭配麻辣香锅调料制作而成的美食，食材丰富多样，口味麻辣鲜香。', e'青菜（油菜、油麦菜、菠菜）455克
无骨肉（猪肉、牛肉、鸡肉、鱼丸、火腿肠）430克
干豆腐152克
北京麻辣方便面1袋
干辣椒5克
麻辣香锅调料110克
食用油105克', e'烧开一锅水（水量能没过第2 - 4步中的食材即可）。
在开水中放入青菜，焯5分钟后盛出备用。
在开水中放入无骨肉，焯4分钟后盛出备用。
在开水中放入北京麻辣方便面，煮2分钟后盛出备用。
倒出开水，擦干锅具，放入105克食用油，大火加热30秒。
放入麻辣香锅调料，翻炒20秒。
放入干辣椒，翻炒10秒。
放入焯过的青菜，改中火，翻炒3分钟。
放入焯过的无骨肉，翻炒3分钟。
放入煮过的北京麻辣方便面，用筷子翻动1分钟。
关火，出锅。', e'食材的比例可按自己喜好重新分配。
注意不同食材的焯煮时间，避免煮过头或不熟。
掌握好火候，大火、中火的时间要准确，以保证菜品口感。', '', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (94, 0, '荤菜', e'咸
甜', '大展身手', '41', '酱排骨', '酱排骨其色泽酱红，肉质酥烂，骨香浓郁，汁浓味鲜，咸中带甜。', e'排骨 300g
五香粉 20g
料酒 10ml
食用油 30ml
白砂糖 15g
老抽 10ml
生抽 10ml
蚝油 5ml
小米椒 1 个
蒜 2 粒
姜 2 片', e'起锅烧热水，放入排骨、姜片、料酒，煮开后用勺子舀去白色油沫，2 - 3 分钟后出锅
冷水清洗排骨，清洗 2 - 3 遍
小火起锅，加入食用油，加入白砂糖 ，轻轻搅拌到糖水变成黄色
倒入排骨翻炒 30S 后，加入生抽、蚝油、五香粉、蒜、小米椒后翻炒 30S 后，加入清水没过排骨
大火煮 30 分钟，加入老抽上色，再煮 10 分钟
起锅摆盘', e'增加味道的可以考虑加入豆瓣酱、番茄酱等
大火煮时间可以根据每个人情况做调整
煮排骨期间，可以顺道放入 2 - 3 个鸡蛋一起煮，做成简易版卤蛋', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (95, 0, '荤菜', '鲜', '大展身手', '150', '广式萝卜牛腩', '广式萝卜牛腩营养丰富，味道鲜美，汤汁浓郁', e'牛腩500g
白萝卜1根
姜片8片
蒜瓣5片
葱结一把
八角2片
桂皮1小块
干辣椒2个
香叶2片
南乳1块
柱侯酱30g
蚝油15g
酱油15g
冰糖10g（白糖10g）
盐5g
老抽15g', e'萝卜滚刀切块备用
牛腩整块焯水，加入2片姜和一把葱结，等水开之后煮5 - 10分钟，然后捞出切件
将牛腩切成自己喜欢的大小
准备焖牛腩的酱料，将南乳、柱侯酱、酱油、蚝油、糖、盐按量调和
热锅下油，将姜蒜爆香，放入牛腩，炒至干身，加入调好的酱料，炒香，可加一点老抽润色
调料充分混合之后倒入热水
将牛腩换到汤锅中，放入桂皮、八角、香叶和干辣椒，焖大概2个小时
牛腩焖到半软之后加入白萝卜继续焖30分钟', '', './广式萝卜牛腩.webp', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (96, 0, '荤菜', '辛辣', '得心应手', '10', '小炒肉', '这是一道常见且受欢迎的湘菜，以五花肉和辣椒为主要食材，经过煸炒后香气扑鼻，味道香辣可口。', e'五花肉500g
朝天椒4条
小米椒4颗
豆豉10g
豆瓣酱10g
老抽10ml
淀粉10g
盐1 - 2g
葱0.5 - 1根
蒜2瓣
食用油15ml', e'五花肉切片
把肉放入器皿内，加入淀粉、老抽、盐搅拌腌制半小时
葱切段
小米椒、朝天椒斜刀切好
热锅、倒油
油热后加入五花肉煸炒，炒至变色后盛出来
向锅中加蒜，煸出香味，加入豆豉，翻炒均匀
加入豆瓣酱翻炒均匀
加入炒好的五花肉继续翻炒均匀
加入小米椒、朝天椒、葱段翻炒40秒
出锅', e'豆豉和豆瓣酱的用量可根据个人口味适当调整，增减范围为±5g
腌制五花肉的时间不宜过长或过短，半小时左右能较好地入味
煸炒五花肉时要注意火候，确保炒至变色但不过老
最后加入辣椒和葱段翻炒的时间不宜过长，40秒左右能保持辣椒的脆嫩口感', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (97, 0, '荤菜', '鲜香', '得心应手', '30', '啤酒鸭', '啤酒鸭不仅入口鲜香，还带有一股啤酒清香。肉久吃不腻，汤久涮而不淡。风味独特，具有热而不浮，香而不腻的独特口味让人赞口不绝。', e'鸭肉半只（约1kg）
啤酒800ml
生抽酱油10 - 15ml
老抽酱油5 - 10ml
姜5片
蒜头12瓣
冰糖10g
干辣椒5个
料酒30ml
盐8g
鸡精5g
丁香4颗
八角3个
香叶3片
豆瓣酱20g', e'把鸭子切成3cm小块，鸭肉冷水下锅，加姜片、料酒，焯一遍水，盛出沥干水分，备用。
炒锅烧热，放入约100ml食用油，大火待油烧开，鸭肉入锅翻炒至上色。
待鸭肉完全变色（肉眼可见泛白），将鸭肉拨到锅的一边，倒入豆瓣酱和糖，小火翻炒出香味和糖色。
加入丁香、八角、香叶、干辣椒、生抽、老抽、蒜，翻炒出香味。
倒入啤酒，没过鸭肉，加入盐、鸡精，然后中火将鸭子烧30分钟（牙口不好的话可以再多烧5分钟）。
出锅盛盘，上桌食用。', '啤酒的量一定要足够把所有鸭肉没过，啤酒最好选择清香型的。', './啤酒鸭.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (98, 0, '荤菜', e'鲜香
醇厚', '大展身手', '10', '山西过油肉', '过油肉是山西传统名菜，历史悠久，基本家家都会做。', e'猪里脊150g
蒜苔6根
盐10g
酱油20ml
葱姜蒜50g
鸡蛋1个
淀粉10g
食用油300ml
木耳20g
葱头100g
料酒适量
陈醋10ml
花椒粉适量
鸡精适量', e'木耳提前泡发好。猪里脊切片放入碗中，加20ml生抽、料酒、花椒粉，打入一个鸡蛋，搅拌均匀，加入淀粉拌匀，倒入300ml食用油封浆，腌制15分钟。
蒜苔切段大约3cm，葱头切菱形块备用。
起锅烧油，油温五成热，下入腌制好的肉片，将肉片打散，捞出控油备用。
将锅中多余油倒出，留10ml油炒菜，油温七成热，下入葱姜蒜爆香，先下蒜苔炒至断生，再下入木耳葱头，加入生抽，花椒粉，翻炒几下将之前炸好的肉片下入翻炒。
加10g的盐，起锅前加10ml的醋和鸡精，起锅装盘。', e'炸肉片时，表面微焦即可，注意控制火候。
起锅前也可以打个薄薄的水淀粉，口感更佳。
建议使用红薯淀粉。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (99, 0, '荤菜', e'咸
鲜香', '得心应手', '20', '椒盐排条', '椒盐排条是道非常经典的本帮菜，咸、香，也容易制作。', e'大排4块（大约360克）
鸡蛋1个50g
盐1g
椒盐粉10g
葱姜水100ml
面粉80g
淀粉80g
吉士粉2 - 3g（增色增香，没有可以不放）
水10g
油10g', e'大排洗干净，剔骨，用刀面拍松，切成厚片，再改成粗条。
加入椒盐粉，搅匀，待到出胶质了分次加入葱姜水，放入冰箱腌制20分钟。
制作炸糊。放入80g面粉，20g淀粉（注意是20g淀粉，剩下60g备用），2 - 3g吉士粉，盐1g。
打入一个鸡蛋，搅拌，再分次加入水100g，再加10g油，反复搅拌。直到炸糊完全调开，略粘稠即可。
取出剩余的60g淀粉，取出排条，裹上一层淀粉，再裹上面糊。
锅中加入油，能没过食材即可，加热到大约150℃ - 160℃。下入排条炸成浅金黄色后捞出。刚下入排条时可能会有粘连，不要动。待排条定型后可用筷子翻动，即可分开。
待油温再次升高到150℃ - 160℃时，下入排条复炸至金黄色后捞出。
撒上椒盐粉，搅拌均匀后出锅。', e'也可以用面包糠代替炸糊，但口感差距很大。
炸糊也可以用来炸鸡腿、炸鱼等。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (100, 0, '荤菜', '辛辣', '大展身手', '45', '香辣鸡爪煲', '香辣鸡爪煲口感Q弹，香辣浓郁，回味无穷。', e'一斤鸡爪
葱2根
姜10g
料酒
香叶3片
八角3个
生抽
老抽
蒜10g
小米椒6个
辣椒面（可选）
蚝油3g
五香粉
盐
鸡精', e'给鸡爪剪去指甲。如果买的鸡爪只有脚掌部分，对半切开即可。 如果是整只鸡爪，需要去骨。清水洗干净。
鸡爪冷水下锅，葱姜料酒焯水，水开，撇去浮沫。
加入香叶、八角、生抽、老抽，盖盖小火慢煮三十分钟。
捞出鸡爪，留一碗鸡汤备用。
起锅烧油，用小火炒香姜末、蒜末、小米椒，能吃辣再放点辣椒面。加入生抽、老抽、蚝油、五香粉、盐，炒出酱香味。
放入鸡爪，放一点盐调味，翻炒一两分钟，再倒入鸡汤，边炒边搅动。
放入鸡精提鲜，撒入葱段搅拌均匀即可出锅。', '注：如果需要加入配菜，请在放入鸡爪之前，底料炒香之后执行。', e'./result2.jpg
./result1.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (107, 0, '荤菜', '鲜香', '小试牛刀', '2', '荷兰豆炒腊肠', '荷兰豆炒腊肠是一道营养丰富，口感清爽，有利于开胃助食，增进食欲的美味菜肴。荷兰豆中富含人体所需的各种营养物质，尤其是含有优质蛋白质，可以提高机体的抗病能力和康复能力。', e'荷兰豆大约50个
腊肠约100g
生抽10ml
食用油10ml', e'把荷兰豆去掉蒂，有时间的也可以同时把尾部去掉
买腊肠之前可以问老板是生的还是熟的，如果是生的，需要提前蒸一下，如果是熟的可以直接使用
把荷兰豆清洗一下，然后焯一下水，大概45s，荷兰豆焯至变色即可，捞出过凉水备用
热锅，锅内放入大约10ml食用油。等待10秒让油温升高
放入腊肠，保持翻炒至腊肠微微卷边，注意这里一定要保持小火，小到不能小的那种，不然容易糊
放入荷兰豆，转为中大火，翻炒30s放入生抽，接着再翻炒20 - 30s即可', e'在制作过程中没有放盐，是因为腊肠本身会有一些味道，同时生抽也会有一些咸味。
腊肠虽然味道不错，但属于不太健康的食物，建议少放。', e'./1.png
./2.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (101, 0, '荤菜', e'辛辣
鲜', '小试牛刀', '10', '麻婆豆腐', '这是参考麻婆豆腐创作的一道菜。富含有铁、钙、磷、镁等人体必需的多种微量元素，最重要的是非常下饭。', e'内脂豆腐1盒
咸鸭蛋1枚
五花肉20 - 30g
大蒜2瓣
生姜2片
小米辣5根
香辣酱5g
花椒20颗
食盐3g
酱油10g', e'大蒜和生姜切碎备用；小米辣切成辣椒圈备用；五花肉切成肉糜（买的肉糜则跳过此步），肉糜中加入一半食盐和味极鲜酱油搅拌均匀备用；鸭蛋用菜刀竖着对半切开，去除蛋黄，将蛋白捣碎成约2mm*2mm大小备用；打开豆腐包装，用水果刀将豆腐划成约2.5cm*3cm大小备用。
热锅，锅内放10ml - 15ml食用油，等待10秒让油温升高，调成小火，放入大蒜、生姜、辣椒圈、花椒、咸鸭蛋、蒜蓉辣酱翻炒20秒炒出香味。
调成中火，放入肉糜，翻炒大约1分钟至肉变色。
调成小火，放入豆腐，将剩下的食盐、味极鲜酱油均匀洒在豆腐上，从锅边倒入开水没过豆腐。
开大火，水沸腾后立马转入中火，等待大约10分钟。
等到水只剩1/5并且豆腐表面已入色，关火，盛盘。', e'期间一定要主要观察，防止糊锅。
使用水果刀划豆腐时要小心操作。
切鸭蛋去蛋黄时注意安全。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (102, 0, '荤菜', e'鲜
辛辣', '得心应手', '10', '尖椒炒牛肉', '尖椒炒牛肉是一道常见且美味的菜肴，以牛肉和尖椒为主料，通过合理的配菜处理、牛肉预处理和炒制步骤制作而成。腌制牛肉时加入小苏打可使其变嫩，姜片也可用料酒代替。', e'牛肉（按250g/人准备）
葱（按0.5根/人准备）
姜（按1个/人准备，腌制可用料酒3g/人代替）
蒜
尖椒
酱油（按9ml/人准备）
盐（按3g/人准备）
糖（按1.5g/人准备）
小苏打（500g牛肉用3g）', e'蒜剁成蒜泥，葱切段，姜切成姜片，尖椒切成段。
牛肉放入碗中，加姜、盐、酱油、糖进行腌制30 - 40分钟，腌制完姜可以去掉，也可用料酒代替姜片，同时可加入小苏打使牛肉变嫩（500g牛肉用3g小苏打）。
冷油下锅，待油变热至偶有气泡，加入蒜泥。
蒜泥变金黄后加入尖椒。
待尖椒表皮微皱，加入腌制好的牛肉翻炒。
翻炒变熟之前加入葱，继续翻炒。
翻炒至牛肉变熟，关火出锅。', e'腌制牛肉时加入小苏打能有效使牛肉变嫩，但要注意控制用量。
腌制时姜片可用料酒代替，增添风味。
炒制过程中注意火候和翻炒时机，确保牛肉熟透且尖椒口感适宜。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (103, 0, '汤与粥', '鲜', '得心应手', '90', '陈皮排骨汤', '新鲜的排骨搭配广东陈皮煲出来的汤非常养生，对脾胃、肺及咽喉都有一定的滋补功效，适合熬夜党。', e'排骨4 - 5块
陈皮1瓣
西洋参9片
石斛6颗
玉竹5片
麦冬7个
食盐5g', e'排骨用热水过一边，去血水
陈皮、麦冬、玉竹、石斛和西洋参，冲洗干净
煲汤盅洗干净
打开煲汤盅，先放入排骨在底部，然后依次放入陈皮、麦冬、玉竹、石斛和西洋参
加入热水进煲汤盅，水不宜太满
煲汤容器加入水，炖煮1.5小时
加入食盐，趁热饮用', e'煲汤盅很烫，拿的时候小心别烫到或者手滑摔破
广东老火靓汤，讲究用料和火候，备好料和炖够一定时辰很重要', './陈皮排骨汤.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (104, 0, '荤菜', '甜', '得心应手', '20', '可乐鸡翅', '可乐鸡翅是一道深受大众喜爱的美食，以鸡翅和可乐为主要原料，通过独特的烹饪方法制作而成。其味道香甜可口，鸡翅鲜嫩多汁。', e'鸡翅中10 - 12只
可乐500ml
白糖10克
生抽15克
老抽3克
盐2克
生姜2片
料酒20毫升
小葱挽成结', e'鸡翅入锅，倒入冷水淹没，放1片生姜和10 - 20毫升料酒，大火煮开约2分钟后，撇去浮沫，沥出水分（冰鲜鸡翅操作，刚买的鸡翅直接改刀用生抽腌制）；
捞出鸡翅，用刀在两边各划两口改刀，用10克生抽腌制10分钟；
锅小火起油，放入剩余姜片爆香，下入腌好的鸡翅，煎至金黄翻面，用炒菜勺子翻动鸡翅与姜片翻炒4 - 5下；
鸡翅金黄后，倒入可乐没过鸡翅，大火煮沸，撇去黑色浮沫，加入葱结；
加入2克盐、10克白糖、3克生抽调味（可加3克老抽调底色）；
葱结变黄后，和姜片一起捞出，转中火慢煮；
等到可乐呈现挂丝状态，关小火让汁挂在鸡翅上，出锅装盘。', e'加入生姜爆香可防止鸡翅粘锅；
最后收汁时勿开过大火，防止味道偏苦。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (105, 0, '荤菜', e'甜
酸', '大展身手', '21', '糖醋排骨', '糖醋排骨是糖醋味型中具有代表性的一道大众喜爱的特色传统名菜', e'排骨 300g
白砂糖 20g
食用油 350ml
生抽 5ml
蚝油 5ml
老抽 5ml
鸡精 2g
姜片 2 片
芝麻 2g
番茄酱 10g
香醋 5ml
五香粉 2g', e'排骨+姜片冷水下锅，煮开后用勺子舀去白色油沫，2 - 3 分钟后出锅。
冷水清洗排骨，清洗 2 - 3 遍。
锅中加入 300ml 食用油，油开后倒入排骨，煎炸 3 - 5 分钟后出锅。
小火起锅，加入 50ml 食用油，加入白砂糖 30g ，轻轻搅拌到糖水变成黄色。
倒入排骨翻炒 30S 后，加入香醋、生抽、蚝油、鸡精、番茄酱、五香粉 翻炒 30S 后，加入清水没过排骨。
中火煮 20 分钟，加入老抽上色，开锅烧汁。
起锅摆盘，散上芝麻。', e'步骤三油炸排骨时，可以根据实际情况选择加入淀粉包裹排骨。
步骤六可以加少量水淀粉，但汤汁的自勾芡已经足够定性排骨。
烧汁过程中，可以根据汤汁酸甜度选择再加 3 - 5g 白砂糖、2 - 5ml 香醋。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (106, 0, '荤菜', '鲜香', '得心应手', '32', '白菜猪肉炖粉条', '这是一道传统的东北家常菜，做法简单、味道上乘，备受东北人民喜爱。', e'五花肉300g
大白菜500g
土豆干粉条50g
十三香10g
鸡精5g
食用盐15g
老抽5ml
生抽5ml', e'锅内烧水，水开后放入干粉条，煮5分钟后同水一起倒出容器中，盖上盖子继续浸泡备用。
五花肉切3mm的肉片，备用。
大白菜嫩叶与白菜帮子分开切成2份菜片，备用。
热锅，锅内放入10ml - 15ml食用油。等待10秒让油温升高。
放入五花肉，保持翻炒至肉变色。
加入老抽，炒1分钟，给肉上色。
加入白菜帮子，加入食用盐、生抽，炒一分钟（如果粘锅，烹入10ml水）。
加水没过所有食材，加入鸡精 ，十三香，沸腾后，将火调小然后等待20分钟。
粉条滤水切成小段放入碗中备用。
加入白菜嫩叶，炒匀后将粉条放在菜上方，加盖再煮5分钟。
尝味、关火，收汁。', e'土豆干粉条煮制时间长，可以放在第一步，期间进行其他步骤。
最后一步尝味，如果发现有味道淡、未熟，继续加盖煮一段时间。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (108, 0, '素菜', '辛辣', '小试牛刀', '11', '素炒豆角', '一道巨下饭的家常菜', e'豆角250g
小米椒2个
葱3圈
蒜2颗
生抽6ml
老抽2ml
蚝油6ml
盐6g', e'葱切花，蒜切沫，备用。
生抽、老抽、蚝油、盐混合调料汁，备用。
小米椒切圈，备用。
豆角去筋，45°斜切4 - 10cm小段，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱、小米椒，翻炒至闻到香味。
加入豆角，翻炒30s。
加入料汁，开大火翻炒2分钟。
倒入150ml水。
转中小火，盖上锅盖焖制8 - 10分钟。
加入蒜切沫，出锅。', '切豆角需要一定的刀工，不会的可以使用剪刀。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (110, 0, '荤菜', '醇厚', '得心应手', '72', '土豆炖排骨', '土豆炖排骨是一道受欢迎的家常菜，排骨鲜嫩多汁，土豆软糯入味，汤汁浓郁醇厚，非常下饭。这道菜难度系数简单，对新手友好。', e'肋排750g
土豆300g
姜30g
小葱25g
料酒25g
白糖10g
干辣椒5g
八角5g
花椒5g
桂皮5g
生抽10g
老抽5g
蚝油5g
黄豆酱5g', e'土豆两个滚刀切片，姜片切片。
排骨750g冷水下锅，加入姜片、葱段、料酒焯水2分钟，焯干水后捞出清洗干净（一定要用热水，不能用冷水）。
热锅凉油，将白糖倒入锅中，翻炒至融化为焦糖色。
加入排骨煎至两面金黄，让排骨裹满焦糖。
加入干辣椒、八角、花椒、桂皮、姜片（建议买超市的香料包）、10ml生抽、5ml老抽、5ml料酒、5ml蚝油、5ml黄豆酱。
大火翻炒均匀后加入700ml开水，大火烧开后转小火焖煮1小时。
最后加入土豆煮10分钟就可以出锅啦（喜欢吃青红椒的也可以按自己喜好加入）。', e'焯水后的排骨要用热水清洗，这样能保持肉质的鲜嫩。
炒糖色时要小火慢慢炒，以免炒糊。
焖煮排骨时要加入开水，这样能使排骨更加软烂。
土豆可以根据个人喜好选择是否去皮。
喜欢吃青红椒的可以在最后加入，增加菜品的色彩和口感。', e'./排骨1.jpg
./排骨2.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (111, 0, '素菜', '鲜', '小试牛刀', '4', '洋葱炒鸡蛋', '洋葱炒鸡蛋是中国日常生活中熟知的菜品', e'鸡蛋2个
洋葱50g
食用油50ml
盐2g
葱半根
料酒2ml', e'鸡蛋打入大碗中，加入洋葱片、盐后搅拌60S
起锅烧油，倒入鸡蛋，一面煎炸30 - 45S，翻面继续翻炒，反复2 - 3分钟后散上料酒出锅
鸡蛋装盘，散上葱花', '无', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (112, 0, '荤菜', '醇厚', '大展身手', '65', '萝卜炖羊排', '萝卜炖羊排是一道常见家常菜，老少皆宜，制作过程虽较复杂但味道醇厚鲜美。', e'羊排400g
白萝卜一根
大葱一根
花椒10粒
姜10g
料酒或者黄酒30ml - 40ml
食用盐10g
冰糖2 - 4粒
水1000ml', e'萝卜去皮、滚刀切成3 - 5cm的大块，备用。
羊排在购买时让卖家切好，备用。
羊肉冷水下锅，加入一半的料酒，一半的葱姜，煮10分钟去掉血腥，可把焯的过程中出现的血沫子用勺子盛出来。
另起一锅冷水，放入切好的白萝卜，放入一半的冰糖，等水开后煮5分钟去掉白萝卜的辣味。
盛出来焯好的羊排，放入高压锅中，加水没过所有食材后再增加大约300ml的水。
将剩余的葱姜料酒，花椒，冰糖，白芷（可选），盐放入锅中，盖锅等待上汽后计时，中火炖大约15分钟。如没有高压锅，则放入普通锅中，炖大约40分钟到1小时。
关火，等待高压锅放气完毕，开盖，加入之前焯好的萝卜，调味，加入3 - 10g的食盐或者水，品尝汤的咸淡。
再开火，中火，高压锅上汽再炖10分钟，普通锅盖盖再炖20分钟。
关火，盛盘。', e'操作时，需要注意观察沸腾的水位线，如发现低于2/3的食材应加热水至没过食材。
羊排在购买时让卖家切好，因为家用刀一般难以切动。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (113, 0, '酱料', e'辛辣
鲜香', '轻松上手', '5', '炸串酱料', '号称淋袜子都好吃的炸串酱料，新手友好', e'干辣椒面 60 克
孜然粉 20 克
胡椒粉 10 克
五香粉 15 克
食盐 20 克
花椒粉 15 克
鸡精 8 克
十三香 5 克
麻辣鲜 5 克
白芝麻 30 克
香油 10ml
生抽 10ml
花椒油 10ml
蚝油 10ml', e'将所有原料在容器内混合，搅拌均匀。
锅里烧热油，油的用量以在容器内没过所有原材料为佳。
分三次淋入热油，每次 1/3，同时搅拌。
最后放入香油 10ml，生抽 10ml，花椒油 10ml，蚝油 10ml。', e'最后一步的调味可按自己喜好添加。
不得一次性倒入所有热油，必须分次倒入并搅拌。
原料可按比例缩减。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (114, 0, '酱料', '甜', '大展身手', '20', '糖色的做法', '介绍了糖色的做法，包括必备原料、工具、计算、操作步骤以及附加内容等，还提到了不同糖的选择及炒糖色时的火候注意事项等。', e'油100ml
开水500ml
冰糖（或白砂糖、绵白糖）', e'1. 开火，并向锅中倒入100ml开水。
2. 再向锅中倒入100ml油，与第一步间隔越短越好，此时锅为大火中火都可以，着急的话可以大火。
3. 放入冰糖（如果冰糖过于耦合，可以提前敲碎，做到耦合度越低越好）。
4. 调整火力为中火。
5. 开始搅拌，要一直一直一直搅拌，变成棕褐色，此时转为小火。
6. 再变稀，变红茶色，再变成酱红色后起小泡泡，准备好执行下面的操作1或操作2。
7. 小泡泡会逐渐消失，之后会出现大泡泡，大泡泡出现时糖色完成，需要在此时快速进行下一步操作（无论哪种操作都一定要提前准备好并快速！否则火候过大糖色发苦），根据菜品派别以及个人口味作出选择：操作1：可以直接加400ml开水降温；操作2：也可以加入葱姜蒜花椒等调味品进行翻炒。', e'1. 炒糖色过程火不要太大！电磁炉温度不够，火候过了发苦，不够发甜。
2. 对于使用剩余的食用油，可以考虑重新收集到油壶。
3. 如果冰糖过于耦合，可以提前敲碎，做到耦合度越低越好。
4. 无论哪种操作都一定要提前准备好并快速！否则火候过大糖色发苦。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (115, 0, '荤菜', '鲜', '大展身手', '93', '猪皮冻', '猪皮冻是一道简单易做的菜，是北方人年夜饭餐桌上的“常青树”，有着晶莹剔透的外表和滑嫩Q弹的口感，是不折不扣的超级下酒菜，且猪皮具有美容养颜的功效。', e'猪皮1kg
水4kg
盐13g
味精10g
鸡精15g
生抽50ml
老抽20ml
葱10g
姜片20g
八角10g
花椒5g
白醋20g
料酒50ml', e'将猪皮剁成不超过10cm小块，用清水浸泡12小时，然后冷水下锅，加入10g姜、50ml料酒后，汆烫5 - 10分钟，捞出放入冷水中。
将焯过水的猪皮放到案板上，剔除里面的白肉部分，再切成不超过3mm的长条，放入盆中。
加入20g白醋、5g盐，用力搓洗3分钟，再用清水洗净。
锅内加入4kg水，放入猪皮、10g葱、10g姜片、10g八角、5g花椒，大火烧开后，小火煲煮90分钟至猪皮软烂。
加入8g盐、10g味精、15g鸡精、50ml生抽、20ml老抽调味后，倒入盘中，拣出葱姜、八角，晾凉至果冻状。
放冰箱冷藏，食用时切成小块或者厚片。', e'操作时，做猪皮冻直接下锅煮是最忌讳的，一定要用白醋和盐不断搓洗猪皮，这样能保证煮好的猪皮晶莹剔透且没有腥味。
对于使用剩余的食用油，可以考虑重新收集到油壶。', './猪皮冻.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (146, 0, '主食', e'咸
甜', '得心应手', '8', '肉蛋盖饭', '肉蛋盖饭适合单人简易晚餐，制作过程相对简单，能快速为您提供一顿美味的餐食。', e'米饭240g
鸡蛋4个
肉馅300g
老抽10ml
生抽25ml
醋20ml
红葱油（可选）10g
葱10g
油30ml
糖15g（可根据口味增加至25g）', e'煮好米饭，通常使用买米赠送的量杯，一杯米240g。
锅中放油30ml。
放入肉馅，调中火煎至两面微焦。
将鸡蛋打入锅中，不要打散，盖上锅盖。
调一个碗汁，碗中放入计算中的对应数量的老抽，生抽，醋，糖，红葱油，搅拌均匀。
打开锅盖，将碗汁倒入锅中，等待三分钟。
关火，将肉蛋盖到米饭上。
安全检查，开始食用盖饭。', e'如果喜欢甜口可以增加10g糖。
请务必保证做完饭后关掉燃气设备以免发生危险。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (116, 0, '荤菜', e'甜
酸', '大展身手', '11', '咕噜肉', '咕噜肉是非常下饭的菜肴，大人小孩都爱吃。这次做的是简易版菠萝咕噜肉，利用简单材料在家就能做出特有风味。', e'梅头猪肉100g
青椒25g
罐头菠萝片75g
盐1/4茶匙
茄汁4汤匙
白醋2茶匙
蒜蓉1汤匙
生抽1/2茶匙
生粉2 1/2茶匙
白砂糖2汤匙
水200毫升', e'1. 将梅头猪肉洗净，用厨房纸抹干水分，切成比成品小一圈的大小。
2. 用1/2茶匙盐腌制梅头猪肉20分钟。
3. 将菠萝片切件。
4. 在碗中加入茄汁、白醋、蒜蓉、生抽、生粉、白砂糖、盐和水，拌匀成酱汁。
5. 将梅头猪肉粒沾上6汤匙生粉。
6. 加入500毫升油中火加热。
7. 将梅头猪肉粒放至锅里中火炸5分钟，然后盛起。
8. 加入梅头猪肉粒，再大火翻炸1分钟。
9. 加入1茶匙油和酱汁，中火加热3分钟。
10. 加入青椒和菠萝，大火加热2分钟。
11. 将已炸好的梅头猪肉粒与酱汁拌匀即可。', e'想让肉更有层次可以在生粉中加鸡蛋，炸出来会更香脆。
注意控制油温，避免炸糊。
搅拌酱汁时要充分混合，确保味道均匀。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (117, 0, '水产', '鲜', '得心应手', '6.5', '清蒸生蚝', '清蒸生蚝是一道制作简单且能保留生蚝鲜美滋味的美食。通过特定的蒸制步骤，搭配葱姜蒜和酱油，能呈现出原汁原味的鲜嫩口感。', e'生蚝6个
葱3颗
蒜6瓣
姜1小块
酱油30ml', e'将生蚝用刷子刷干净。
蒸锅中放水，放上蒸屉，把6个生蚝平铺在蒸屉，使用50%功率蒸3分钟。
用右手拿着湿抹布掀开烫锅盖，将每个生蚝的外壳掀开一半去掉，生蚝凸面向下，平面向上，每个放1根姜丝、10g蒜末。
关上烫锅盖，100%功率蒸3.5分钟。
停火，用右手拿着抹布掀开烫锅盖，每个放5ml酱油。
盛盘。', e'刷生蚝时要确保每个部位都清洁干净。
蒸制过程中注意控制好功率和时间，避免蒸过头导致生蚝口感变老。
打开锅盖和放调料时要小心蒸汽烫伤。', '', '6', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (118, 0, '水产', e'鲜
辛辣', '小试牛刀', '10', '芥末黄油罗氏虾', '这是一道做法简单，味道美味，具有新意的海鲜菜。', e'罗氏虾 1 斤多
黄油 约 20g
芥末 15g
白糖 3g
生抽 30g
蚝油 30g
盐 3g
料酒、朗姆酒或啤酒 15g 到 30g
香菜 5 条
蒜 5 颗', e'1. 将罗氏虾剪掉头尾尖刺、触须和脚，剪刀把虾身开背，去除虾线。
2. 提前搅拌好芥末酱汁：酱油、蚝油、芥末、盐、糖，搅拌均匀！
3. 洗好香菜，切段备用。
4. 罗氏虾沥掉水，锅中加入油，直接放入罗氏虾，中火，外表煎至金黄，捞出。
5. 下入蒜蓉，大火，利用煎虾剩下的油继续煎炒蒜蓉，等到锅中白雾冒出，蒜蓉已经煎出香味，下虾和黄油，让虾充分吸收黄油香味
6. 下入调好的酱汁，继续大火煮沸，翻炒虾，至酱汁收汁，加入酒（料酒、啤酒可以放 30g，朗姆酒味道浓郁放 15g 即可。）
7. 在等酱汁稍微收汁，加入香菜翻炒两下，即可出锅。', e'1. 酱汁提前调配好，黄油提前备好，防止中间备料耗时。
2. 蒜蓉切记要等虾煎好后捞出再下，防止煎炒过久变黑，发苦。
3. 如果不太能接受芥末就放少点，能接受就放多点，如果放多了，煮久一会儿，芥末味也会散去。', './芥末黄油罗氏虾.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (119, 0, '素菜', '甜', '小试牛刀', '6', '拔丝土豆', '拔丝土豆是一道色香味俱全的特色名菜，属于鲁菜系', e'土豆2个
食用油300ml
淀粉30g
白砂糖120g
水100ml
芝麻5g', e'土豆去皮，切均匀的小块。放入淀粉（不加水）搅拌，使得淀粉覆盖土豆表面。
起锅烧油，放入土豆块，缓缓翻滚煎炸5 - 7分钟 ，直至筷子可以插进土豆。
取出土豆，放入大碗备用。
锅中加入水、白砂糖，沿着一个方向慢慢搅动白砂糖，直到白砂糖颜色变成褐色。
重新倒入土豆，翻炒30S后出锅。
土豆盛盘，散上芝麻。', e'土豆煎炸不可太熟透，否则在拔丝端盘时不容易定型，影响美观。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (120, 0, '荤菜', '鲜香', '得心应手', '7', '黑椒牛柳', '黑椒牛柳是一道简单易做的菜，蔬菜与肉类均衡，富含蛋白质，口味适合大多数人。', e'牛肉（牛里脊肉或者牛排肉）
洋葱
菜椒（红/黄椒）
淀粉
黑胡椒（粉）
黑椒（腌料）
盐
花生油', e'将牛肉切条，长度最好控制在8厘米以下，厚度约5 - 10毫米，宽度约1厘米。
利用腌料腌制牛肉，混合均匀后静置，用量与时间请参照商品说明，可以延长不能缩短。
若使用液态腌料，在腌制结束前三分钟撒一层黑胡椒粉，然后加入淀粉，再次混合均匀后静置20分钟。
开火，热锅，加入花生油。
当油冒出一丝烟时，放入牛肉，翻炒。
开中火偏大，翻炒2分钟至牛肉外表变色。
放入洋葱和菜椒，翻炒2分钟。
加入盐，再次撒一份黑胡椒粉，翻炒30秒，搅拌均匀。
观察洋葱已经变软即可关火，出锅，盛盘。', e'粉与腌料可相互替代，具体用量请参照购买的食品包装上的说明。
油量依据菜量变动，如对牛肉的量有增减请按对应比例变动。
腌制牛肉的时间可延长不能缩短。
使用液态腌料时，注意在腌制结束前三分钟撒黑胡椒粉和淀粉的操作。
炒牛肉时注意防止油滴溅射。', './黑椒牛柳.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (121, 0, '素菜', '鲜香', '得心应手', '13', '红烧冬瓜', '红烧冬瓜是一道具有色泽红亮，香鲜味美、营养价值丰富的家常菜', e'冬瓜 300g
食用油 50ml
料酒 2ml
淀粉 10g
生抽 10ml
老抽 15ml
鸡精 3g
香葱 0.5 根
姜末 1 粒
蚝油 15ml', e'冬瓜去皮，切边长不超过 2cm 小块。
起锅烧油，放入冬瓜，缓缓翻滚煎炸 2 分钟 ，直至冬瓜表面泛金黄色。
取出冬瓜，放入大碗备用。
利用锅中的剩余油，依次放入姜末、生抽、蚝油，翻炒 15S。
重新倒入冬瓜，翻炒 30S 后，加入开水，水要没过冬瓜表面，大火煮 10 分钟。
加入老抽上色，继续煮，直至冬瓜软糯（筷子可以轻松插近冬瓜）。
加入鸡精、料酒、香葱翻炒后 30S，取出冬瓜到大碗中。
锅中剩余汤汁保留，倒入水淀粉，煮开后汤汁浇灌在冬瓜表面。', '', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (122, 0, '荤菜', '醇厚', '得心应手', '30', '奶酪培根通心粉', '这是一道美味的奶酪培根通心粉，适合四人享用。它结合了浓郁的奶酪和香脆的培根，简单易做，是一道受欢迎的美式家常菜。', e'通心粉100 - 125g
奶酪40 - 55g（若烘烤额外准备25g条状）
培根或其他肉类100 - 125g
洋葱25g - 40g切成碎
黄油15g
面粉10g
牛奶125ml
大蒜半瓣切碎', e'奶酪磨成碎末，洋葱切成条状，通心粉用微咸的水煮6分钟；
中火，锅中放入黄油融化，加入洋葱；
洋葱软化后加入大蒜；
大蒜香味出来后，加入肉类，等待5秒；
小火，分四次加入牛奶，每次搅拌5秒后再加下一次；
加入面粉并充分搅拌；
加入奶酪并搅拌均匀；
将通心粉和奶酪搅拌；
若不打算烘烤，可直接食用；
烘烤：预热烤箱至180°C，将额外的50g芝士铺在通心粉之上，等待烤箱预热至180°C后，将通心粉放入，烤至表面金黄，约24分钟。', '制作前需确定计划份数，一份够2个人吃；本料理热量和脂肪含量高，不建议常吃。', e'./oven.jpg
./onepot.png', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (123, 0, '酱料', '辛辣', '得心应手', '12', '油泼辣子', '油泼辣子是一道具有浓郁香辣风味的酱料，制作过程相对简单，能为各种菜肴增添独特的味道。', e'蒜头1个
干辣椒面100克
盐5克
熟白芝麻15克
小米椒1个
花生油150毫升（可用菜籽油替换）
五香粉10克（可选）
草寇1个（可选）
小葱3 - 5根（可选）
八角1个
花椒20 - 50粒
香叶2 - 3片
白芷2 - 3片
姜片（大拇指粗细的姜切片）（可选）
糖30克
白醋5ml', '拿出蒜头掰2个小蒜头去皮，剁碎小蒜头、小米椒；拿出碗倒入花生油，油热放入其他配料和小葱，等到香料变焦，捞出扔掉；拿出铁锅将碗内的油放入加热2分钟（菜籽油烧至冒烟）；往空碗加入干辣椒面、白芝麻、蒜末、小米椒、盐、五香粉、草寇作为“调料”；关火将油温冷却至210摄氏度；将锅内热油倒入碗内并用勺子搅拌即可（可以在165摄氏度时加入同样“调料”的碗最后进行混合进行增辣）；倒入热油稍微搅拌后放入白醋，此时会重新沸腾，继续进行搅拌，白醋增香；油泼辣子冷却到温热放白糖和味精，白糖可以是辣味柔和，不会那么的呛口。', e'制作过程中注意控制油温，避免过热导致香料焦糊影响口感。
加入白醋后搅拌要充分，以达到增香的效果。
对于不喜欢太呛口辣味的人，可适当增加白糖的用量来中和辣味。', e'./口水鸡+油泼辣子.jpg
./油泼辣子.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (124, 0, '荤菜', '鲜香', '得心应手', '8', '香干肉丝', '香干肉丝是一道美味可口的家常菜，猪里脊的鲜嫩与香干的醇厚相得益彰，搭配青椒的清爽，色香味俱全。', e'猪里脊（每份100g）
香干（每份75g）
盐（每份3g）
生抽（每份5ml）
淀粉（每份5g）
大蒜（每份约5g，3个蒜瓣）
青椒（每份5个）
鸡精（2g）
水（10ml）
油（15ml）', e'肉丝用生抽(3ml)，生粉混合均匀待用。
青椒洗净，用滚刀手法切好备用。
大蒜横切成片，香干切丝。
淀粉与水(10ml)混合，搅拌均匀。
干净锅倒入15ml油，倒入肉丝慢慢划散，肉丝熟后捞出，留油在锅里。
将蒜片和香干放入锅中，加入2ml生抽，翻炒均匀。
2 - 3分钟后，放入青椒丝混合翻炒。
1分钟后，放入肉丝混合。
倒入淀粉与水的混合物勾芡，加入盐3g，鸡精2g，翻炒2 - 3分钟出锅。', e'不同锅具和灶台会影响翻炒时间，不确定是否熟了可以试吃。
辣椒选择青椒，螺丝椒为最优解，喜欢辣的可以加入小米椒切细碎，同青椒一起加入。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (125, 0, '荤菜', e'咸
辛辣
鲜香', '大展身手', '25', '湘祁米夫鸭', '湖南两祁地区特色菜品，逢年过节家家桌上有。鸭肉被米粉子包裹，入口咸香回味悠长可解乡愁。', e'鸭子1000g
糯米粉100g
粘米粉300g
蒸肉粉50g
细辣椒粉50g
白胡椒粉5g
五花肉50g
姜蒜20g
盐10g
食用油10g
开水100g', e'将糯米粉、粘米粉、蒸肉粉、细辣椒粉、5克盐、白胡椒粉倒一起搅匀
鸭子让热心摊主剁成蒸煮块，姜切片，蒜子剥皮，五花肉切片
热锅凉油煸炒五花肉出油，再加食用油烧热，下入鸭子煸炒
鸭子煸炒到表皮焦变色，下入姜蒜和盐继续煸炒香味
关小火倒入米粉翻炒，鸭肉均匀裹满米粉子，加入开水，少量多次的加，边加边翻炒
翻炒鸭肉和米粉有湿感，铲出入碗中，高压锅放水蒸20 - 25分钟
出锅前撒点葱花即可享用了', e'鸭子必须新鲜现杀
蒸20分钟，是老鸭的话，蒸一个小时以上
第一步中粘米粉是主要的粉子，糯米粉是加软糯口感，蒸肉粉是加五香味道，辣椒粉和胡椒粉是加复合香味', e'湘祁米夫鸭.jpg
step①：准备米粉.jpg
step②：煸炒鸭子.jpg
step③：米粉裹鸭.jpg
step④：高压锅蒸煮.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (126, 0, '荤菜', '鲜香', '大展身手', '34', '乡村啤酒鸭', '将鸭肉与啤酒一同炖煮成菜，使滋补的鸭肉味道更加浓厚，鸭肉不仅入口鲜香，还带有一股啤酒清香。', e'鸭肉半只（1kg）
啤酒1000ml
青椒2条
红椒1条
大蒜4颗
生姜3厘米长
小米辣3颗
蒜苗2根
大葱2根
草果两颗
桂皮4厘米一小片
八角3颗
香叶3片
干辣椒6条
花生油60ml
花椒30颗
料酒20ml
盐3克
生抽10ml
老抽5ml', e'鸭肉清洗后放入锅中，加清水淹没，加入20ml料酒、1根大葱、拍散的2厘米生姜，烧滚后捞出浮沫，捞出鸭肉用清水洗净备用；
锅洗净烧热，加入60ml花生油，油温到60度时加入30颗花椒，再加入鸭肉翻炒4分钟，2分钟后加入所有香料，3分钟时加入生姜、大蒜、小米辣；
加入1000ml啤酒，烧鸭肉30分钟，10分钟时加入3克盐、10ml生抽、5ml老抽，20分钟加入青椒和红椒段，29分钟加入蒜苗段和大葱段，翻炒1分钟后出锅。', e'操作时，需要注意观察沸腾的水位线，如发现低于2/3的食材应加热水或者加啤酒。
锅要选择32厘米以上的炒锅。', e'https://jphuang-image.oss-cn-beijing.aliyuncs.com/beer/duck/%E6%88%90%E5%93%812.jpg
https://jphuang-image.oss-cn-beijing.aliyuncs.com/beer/duck/%E5%A4%87%E6%96%99.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (127, 0, '荤菜', '鲜香', '得心应手', '13', '小炒鸡肝', '小炒鸡肝适合喜欢吃肝的人，需一定焯水技巧，是一道色香味俱全的佳肴。', e'生鸡肝5个（约800g）
蒜苗（约200g）
大葱150g（100g切段，50g切片）
姜120g（70g切片，50g切丁）
料酒30ml
食用盐5g
鸡精5g（或味精）
五香粉5g（十三香）
胡椒粉5g
烧烤料或孜然粉10g（可选）
芝麻5g（可选）
食用油30ml', e'鸡肝清洗，备用；蒜苗清洗，切段，备用；大葱清洗，100g切段，50g切片，备用；姜清洗，70g切片，50g切丁，备用。
焯水：清洗后的鸡肝放入锅内，加凉水淹没，放入100g切段大葱、70g切片姜和30ml料酒，开大火，水沸调中火撇浮沫后等待5 - 10分钟，关火，捞出过凉水并洗净，切片备用。
炒制：开中火，锅内加30ml食用油，升温10秒，加入50g切片大葱和50g切丁姜，翻炒爆香，加入鸡肝片翻炒至微微发黄，加入蒜苗翻炒30秒，断生后调小火，加入食用盐5g、鸡精（味精）5g、五香粉（十三香）5g、胡椒粉5g、烧烤料或孜然粉10g（可选），调大火快速翻炒30秒，关火，盛出，可撒5g芝麻装饰（可不加）。', '焯水时注意观察水位，防溢出。焯完水的鸡肝用凉水冲洗，更推荐冰水，可让口感更好。对于使用剩余的食用油，可以考虑重新收集到油壶。', './成品.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (147, 0, '荤菜', e'甜
醇厚', '轻松上手', '210', '台式卤肉饭', '糖和脂肪是人类快乐的源泉，富含这二者的台式卤肉饭每一口都能带来直击灵魂的满足感。本文提供一种操作简单但风味不减的台式卤肉饭做法。', e'原味可乐250ml
红葱酥5g
洋葱1/4个
带皮五花肉500g
生抽酱油25ml
蚝油5ml
条状腐竹5根
鸡蛋4个
西兰花300g
食用油10 - 15ml
啤酒100ml
料酒5ml
十三香粉10g
香菇3个
米饭（根据个人食量决定）', e'可乐开盖放气；带皮五花肉切成0.7cm（长）×0.7cm（宽）×2.5cm（高）的细长条；洋葱切成小块备用；香菇切丁备用；腐竹切段备用；鸡蛋煮熟剥壳，并用刀划破蛋白，备用。
大火热锅，锅内放入10ml - 15ml食用油，让油滑满锅底，等待5s使油温稍微升高。放入五花肉条，翻炒至肉色稍微变白，沿锅边淋入料酒5ml，继续翻炒至五花肉不再出油，将半熟的五花肉控油盛出备用，不要洗锅。
将切好的洋葱块和香菇丁下入锅中，翻炒1分钟爆出香味。
将五花肉再放入锅中，继续翻炒1分钟至炒匀。
加入啤酒至所有肉条1/3处，继续翻炒2分钟至酒味散尽。
加入原味可乐至刚好淹没所有肉条，加入生抽25ml，蚝油5ml，红葱酥5g，十三香粉10g，搅拌均匀。
煮开后，转中火，加入腐竹段，煮熟的鸡蛋，搅拌均匀，加盖炖煮。
中火炖煮30分钟后，转小火，继续加盖炖煮3小时，小火炖煮过程中，每隔30分钟搅拌检查一次，防止粘锅，如发现过干，则可加入100ml清水继续炖煮。
炖煮结束后，乘一碗米饭，将软烂的卤肉浇在米饭上，并加上卤蛋和西兰花，开始享用。', e'五花肉切条技巧：若五花肉是未冷冻的，可以放入冰箱冷冻室30分钟再取出切条；若是冷冻五花肉，可以在常温下放置30分钟后再切条；切条时可以较小的力度将刀刃与肉快速摩擦，如此更易于切割并保护五花肉肥瘦相间的结构。
可乐在此处的作用仅仅是上色和提供甜味，并不是主要味道来源，请勿加入过量可乐，否则成品会偏甜。
啤酒可以使肉带上麦香味并解腻。', e'./1.jpg
./3.jpg
./2.jpg
./4.jpg', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (128, 0, '荤菜', '鲜香', '得心应手', '4', '香菇滑鸡', '香菇滑鸡是一道美味的菜肴，将鲜嫩的鸡腿肉与香菇搭配，经过精心烹制，鸡肉滑嫩，香菇鲜香，味道浓郁。', e'大鸡腿2个
干香菇5粒
姜2片
葱2颗
蒜2瓣
温水(30 - 40℃)150ml
料酒15ml
生抽30ml
盐1.5g
老抽15ml
糖15ml
香油5ml', e'温水泡发干香菇。
姜切小块，葱切段，蒜对半切小粒。
鸡腿去骨（不去骨也可），切成小块。
泡发的香菇一分为四，香菇水留着备用。
鸡腿肉焯水1分钟，去除血沫和杂质。
鸡腿肉中加料酒15ml、生抽15ml、盐1.5g、老抽15ml，抓匀。
油温3成，下入鸡腿肉煸炒，等鸡腿肉金黄后盛出备用。
锅留底油，下入葱、姜、蒜炒香，香菇入锅，大火翻匀。
等待20秒会有香菇香味从锅中飘出，此时下入煸炒过的鸡腿肉，下入香菇水（全部）、糖15ml、生抽30ml。
转中火不盖盖，咕嘟2分钟收浓汤汁，淋入香油5ml，撒上葱花后即可关火、装盘。', e'鸡腿去骨操作较复杂，可参考：鸡腿于案板摆正，骨头正对自己，从头部划一刀至最底部，刀口要深，确保有碰到骨头；用手扒拉肉到两边；用刀尖隔开骨头上沾着的肉；鸡腿翻面，刀紧贴骨头插入，挑断骨头与肉的连接点；用刀尖切断最后的粘连即可。
对于使用剩余的食用油，可以考虑重新收集到油壶。', './香菇滑鸡.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (129, 0, '荤菜', '酸甜', '大展身手', '10', '荔枝肉', '荔枝肉独具闽菜特点，味道酸甜可口，是福州地区比较常见的一道菜肴。', e'瘦肉150g
凤梨100g
鸡蛋1个
食用油500ml
白砂糖5g
淀粉100g
生抽5ml
鸡精5g
姜末5g
芝麻2g
番茄酱20g
香醋2ml', e'瘦肉切块（每块2 - 3cm），放入大碗中，加入鸡蛋1个、生粉50g、生抽3ml、鸡精2g，充分搅拌，直至生粉包裹住瘦肉块（太稀则继续加生粉，太干则加水），然后加入5ml油，再充分搅拌后备用。
在准备一个碗，加入番茄酱、鸡精3g、生抽2ml、姜末、白砂糖、生粉10g、香醋、凉水200ml，充分搅拌后备用。
切一个凤梨，准备6个（每个1.5 - 2cm）凤梨块。
起锅烧油，倒入500ml油，一直烧油直到听到油炸声。
将瘦肉一个一个放入锅中（切记不可以整碗倒入），保证每个肉不要粘在一起。
全部放入瘦肉后，每30S用勺子来回两面翻转瘦肉块，直至瘦肉块表面金黄。
取出瘦肉，一分钟后倒入油锅中继续炸，直至瘦肉块表面出现焦黄后，取出放入大碗备用。
起锅，倒入汤汁，30S后倒入瘦肉块、凤梨块，充分翻炒后出锅。
摆上芝麻。', e'更多情况下，福州当地会选用马蹄（解腻）和马铃薯（洗油），因为疫情期间买不到，所以选用了凤梨。
闽菜以甜为主，如果吃不惯的可以放弃白糖。
可以通过勺子敲打瘦肉块，听到声响来判断是否炸透瘦肉。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg
./5.jpeg
./6.jpeg
./7.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (130, 0, '水产', '鲜', '小试牛刀', '12', '葱烧海参', '这道菜做法不难，泡发海参需要时间，利用过年存的干海参在疫情隔离期间制作。', e'泡发好的海参（北极参）4个
大葱葱白1根
食用油20 - 25ml
蚝油20g
生抽5g
白糖2g
淀粉2g', e'葱白切成1cm的段备用。
海参切成1cm的段备用。
准备一个空碗，倒入20g蚝油，10g生抽，2g白糖，搅拌均匀。
另一个空碗倒入淀粉和水，制备水淀粉，勾芡用。
热锅，锅内放入20ml - 25ml食用油，等待10秒让油温升高。
放入葱白，调小火，煎3 - 5分钟。
用筷子夹出葱白，放入盘中备用。
倒入调好的料汁，炒香，等待1 - 2分钟。
放入切好的海参，翻炒1分钟。
加入100ml的水，中小火，等待5分钟。
等待锅中汤汁快干的时候，加入水淀粉，加入前面取出的葱白。
在外观呈粘稠状态后关火，盛盘。', e'操作时，需要注意观察锅中的水量，如快见底的时候就直接接入水淀粉即可。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./葱烧海参.jpeg
./海参.jpeg
./酱汁.jpeg
./葱白.jpeg
./成品.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (131, 0, '水产', '辛辣', '得心应手', '35', '水煮鱼', '水煮鱼是一道做法中等难度的硬菜。巴沙鱼富含优质蛋白且脂肪含量低，配合各种时令蔬菜十分营养健康。', e'巴沙鱼500g
蔬菜（如土豆片、豆芽、花菜、生菜等）300g - 500g
红油豆瓣酱40g（可根据个人辣度调整，不怕辣可多加10 - 20g）
豆豉10g（可选）
藤椒油10ml
菜籽油25ml
白胡椒粉3g
大蒜2瓣
盐5g
糖2g', e'准备：巴沙鱼从冷冻柜取出，放室温自然解冻5小时后切片。
切片：将巴沙鱼切成约5cm长，3cm宽的薄片。
腌制：把切好片的巴沙鱼放入大不锈钢碗，加入30g豆瓣酱，3g盐，10ml藤椒油，3g白胡椒粉，用手抓匀后加入5ml菜籽油，常温静置至少30分钟入味。
备菜：大蒜切末，将选择的蔬菜洗净，如300g花菜和200g生菜，花菜开水锅焯水备用，生菜洗净晾干炒熟备用（不放油）。
炒豆瓣酱：热锅冷油（20ml菜籽油），加入10g豆瓣酱，10g豆豉（可选），加入蒜末，中火慢炒。
汆鱼片：加入150ml热水，水开后加入腌制好的鱼片，轻轻翻动让鱼片散开，加入2g盐和2g糖调味（可根据个人口味调整盐用量），水再次沸腾后盛盘。
盛盘：先将熟蔬菜盛至大碗中，再将热鱼片盛在蔬菜上，浇上锅中剩余热汤。', e'垫底的蔬菜组合及用量可自由发挥，但要注意各种蔬菜特点，如改成土豆时，需将土豆片/块煮熟（可用筷子戳确认）。
红油豆瓣酱辣度和盐的用量可根据个人口味调整。
切鱼片时可垂直于鱼片长条方向先剁成5cm鱼块，然后翻转90度斜着切成薄片。
腌制时不要太用力抓。
可参考链接https://www.youtube.com/watch?v=uXSgGtMkgro学习给鱼剔骨。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (132, 0, '早餐', '鲜', '轻松上手', '4', '蒸水蛋', '教程详细介绍了如何做出水滑嫩香的蒸水蛋，包教包会。', e'新鲜鸡蛋2个
盐2g
热水260ml', e'鸡蛋打入碗中，打散。
取其他容器，倒入1.5倍（半个蛋壳为0.5倍水）于蛋液的温水（温度20~30），将盐倒入水中化开。
将盐水倒入鸡蛋液中，顺时针或逆时针单方向搅拌均匀，气泡之类的可以用舀出丢弃，过筛则口感更加。
使用锡纸包裹盛蛋液的碗（或用盘子盖住），置入提前带盖并加入大约3cm深度水的锅中。
中火烧至水开，转最小的火继续蒸4分钟。', '出锅稍晾即可食用，能保留鸡蛋原香的终极口感。也可加入蒸鱼豉油，葱花香油作为佐料。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (178, 0, '主食', '鲜', '得心应手', '4', '炒意大利面', '这是一道软糯爽口的意大利面做法，简单易操作。', e'意大利面，每人50克
肥牛片，每人5片
番茄酱或黑胡椒酱（选其一）10克
菜籽油，每50克意面5ml', e'加入每人250克水，水开后下意大利面，中火煮15 - 20分钟，捞起前尝一下，中心硬则继续煮；
捞出面条盛入盘中备用；
热锅倒入食用油，油温中热时，下意大利面翻炒一分钟，太干则加少量水；
放入10克番茄酱、肥牛片，加入2g食盐，继续翻炒一分钟；
起锅。', '煮意大利面时要注意观察面条状态，确保熟透；炒面时根据面条干湿度适当加水。', './a.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (133, 0, '荤菜', e'甜
酸', '大展身手', '20', '糖醋里脊', '糖醋里脊是中国经典传统名菜之一，该菜品以猪里脊肉为主材，配以面粉、淀粉、醋等佐料，酸甜可口，让人食欲大开，在陕菜、豫菜、浙菜、鲁菜、川菜、淮扬菜、粤菜、闽菜里均有此菜。', e'猪里脊肉 500g
醋 10g
白糖 30g
淀粉 50g
鸡蛋 50g
生抽 10ml
料酒 20g
蚝油 10g
番茄酱 30ml
白胡椒粉 5g
食盐 10g', e'1. 腌肉：将猪里脊肉先切厚片，用刀背拍一拍，把肉拍松一点。切成一个手指头粗的条，加料酒，生抽，蚝油，食盐，白胡椒粉，一个鸡蛋，将肉用手抓匀，腌制 20 分钟以上。
2. 调酱：番茄酱+10g 醋+30g 白糖+150ml 清水，搅拌至糖融化，备用。
3. 裹粉：先把粉全部裹好再来炸，这样在炸的时候就不会手忙脚乱。准备一个大碗，里面放淀粉，把每一根肉条都满满裹上淀粉。
4. 炸制：油温 160 摄氏度下里脊，可以拿一个干筷子放在油里面试一下，周围冒小泡就可以下锅。炸到表面微黄可以捞出，全程中火。然后等油温升高到 200 摄氏度，把里脊倒进去重新炸一次，只需 40 秒，表皮就会很脆，马上捞出。
5. 裹酱：另外拿一个锅，锅里放底油，把调好的酱汁倒进去，煮到冒泡，把炸好的里脊放进去，翻炒，让每一根都裹上酱汁。下炸好的里脊肉翻炒，关火盛出。', '里脊要多炸几遍，注意火候，否则达不到外焦里嫩的效果！', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (134, 0, '荤菜', e'麻辣
鲜香', '得心应手', '15', '水煮牛肉', '水煮牛肉是一道色香味俱全的经典川菜，以麻辣鲜香的独特口味和丰富的口感深受人们喜爱。牛肉鲜嫩多汁，搭配豆芽等配菜，在浓郁的红汤中尽情吸收汤汁的味道，每一口都充满了浓郁的麻辣风味，令人回味无穷。', e'牛肉 300g
豆芽 100g
鸡蛋 1 个
香菜 5 根
豆瓣酱 10g
料酒 10ml
淀粉 15g
干辣椒粉 5g
姜 20g
蒜 3 瓣
红辣椒 1 根
蚝油 8g', e'牛肉洗干净切片。
加入 15g 姜丝，1 个鸡蛋，15g 淀粉，8g 蚝油，10ml 料酒搅拌均匀，腌制 15 分钟。
香菜洗干净切好。
锅里倒油，加入豆瓣酱，5g 姜丝，蒜片。
倒入开水，煮成红汤。
豆芽洗干净去掉尾须，放进开水里焯熟。
将豆芽铺入碗底。
将牛肉片一片一片的放进红汤中，煮熟以后捞出。
将牛肉铺在豆芽上，撒上香菜梗。
撒上香菜叶，辣椒粉，辣椒圈。
另起锅烧热油，将热油淋在菜上面，就完成了。', e'腌制牛肉时淀粉量可根据个人对牛肉口感的喜好适当调整，喜欢更嫩滑口感可适当增加。
煮红汤时加入开水能使汤底更浓郁，如果加冷水可能导致汤底变浑浊。
淋热油时油温要足够高，这样才能激发出辣椒和香料的香气，但注意别过热产生焦糊味。', e'./sznr1.jpg
./sznr2.jpg
./sznr3.jpg
./sznr4.jpg
./sznr5.jpg
./sznr6.jpg
./sznr7.jpg
./sznr8.jpg
./sznr9.jpg
./sznr10.jpg
./sznr11.jpg
./sznr12.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (135, 0, '酱料', '咸', '小试牛刀', '5', '油酥', '油酥由面粉与热油混合调制而成，烙饼时使用可使饼子层层分明，外酥里软，口感更佳。', e'面粉（根据烙饼张数计算得出）
油（根据烙饼张数计算得出）
盐（根据烙饼张数计算得出）', e'将面粉盛在小碗里，加入盐。
加入200度的热油。
用筷子搅拌成无固状物体的糊状。', e'制作油酥时，注意热油的温度，避免烫伤。搅拌时要快速均匀，确保油酥的质地细腻。根据烙饼的实际情况，合理调整油、盐和面粉的用量。
可以提前准备好所需的工具和原料，提高制作效率。如果没有温度计，可以通过观察油的冒烟情况来判断油温是否达到200度。
搅拌油酥时，尽量避免面粉溅出。如果油酥太稠，可以适当添加一些热油；如果太稀，可以添加一些面粉进行调整。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (136, 0, '素菜', '鲜香', '小试牛刀', '2', '炒茄子', '家常炒茄子，做法简单易学，原料不复杂，味道鲜香可口。', e'茄子：份数 * 1.8个
八角：份数 * 1个
虾皮：份数 * 正常男子手抓半把
香葱：份数 * 2颗
酱油：份数 * 40ml
菜籽油或花生油', e'将茄子洗净，竖切一刀分为两段，每段切菱形块，放入碗中。
将香葱洗净切成葱花，切好八角，分别放到案板上。
开火热锅至锅内无水，倒入食用油，没过锅底两倍。
若有八角等可选材料，热油约6成熟时放入；若没有则热油至9成熟。
待油到9成熟，将碗中的茄子倒入锅内用锅铲翻炒约40秒。
将锅铲悬空与锅平行，把酱油倒入锅铲内（一人约2.5锅铲），继续翻炒。
等到锅内茄子变色且变软时捞出。', e'因酱油缘故本菜不必加盐，出锅前可尝，不咸可加微量盐，下次炒时增加酱油量。
加了虾皮可酌情减少酱油量。
炒时一直用大火。
一定不可加水，油可多放。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (137, 0, '荤菜', '醇厚', '大展身手', '115', '枝竹羊腩煲', '枝竹羊腩煲是一份老少皆宜，适合冬季暖胃的美食。此道菜肥而不腻，搭配米饭堪称一绝。', e'羊腩500g
炸腐竹30g - 50g
柱侯酱30g
腐乳40g
南乳35g
老抽5ml
辣椒油5ml
清水500ml
冰糖20g
砂糖10g
小葱5根
姜片6 - 8片
香菇7 - 8个
洋葱1个或红葱头4 - 5个
蒜瓣7 - 8瓣
香叶1片
八角4 - 5个
桂皮10g', e'香菇提前浸泡2 - 3小时至变软。腐竹提前浸泡30分钟至变软
南乳、柱侯酱、20g腐乳、老抽放入同个小碗中搅拌均匀
20g腐乳、砂糖、辣椒油放入同个小碗搅拌均匀
泡好的香菇去除根部
泡好的腐竹切成5cm的小段，挤干水分
洋葱去皮切丝。也可以用去皮红葱头进行替代，口味更佳
小葱切成大约5cm的葱段
羊腩冷水下锅，放入2 - 3片姜片，倒入凉水，大火煮至水滚后关火
捞出羊腩，放入准备好的冷水盆中放凉，使其更有嚼劲
锅烧热后放入冷油，放入4 - 5片姜片、洋葱/红葱头、葱白段、7 - 8瓣蒜瓣进行爆香
放入冷却好的羊腩，用筷子搅拌大约2 - 5分钟直至出现金黄色
放入调好的酱汁1 ，翻炒大约2分钟至颜色均匀
倒入清水至刚好没过食材
放入香菇、冰糖、香叶、八角、桂皮
加盖转小火炖90分钟
开盖加入腐竹，加盖转中火煮20分钟
开盖加入酱汁2搅拌均匀
关火，出锅前加入葱绿段或香菜', '此菜属于粤菜，正宗做法多会添加马蹄。考虑到萝卜青菜各有所爱，也可根据个人口味替换成土豆、萝卜等其他食材', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (179, 0, '主食', '', '轻松上手', '15', '煮锅蒸米饭', '介绍了用厚底煮锅蒸米饭的做法，包括必备原料、工具、米和水的比例、具体操作步骤等', e'北方大米
水', e'清洗大米。
将米和水按米100ml - 200ml/人，水是米体积2倍的比例加入煮锅。
大火煮至水沸腾。
搅拌底部防止粘黏。
盖上锅盖，转小火加热10 - 15分钟（根据对软糯程度的喜好），中途切勿打开锅盖。
关火，静置5分钟。', '注意按照米和水的比例添加，搅拌底部防止粘黏。小火加热时中途不要打开锅盖，以免影响米饭口感。', './rice_regularPot.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (138, 0, '荤菜', e'鲜
醇厚', '大展身手', '85', '梅菜扣肉', '梅菜扣肉造型别致、大方得体，颜色酱红油亮，汤汁黏稠鲜美，扣肉肥而不腻，食之软烂醇香。', e'五花肉200g
梅菜30g
五香粉2g
食用油300ml
白砂糖5g
老抽30ml
生抽20ml
小米椒1个
蒜末10g
食用盐2g
鸡精2g', e'梅菜放到清水中，浸泡1小时
锅中倒入50ml食用油，将整个五花肉猪皮朝下，放到锅中1分钟 ，取出挂掉猪皮 【可选】
锅中加入开水，放入五花肉，大火煮20分钟 （筷子可以插进五花肉），取出五花肉
在五花肉表面涂抹均匀老抽、五香粉、白砂糖，放置15分钟
起锅烧油，加入五花肉，中火油炸直至两面金黄色（3-5分钟）
起锅烧油，倒入梅菜，加上小米椒、蒜蓉、鸡精、食用盐后翻炒，直至炒干梅干菜水分
五花肉切片（后端0.5-1cm）,放在大碗中，散上梅干菜
中火蒸45分钟
拿个盘子倒盖在五花肉大碗中，将五花肉倒在盘子中', e'制作过程中发现，脆皮五花肉真香Orz~
不喜欢吃甜的可以去掉白砂糖，不影响主流程
倒数第二个步骤，可以根据个人喜好调整时间
炒干梅干菜的作用是为了后续吸油（盲猜）', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (139, 0, '素菜', '鲜', '轻松上手', '5', '蚝油生菜', '这道菜富含维生素，做法简单，尝起来爽口又不上火。', e'生菜1棵(200g ± 50)
蚝油6 - 8ml
大蒜4 - 5瓣
生抽6ml
盐0.5g
白糖1g
食用油5 - 8ml', e'生菜洗净并去掉烂菜叶。
热锅，先放1L清水（凉），然后在锅内放入2ml - 3ml食用油和0.5g盐，等待锅中的水煮沸。
水沸后，放入生菜，将每一片生菜叶都焯水10s。
捞出生菜，控干水份，摆盘 。
调汁：将生抽10ml 、蚝油6 - 8ml 、盐0.5g 、 白糖1g放入碗中调匀，并加入10 - 15ml清水（凉）搅拌均匀。
再开火，热锅，放入食用油5 - 8ml，油热放入蒜泥。
等待有蒜香飘出，倒入调好的汁，煮沸即可，立马关火。
将锅中的汤汁均匀地浇在生菜上。', '', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (140, 0, '素菜', '鲜', '小试牛刀', '3', '鸡蛋火腿炒黄瓜', '这是一道简单美味的家常菜，将黄瓜、鸡蛋和火腿搭配炒制而成，味道鲜香可口。', e'黄瓜1根（约200g）
鸡蛋2个
火腿肠1根（约40g）
盐2g
生抽3ml
红尖椒1个（可选）
食用油10ml', e'黄瓜洗净，切半圆形片，备用。
火腿切半圆形片，备用。
红尖椒（可选）切碎，备用。
将鸡蛋打入碗中，搅匀，即为鸡蛋液。
热锅里倒5ml食用油。
油热后转小火，倒入打散的鸡蛋液，用筷子划散，翻炒至鸡蛋结为固体且颜色微微发黄，即为半熟鸡蛋，盛出备用。
不用洗锅，往锅内倒入5ml食用油，倒入黄瓜片大火翻炒1分钟。
把半熟鸡蛋倒入锅中，调入2g盐、3ml生抽，立刻倒入火腿片和辣椒碎（可选）翻炒均匀。
关火，盛盘。', '火腿是咸的，要在调味后才加入，这样不会让火腿也沾上盐。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (141, 0, '主食', '鲜', '轻松上手', '40', '鲣鱼海苔玉米饭', '这是一道将米饭与鲣鱼海苔碎、玉米粒搭配的美食，通过简单操作即可完成，味道鲜美。', e'东北米
鲣鱼海苔碎 20g
玉米粒 80g/袋', e'使用米家小饭煲煮东北米，水没过米3毫米，煮饭40分钟。
盛好米饭，放入玉米粒拌好。
放入鲣鱼海苔碎。', e'不推荐使用高压锅煮饭。
使用米家小饭煲煮东北米时注意水的量，太多水煮出来不是一粒一粒的饭。', './米饭.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (142, 0, '水产', e'鲜
咸', '大展身手', '20', '红烧鲤鱼', '这是一道色香味俱佳的传统名菜，以鲤鱼为主料，搭配五花肉等食材，经多道工序烹制而成。鱼经油炸后，再与调料慢焖入味，最后大火收汁。烹饪过程中加入五花肉，利用其煸炒出的猪油增添香味，使菜品味道更加醇厚鲜美。', e'鲤鱼 1 条（约 2 斤）
五花肉 100g
大葱 200g
姜 80g
蒜瓣 3 - 4 个
干辣椒 2 个
白糖 50g
油
盐
生抽 50ml
老抽 20ml
陈醋 50ml
蚝油 5ml
料酒 50ml', e'1. 葱、姜、蒜、干辣椒分别清洗干净。葱白切段，每段约 4cm 并劈为四瓣；姜切片，厚约 3mm；一个大蒜拍碎切末，其余切为二瓣；干辣椒切四段；五花肉切片，约 4cm*4cm。
2. 清洗鱼，在鱼背肉厚处拉几道斜口。
3. 锅里多倒点油，烧至 7 成热（刚刚开始冒烟），下入鱼炸 1 分钟至鱼皮稍稍变硬捞出备用（注意不要一下锅就拨弄鱼，等炸一会再拨弄、翻面），炸鱼的油倒出，锅里留一点底油。
4. 将锅里底油烧热，下入五花肉，煸出香味。
5. 放入干辣椒、葱、姜、蒜瓣，翻炒 1 分钟。
6. 将炸好的鱼倒入锅中。
7. 沿锅边倒入 50ml 料酒、50ml 陈醋、50ml 味极鲜、20ml 老抽调色、5ml 蚝油提鲜、5g 匙盐、50g 白糖，加入清水没过鱼面。
8. 调至中火，将水烧开。
9. 调至小火，慢焖入味。
10. 15 分钟后，打开锅盖，挑出锅里的葱、姜、蒜、干辣椒。
11. 调至大火收汁，汤汁剩余 1/4 时，撒点蒜末，关火盛出。', '1. 炸鱼时注意火候和时间，避免炸焦。2. 调料的用量可根据个人口味适当调整。3. 慢焖入味的时间可根据鱼的大小适当延长或缩短。4. 收汁时要注意观察汤汁状态，避免收干糊锅。5. 处理鱼时，在鱼背肉厚处拉斜口能让鱼更好地吸收调料味道。6. 煎鱼时，等鱼炸一会再拨弄、翻面，可保证鱼皮完整。7. 煸炒五花肉时要充分煸出香味，这样能为菜品增添浓郁的香气。8. 倒入调料时沿锅边倒入，可使调料更好地融入菜品中。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (143, 0, '素菜', '鲜', '轻松上手', '15', '鸡蛋羹', '鸡蛋羹，又称水蒸蛋，不需要准备复杂的食材，是一道简单快捷易做的菜，当早餐或是正餐都可。', e'鸡蛋2个
食用盐3g
香油（或芝麻油）2 - 4ml
生抽 / 味极鲜8ml
白醋（或料酒）2ml（可选）', e'两个鸡蛋放入碗中打散
加入食用盐3g
加入2ml白醋，去除鸡蛋的腥味（可选）
向碗中加入鸡蛋体积1 - 1.5倍的70度纯净水，并且搅拌均匀
过滤蛋液，去掉蛋液中的浮沫（可选）
向任意一口锅中加入50ml清水，水烧开后，放入盛有鸡蛋液的碗，蒸碗要盖上一个盖子，倒扣一个有凹槽的铁碟子，或者使用保鲜膜来减少水汽进入
中火蒸10分钟
关火，再闷上5分钟
出锅
加入香油和生抽即可享用', e'盐起到了重要的增加底味和凝固作用
加入米醋也行，但米醋的颜色会使鸡蛋微微发黑
还可以加入料酒，同样具有去腥的作用，且没有醋的酸味
1倍的水鸡蛋更弹，1.5倍的水鸡蛋更嫩
过滤蛋液，去掉蛋液中的浮沫（可选，不过滤蒸出来的蛋会有气泡导致不好看）
蒸碗要盖上一个盖子，倒扣一个有凹槽的铁碟子，或者使用保鲜膜来减少水汽进入，这是为了避免其变成蜂窝状
也可用藤椒油代替香油，增加麻爽口感
上面介绍的是基础水蒸蛋做法，可以在此基础上派生，添加诸如火腿肠、肉馅、虾皮等材料，丰富鸡蛋羹的口感。', './鸡蛋羹.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (144, 0, '荤菜', '鲜', '轻松上手', '60', '西红柿土豆炖牛肉', '西红柿土豆炖牛肉（腩）的特点就是还挺好吃，牛肉是优质蛋白，换成牛腩更好吃。', e'牛肉500 - 700g
葱一根，姜四片，料酒
花椒3g
八角一个（半）
香叶两片
白糖或冰糖
酱油（可选）
老抽
黑胡椒粉（或白胡椒粉）2g
土豆两三个
西红柿拳头大小中等个头两三个
比拳头大一点的洋葱一个
油15ml（若用牛腩可根据喜好减少为10ml）', e'备菜: 土豆去皮、切成5cm大块，备用；西红柿切十字花刀，开水烫后去皮，把中间的芯去掉，切3cm小块备用；葱切4g的葱花出来，剩下的掰成5 - 8cm大段；牛肉泡凉水半小时去血水，或凉水下锅煮至表面变白捞出，期间撇去浮末；洋葱切0.5 - 1cm小粒。
制作: 全程中火，凉水没过牛肉，放入高压锅，放入葱段，姜片，放入20g料酒，上汽压20分钟；取出牛肉后，切5cm大块，挑出姜，汤盛到一个大碗里一会炖煮用；倒油，油四到五成热以后下花椒八角香叶，出香味之后糊之前挑出不用；下入牛肉，葱姜，炒香，炒多久都无所谓，看着有点要糊可以舀10ml汤；炒香后加入生抽15ml，料酒15ml，胡椒粉，5 - 10g番茄膏番茄酱或一个番茄罐头，加入洋葱炒至透明；（可选）可以加一点点盐使洋葱出水不容易糊，不要加太多，后面再调味；加入西红柿炒至西红柿化开软烂，倒入剩下的汤。
炖煮: 中火开锅后，全程小火；出锅前30 - 40分钟加土豆并调味；依据个人口味边尝边加糖盐，合适为止；筷子戳牛肉软烂后出锅！', e'炖煮时保证汤加入的时候是温热的。
炖煮时不要扣盖否则土豆会烂。
炖煮时时不时翻动避免糊底。
砂锅炖煮会更好吃，可以在炒锅里炒完倒到煮锅里炖，如果用砂锅开锅之前不要用大火避免裂开。
酱油总量不要太多，汤汁浓缩的时候会变咸，稀的时候稍微淡点没事，炖煮时候觉得不够也可以再加酱油。
不要用鸡精味精，会抢夺牛肉的鲜味。', './abaaba_1.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (145, 0, '素菜', '鲜', '轻松上手', '2', '炒滑蛋', '炒滑蛋是一道简单易做的菜', e'鸡蛋 4 颗
牛奶 30ml
食用油 10ml', e'鸡蛋加入牛奶以及 5ml 食用油搅拌均匀，备用
大火烧热平底锅约 30s, 加入 5ml 食用油
烧 30s 转小火, 并且放入搅拌好的鸡蛋
在锅中静置 5 秒后，用锅铲将蛋液从边缘缓慢推向中间
翻炒至鸡蛋大致凝固后关火，装盘', e'最后可根据个人口味撒些黑胡椒或者盐来调味。
鸡蛋最好使用无菌蛋。', './炒滑蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (148, 0, '饮料', '甜', '小试牛刀', '6', '百香果橙子特调', '这是一款可以用茉莉绿茶或苏打气泡水制作的特调饮品，制作过程相对简单，味道酸甜可口。', e'百香果3个
橙子1个（约200克）
茉莉绿茶茶叶3 - 6克或苏打气泡水
白砂糖30克
蜂蜜10克（可缺，缺时可用5克白砂糖代替）
冰块160克以上
薄荷叶或其他绿叶（可选）', e'百香果腌制：取出三个百香果的果肉及汁置于容器，放入30克白砂糖、10克蜂蜜（若无可用5克白砂糖代替）搅拌均匀，用保鲜膜封口，放冰箱腌制12 - 24小时。
茉莉绿茶调配：称量3 - 6克茶叶置于容器，加150毫升开水泡6分钟，放入90克冰块冷却并搅拌，待冰块消失后过滤得到约240毫升茉莉绿茶茶水。
橙子处理：橙子对半切（刀垂直于头尾连线），取一半中的一片橙子备用，剩余橙子再对半切，用压汁器压出橙汁备用。
正式调配：选350 - 400毫升透明玻璃杯，杯底放70克冰块，倒入所有橙汁，将一片橙子贴杯内壁放置，浇上一次分量的腌制百香果，缓慢注入茉莉绿茶直至满杯，可放装饰绿叶，搅拌均匀享用。若用苏打气泡水代替茉莉绿茶，免去茉莉绿茶调配流程。', e'缺少或不喜欢茉莉绿茶时可用苏打气泡水代替。
腌制百香果量小可按此配方准备两次的量。', e'./tea-version.jpg
./soda-version.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (149, 0, '主食', '甜', '轻松上手', '10', '醪糟小汤圆', '醪糟小汤圆是一道美味的甜品，制作过程简单，口感香甜。', e'小汤圆 250 克
醪糟 50 克
白糖
枸杞（可选）
水 300 毫升', e'将水倒入锅中并煮沸。
放入小汤圆煮 8 分钟。
放入醪糟和枸杞再煮 2 分钟。
盛入碗中根据个人口味加入白糖并搅拌均匀。', e'白糖的用量根据个人口味更改。
若喜欢更浓的口感可以减少 100 毫升内的水。
若喜欢软点的枸杞口感，可以将枸杞和小汤圆同时煮。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (150, 0, '荤菜', e'辛辣
鲜香', '大展身手', '10', '宫保鸡丁', '宫保鸡丁是一道经典的老派川菜，有简易和稍加复杂两个版本做法。其口味独特，融合了鸡肉的鲜嫩、花生的香脆、辣椒的香辣等多种味道，深受大众喜爱。', e'手枪腿（或者鸡胸脯肉）1支（约350g）
大葱1根（约180g）
熟花生150g
姜片10g
干辣椒（或者二荆条）10g（若选择二荆条，则需要大约4支）
生抽酱油10g
白糖2g
盐2g
植物油20g
淀粉15g
料酒15g
老抽酱油5g
花椒5g
香醋5g
鸡精2g
芝麻油10g
淀粉（用以勾芡）10g
豆瓣酱10g
莴笋约250g
油泼辣子5g', e'简易版本：手枪腿用剪刀去骨，鸡肉面用刀背拍打一遍，切条后切至1.5cm见方肉丁；泡于清水10分钟，捞出控干备用（若是鸡胸脯肉，则可以直接进行切丁以及之后的动作）；取大葱葱绿与姜片5g于碗中，倒入50g开水备用；葱白切1.5cm圆粒备用；取花生放入微波炉高火5分钟焙干备用；鸡丁中加入盐2g，老抽酱油5g，料酒15g，淀粉15g搅拌均匀，至微微发干；缓慢加入部分葱姜水，搅拌鸡丁至粘手；保鲜膜密封，放入冰箱腌制1小时；干辣椒切段；起锅，大火烧热转小火；放入干辣椒焙干至微微发糊，捞起备用；花椒焙干至有香味，捞起备用；转大火，倒入20g植物油，7成热（竹筷子起泡）下入鸡丁，煎至上面开始发白，用锅铲翻面，煎30s后翻炒均匀；下入葱粒翻炒，加入余下葱姜水不够100g再加一点清水（务必是热水）；盖上锅盖，转中小火焖2分钟；转大火，下入熟花生，干辣椒和花椒；加入鸡精2g，香醋5g，白糖2g，翻炒均匀；淀粉10g加50g清水调成水淀粉，加入锅中，翻炒均匀，收汁到自己想要的浓度；关火，淋入芝麻油10g，即可出锅。
稍加复杂版本：莴笋去皮切至1cm见方的小块，备用；二荆条切成1cm长段；手枪腿用剪刀去骨，鸡肉面用刀背拍打一遍，切条后切至1.5cm见方肉丁；泡于清水10分钟，捞出控干备用（若是鸡胸脯肉，则可以直接进行切丁以及之后的动作）；取大葱葱绿与姜片5g于碗中，倒入50g开水备用；葱白切1.5cm圆粒备用；鸡丁中加入盐2g，老抽酱油5g，料酒15g，淀粉15g搅拌均匀，至微微发干；缓慢加入部分葱姜水，搅拌鸡丁至粘手；保鲜膜密封，放入冰箱腌制1小时；转中火，倒入20g植物油，放入生花生翻炒至其表面微微焦糊，捞起花生但是油留在锅内；继续加热，7成热（竹筷子起泡）下入鸡丁，放入豆瓣酱，翻炒大概1分钟；加入备好的莴笋丁，继续翻炒1分钟；下入葱粒翻炒，加入余下葱姜水不够100g再加一点清水（务必是热水）；加入二荆条段；盖上锅盖，转中小火焖2分钟；转大火，下入先前捞起来备用的花生，花椒；加入鸡精2g，香醋5g，白糖2g，翻炒均匀；淀粉10g加50g清水调成水淀粉，加入锅中，翻炒均匀，收汁到自己想要的浓度；关火，淋入芝麻油10g与油泼辣子5g再翻炒10s，即可出锅。', e'辣椒依据个人口味酌量添加，怕辣可去籽；
对于使用剩余的食用油，可以考虑重新收集到油壶。', './宫保鸡丁.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (151, 0, '汤与粥', '甜', '大展身手', '130', '银耳莲子粥', '银耳莲子粥是一道营养非常丰富的粥，口味偏甜，具有养心安神的功效。', e'银耳60g
去心莲子20g
红枣6g
枸杞5 - 6g
冰糖10 - 20g', e'把银耳、莲子用清水浸泡2个小时，红枣浸泡10 - 20分钟，枸杞洗净，备用。
在锅中倒入600ml水，烧开后依次放入银耳、莲子、红枣。
等待水再次烧开后，盖上锅盖，转至中火继续熬。
熬到大约1小时后，放入5g - 10g冰糖和5g - 6g枸杞，转至小火熬。
小火继续熬30分钟，此时银耳开始呈现粘稠状态。
再次放入5g - 10g冰糖，用勺子搅拌5 - 10分钟。
关火，用勺子盛出。', '当银耳呈现粘稠状态时，需要用勺子及时搅拌，防止银耳糊在锅底。', './银耳莲子粥.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (152, 0, '荤菜', '鲜香', '大展身手', '40', '柱候牛腩', '肉香味美，色泽诱人，滋补强壮，口感甚佳，令人垂涎的广式菜肴。', e'牛腩500 - 600g
姜30g
蒜半头
小米辣1条
香叶2片
花椒0.5g
八角2个
干辣椒3个
丁香3个
甘草2片
南腐乳2块
郫县豆瓣酱15g
冰糖10g
花雕酒10g
白酒20g
柱候酱50g
蚝油20g
老抽5g
生抽60g
叉烧酱20g', e'先把辅料备好：碗1：姜切成1.5cm*1.5cm的小块，半头蒜剥好皮，如果有小米辣切成1cm小段；碗2：放入2片香叶，0.5g花椒，2个八角，3个干辣椒，3个丁香，2片甘草；碗3:放入2块南乳；碗4:放入15g豆瓣酱；碗5:放入10g冰糖；碗6：倒入花雕酒10g和白酒10g；碗7：加入50g柱候酱，20g蚝油，20g叉烧酱，5g老抽，60g生抽。
牛肉不用切，直接冷水下锅，开大火焯水，水沸腾时将牛肉捞出。
冲洗牛肉表面的杂质后，切成4cm*4cm*4cm的大块，控干水后放入碗中备用。
大火，热锅下油，把碗1（姜、蒜、小米辣）倒入锅中，炒香。
中小火，倒入碗2（香料），翻炒均匀，大概30秒。
中小火，放入碗3（南乳），用锅铲把南乳压碎。
中小火，放入碗4（豆瓣酱），翻炒均匀，大概30秒。
中小火，放入碗5（冰糖），炒至融化。
中小火，下入牛腩，炒至牛肉上色。
大火，沿锅边淋入碗6（酒），快速翻炒，炒至牛肉表面略微焦褐。
倒入碗7（酱料），快速翻炒，留意底层汁水，炒至不停冒小气泡，汤汁略微浓稠。
将锅内全部食材转移至另一个炖煮锅或高压锅，加水淹过食材。
根据使用的锅来选择炖肉的时间：a.普通炖煮锅：小火炖煮3个小时；b.高压锅：压40分钟。
时间到后开盖调味，如果不够咸加盐或生抽（少量加，不断尝味道，直到合适），不够甜则同理加糖。
调好味道后便可以把牛腩先捞出。
如果要吃萝卜土豆，则削皮切成2cm厚片倒入锅中煮10 - 15分钟（或煮至想要吃的口感），如果是高压锅则在加压煮5分钟。
煮好后捞出萝卜土豆和牛腩放一起。
把汤汁过滤淋入碗中。', e'操作高压锅要注意安全。
调味时不够咸加盐或生抽要少量加，不断尝味道，直到合适；不够甜同理加糖。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./柱候牛腩.jpeg
./柱候牛腩配米饭.jpeg
./牛腩部位.jpeg
./碗1.jpeg
./碗2.jpeg
./碗3.jpeg
./碗4.jpeg
./碗5.jpeg
./碗6.jpeg
./碗7.jpeg
./牛腩焯水.jpeg
./牛腩切块.jpeg
./牛腩此时可开始炖煮.jpeg
./牛腩入锅.jpeg
./土豆切片.jpeg
./过滤汤汁.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (153, 0, '汤与粥', '', '轻松上手', '5', '米粥的做法', '大米粥是一道以大米和水作為主要原料經大火煮沸熬製而成的美食，老少皆宜，米粥具有補脾、和胃、清肺功效。', e'米
水
植物油（可选）', e'1. （可选）将Mo ml的油与洗净的米混合，尽量确保完全混合，即每粒米上至少都沾上少量油。
2. （可选）将米 - 油混合物品冷藏保存，冷藏时间Tc。
3. 将米和水加入锅中。
4. 开大火，加热到T1。
5. 在T1之前将火关小。如果忘记此步骤，水可能会漫出而熄灭火焰。非常危险！
6. 加热到Tr。在Tr时关闭火源。', '注意在T1之前及时关小火，避免水漫出熄灭火焰。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (154, 0, '汤与粥', '鲜', '得心应手', '14', '羊肉汤', '羊肉汤简单易做，有抵御寒冷、温润养胃、开胃健脾的功效，富含钙、铁、蛋白质等营养物质。', e'羊肉300g
食用油10ml
料酒20ml
大葱50g
开水1000ml
白胡椒粉1g
食用盐5g
孜然粉1g
香菜20g', e'羊肉切成长5cm宽0.5cm的块
大葱切成小段
羊肉放入锅中，加入1000ml常温水，加入料酒、大葱
煮沸2分钟后，捞出羊肉，使用常温水洗净，沥干水分
热锅加入食用油，加入羊肉，翻炒2分钟至羊肉表面微黄
加入开水，开到大火档位
5分钟后，加入白胡椒粉、盐，继续煮沸5分钟
出锅之后，加入香菜、孜然粉，搅拌均匀', '加入开水时，注意要开大火，使油脂与汤汁更好的融合', './羊肉汤.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (155, 0, '汤与粥', '鲜香', '大展身手', '90', '陈皮排骨汤', '新鲜排骨搭配广东陈皮煲汤，对脾胃、肺及咽喉有滋补功效，是熬夜党必备养生汤。', e'排骨4 - 5块
陈皮1瓣
西洋参9片
石斛6颗
玉竹5片
麦冬7个
盐5g', e'排骨用热水过一边去血水。
陈皮、麦冬、玉竹、石斛和西洋参冲洗干净。
煲汤盅洗净。
打开煲汤盅，先在底部放入排骨，然后依次放入陈皮、麦冬、玉竹、石斛和西洋参。
加入热水，水不宜太满。
煲汤容器加水，炖煮1.5小时。
加入食盐，趁热饮用。', e'煲汤盅很烫，拿的时候小心别烫到或手滑摔破。
广东老火靓汤讲究用料和火候，备好料和炖够时辰很重要。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (156, 0, '饮料', '甜', '轻松上手', '10', '杨枝甘露', '这是一款用奇亚籽代替西谷米制作的杨枝甘露，操作简单，省时省力。', e'奇亚籽24g
牛奶50ml
冰块2小块
芒果1粒
葡萄柚1/2粒
椰奶150ml
切丝芒果干（可选）
切丝柳橙干（可选）', e'奇亚籽泡牛奶10分钟。
泡籽之时，把半粒芒果、葡萄柚去皮切丁，放入杯中。
半粒芒果切小块放入调理机加冰块、椰奶打成泥。
倒入杯中，放上点缀材料（如有）。', e'制作过程中可根据个人口味调整各种原料的用量。
注意使用干净的工具，避免影响饮品卫生。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (157, 0, '素菜', '鲜', '小试牛刀', '4', '白灼菜心', '白灼菜心是经典粤菜，采用白灼这种烹饪技法，用煮沸的水或汤将生的菜心烫熟，能保持其原有的鲜味，是减肥或快速解决绿叶菜的绝佳方式。', e'新鲜菜心250g
食用油10g
生抽5g
蚝油5g
盐5g
糖5g
大蒜四五瓣
小米辣一两根
洋葱（可选）适量
姜丝（可选）适量', e'菜心洗净，去除根部比较硬或老的地方，用刀刮一刮菜心根茎部分。
大蒜切成蒜末，可加入适量洋葱。
调制灵魂料汁：将生抽5g、蚝油5g、3g糖和100g清水半碗混合成一碗汁儿。
一锅500ml清水加5g盐和10g食用油烧开。
将菜心根茎在沸水中烫1分钟，直到根茎颜色变成深绿，再将整个菜心放到锅中烫熟1分钟，捞起来码入盘中。
开另一小锅将兑好的料汁倒入，小火烧开，放入一半的蒜末，一点点姜丝和小米椒碎，可加入适量洋葱碎，先在锅底倒油，五成热后倒入蒜末、洋葱，稍稍爆香后再加入料汁，加入小米辣煮开。
料汁稍微收汁，煮沸后稍等十来秒，直接浇在菜心上。', e'选择新鲜的菜心。
锅内烧清水时要加油和盐。
如果想要汤汁更浓郁可加淀粉，但广东人可能吃不惯。', './白灼菜心.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (158, 0, '荤菜', '鲜香', '大展身手', '180', '酱牛肉', '家常酱牛肉营养丰富，味道香，不论是当作主食还是佐餐都很棒。', e'牛肉2000克
香叶1片
姜3片
葱半根
老抽15ml
桂皮1块
冰糖7 - 8粒
花椒15粒
料酒30ml
生抽15ml
盐8克
八角4个
黄豆酱15ml', e'牛肉浸泡4 - 6小时，加料酒、姜片，去除血水。
牛肉切成8cm，不超过10cm的肉块。
牛肉放入锅中，加入冷水至水面没过牛肉，开锅至水沸腾开始计时，3分钟后停火，捞出牛肉，用温水洗净。
将洗净后的牛肉放入砂锅或炖锅，加水没过牛肉，开大火，放入除盐之外的其他配料。
水开之后，大火转为小火，持续加热90分钟，加盐。
加盐后，继续小火90分钟（注：每30分钟确认水位线，要求至少达到牛肉面高度的80%）。
加热180分钟后，捞出牛肉，自然冷却，切片。
上桌食用，其他牛肉建议不切片冷藏。', '操作时，需要注意观察沸腾的水位线，如发现低于2/3的食材应加热水至没过食材（约每30分）。', './酱牛肉.jpg', '10', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (159, 0, '荤菜', '鲜香', '小试牛刀', '6', '香干芹菜炒肉', '香干芹菜炒肉是一道简单美味的家常菜小炒，多吃芹菜对高血压有缓解作用。', e'豆干150g
香芹4根
猪肉200g
大蒜2瓣
辣椒4个
花椒6粒
盐5g
鸡精3g
老抽8ml
蚝油5ml
食用油10 - 15ml', e'芹菜去叶切段，切成不超过4cm的条状，备用
香干切条，宽约小拇指，备用
蒜头切片或剁成蒜泥，备用
辣椒切圈或斜切成条，备用
热锅，锅内放入10ml - 15ml食用油，等待10秒让油温升高
放入花椒、大蒜爆香
加入猪肉炒至变色，再加入8ml老抽上色翻炒均匀
加入香干翻炒均匀（大约2分钟）
加入辣椒翻炒均匀（大约1 - 2分钟）
加入芹菜，放入5g盐翻炒1分钟
加入3g鸡精、5ml蚝油翻炒均匀，即可出锅', e'如果没有买到香芹，或者用的芹菜比较粗，可以考虑焯水，放入滚水中1分钟捞出，冷水冲洗（保持爽脆）
如果买到的豆干比较硬、紧实，也可以切条后再焯水', './香干芹菜炒肉.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (160, 0, '荤菜', e'麻辣
鲜香', '大展身手', '20', '水煮肉片', '水煮肉片麻辣鲜香，适合干饭，但是做法稍微有点麻烦。难度主要在肉滑嫩，初学者一般需要1-2小时完成。', e'猪里脊肉300g
食用盐5g
胡椒粉2g
生抽酱油5g
料酒3g
鸡蛋清1个
土豆淀粉7g
植物油280g
豆芽100g
凤尾1根
芹菜3根
蒜苗2根
大蒜20g
生姜10g
红泡椒20g
青花椒5g
干辣椒20g
红油豆瓣5ml
鸡精1.5g
白砂糖1g
小葱2根
菜籽油200g', e'里脊肉改刀成小块，再切成2毫米薄片，放入碗中，加入清水清洗两遍来去除血水和杂质，捞出挤干水分备用。
碗中加入食用盐1.5g，胡椒粉1g，生抽酱油5g，料酒3g，然后朝着一个方向搅拌2分钟，使其入味。
另外准备一个碗，加入一个鸡蛋清，加入7g土豆淀粉，一个方向搅拌均匀，倒入肉中，再次一个方向搅拌均匀，最后再加入30g植物油轻轻搅拌。
绿豆芽100g，凤尾1根改刀成小条，芹菜3根切成小段，蒜苗2根拍散切成小段。
大蒜20g剁碎，生姜小块剁碎，红泡椒20g剁碎。
小米辣干辣椒15g，青花椒3g，锅内加入油滑锅，油稍许热了将多余的倒出备用留50g底油，下入干辣椒、花椒，开小火炒香，倒出在菜板上剁细。
锅烧热，放入100g植物油烧至6成热，加入2g青花椒、干辣椒爆香，配菜下锅，加入1g食用盐，炒至断生，盛入碗中垫底备用。
锅洗干净，加入150g植物油烧至6成热，加入制作好的姜蒜红泡椒，爆香后加入豆瓣10g，开小火把豆瓣爆香炒出红油即可。
加入800毫升清水，大火烧开，转小火调味，加入食用盐2.5g，鸡精1.5g，1g白砂糖提鲜，1g胡椒粉，5g水淀粉将汤汁收浓稠一点。
汤汁开后，开小火将腌制好的肉片分开依次下锅，然后开中火将肉片烫熟，用锅铲轻轻推动一下避免粘连，待汤汁烧开，肉片熟后捞出放入碗中配菜上，再将原汤倒入。
碗中均匀撒上刀口辣椒、蒜蓉和葱花。
锅洗干净，加入200g菜籽油，烧至7成热，然后一次性均匀泼在碗中肉片上。', e'垫底的蔬菜根据自己口味选择（蘑菇、白菜、油麦菜等）。
刀口辣椒制作嫌麻烦也可以直接用干辣椒段和青花椒代替。
特别注意肉的腌制（搅拌的时候朝着一个方向、血水处理干净），保证肉滑嫩（鸡蛋清、淀粉搅拌均匀）。
水煮牛肉也可以按照这个做法。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (161, 0, '汤与粥', '鲜', '轻松上手', '4', '金针菇汤', '一道简单易做的汤品，以金针菇为主要食材，可依据个人喜好添加鸡蛋，出锅后滴入香油增香。', e'金针菇400 - 500克
食盐15克
味精5克
鸡蛋（可选）
香油（或麻油）3 - 4滴', e'金针菇徒手掰散，洗净备用。
将金针菇切段，长度不宜超过5cm。
把金针菇放入锅中，加水没过食材总高度1.1倍，沸腾后等待3分钟。
加入味精和食盐并搅拌。
继续加热约30秒，关火装盘。
若喜欢加鸡蛋，在步骤3中水沸腾后将打散的鸡蛋液倒入锅中。
出锅后加入3 - 4滴香油（或麻油）。', e'金针菇掰散时要尽量散，防止藏牙。
煮金针菇的水要适量，按照要求没过食材一定高度。
加入鸡蛋液时要在水沸腾后倒入，且边倒边搅拌，使鸡蛋成蛋花状。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (162, 0, '汤与粥', '鲜', '轻松上手', '7', '紫菜蛋花汤', '紫菜蛋花汤是一道美味又营养的汤品，制作简单，口感鲜美。', e'10g干紫菜
两个鸡蛋
适量葱花
1.5升清水
5ml油
2g盐
适量虾仁（可选）
适量香油（出锅前）
适量虾皮（可选）
2g淀粉（可选）', e'干紫菜用清水泡15分钟，捞起沥干水份备用。
热锅，倒入1.5升清水、5ml油、2g盐。待水开后放入紫菜。
紫菜烧开后3分钟，将打好的蛋液徐徐倒入锅内，30秒既可起锅。
撒上葱花，转小火20秒。
关火，出锅前放入几滴香油，也可放入一点虾皮。（若喜欢浓稠口感，可加入2g淀粉）', e'水开后，将火关小，将打好的蛋液围绕中间沸腾的水倒入。为了使蛋花比较嫩，锅盖盖上熄灭火等半分钟后再打开。
使用剩余的油可考虑重新收集到油壶。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (163, 0, '汤与粥', '鲜', '轻松上手', '3', '西红柿鸡蛋汤', '西红柿鸡蛋汤是一道常见且美味的汤品，以西红柿的酸甜和鸡蛋的鲜香为特色，制作简单快捷，口感丰富。', e'西红柿1个
鸡蛋1 - 2个
香油2滴
味素5克（可选）
盐15克
葱、姜、蒜共15克', e'将西红柿洗净，切块。
葱姜蒜切碎。
鸡蛋打到碗中，用筷子（或打蛋器）搅拌均匀。
热锅，并放入15毫升的油，待能从油中看到冒出一丝烟时，放入葱姜蒜翻炒30秒。
放入西红柿翻炒1分钟。
倒入水，水的高度大约为锅内菜品高度的1.2倍，并放入盐。
待开锅后，将鸡蛋液放入，并用筷子将鸡蛋打散，放入味素和香油。
等待30秒，关火出锅。', e'味素可根据个人口味选择添加或不添加。
炒葱姜蒜时注意火候，避免炒糊。
倒入鸡蛋液后用筷子快速打散，使鸡蛋形成小块。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (180, 0, '主食', e'甜
咸', '小试牛刀', '40', '空气炸锅照烧鸡饭', '空气炸锅照烧鸡饭是一道简单易做的菜，既便利又便宜，新手也能完全掌握。', e'鸡肉900g
酱油100 - 125ml
糖60 - 65g
白醋30 - 35ml
丽滋饼干16个(48g)
鸡蛋2个', e'将酱油、糖和醋混合在一起,搅匀料汁备用。
另一个碗中加入鸡肉、鸡蛋、1/2料汁和压碎的丽滋饼干，搅拌均匀。
空气炸锅用箔纸碗铺底，加入肉饼混合物，将剩余的料汁均匀的倒在上面。
350°炸40分钟，最好在米饭上食用。
在外观呈金黄酥脆后出锅，切块盛盘。', '操作时，需要注意温度以免烫伤。', './空气炸锅照烧鸡饭.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (164, 0, '水产', e'咸
鲜
辛辣', '大展身手', '15', '红烧鱼头', '红烧鱼头是一道色香味俱全的佳肴，通过精心处理鱼头并运用多种调料烧制而成。', e'鱼头一个
大葱200g
姜80g
蒜瓣3 - 4个
美人椒1/4个
香菜4棵
八角两个
干辣椒五个
油
盐
鸡精
生抽
老抽
陈醋
黑胡椒粉
料酒', e'原材料准备：葱、姜、蒜、香菜、美人椒分别清洗干净。干辣椒与八角稍微冲洗即可。大葱切两半，后半段大葱切段，每段长度约4cm，前半段先切段，再将每段劈为四瓣。姜切片，每片厚度约3mm。大蒜拍碎。拿出两棵香菜去根，切为1.5cm香菜碎。将美人椒切为厚度为3mm的辣椒圈。干辣椒切四段。
腌制鱼头：将鱼头去鳞，清洗鱼头处未被清理干净的内脏，剁去鱼鳍、清理鱼鳃，将鱼头下巴与鱼身连接的地方剁开，鱼身剁块，鱼头剁成四/六瓣，清洗好鱼块，放入盆中，加入5g盐、10g生抽、10g料酒，放入葱（前半段切碎的那个）、1/3姜片，拌匀，静置1 - 2小时。
最终步骤：加入30ml油，锅热后关火至小火，放入姜片，慢慢翻炒至姜片大部分汁水被炒出呈金黄色，放入葱段，翻炒至葱段略显发白，放入蒜碎、八角、干辣椒，翻炒5秒，将腌制好的鱼头倒入锅中，翻炒2 - 3分钟，倒入500ml清水，加入2g盐、3g鸡精、5g生抽、3g老抽、5g料酒、2g黑胡椒粉、3g陈醋，放入两棵香菜，盖上锅盖，调至大火将水烧开，调至中火慢焖入味，当汤汁减少一半时，打开锅盖，调至大火收汁，汤汁剩余1/3时，关火盛至小盆中，将锅中的汤汁均匀淋到鱼头上，盛盘时将锅中煮的香菜放入小盆底部，把切好的美人椒圈放在香菜之上。', e'如果没有使用过菜刀剁过肉类食物，不推荐使用该菜单，操作中锋利的菜刀可能会划伤手指，要小心。尽量另准备一把刀片厚度在5 - 7mm的廉价菜刀用于剁鱼。腌制鱼头时要确保洗净血水并充分拌匀调料。烧制过程中注意火候的调整，避免烧糊。
盛盘时注意将汤汁均匀淋在鱼头上，并把香菜放在合适位置，以保证菜品美观和口感。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (165, 0, '汤与粥', '鲜', '得心应手', '10', '番茄牛肉蛋花汤', '番茄牛肉蛋花汤是一道营养丰富、口感鲜美的汤品。牛肉提供蛋白质等营养，番茄富含维生素，鸡蛋增加了汤的丰富度，多种食材搭配，经过简单处理和烹饪步骤，煮出的汤味道鲜美，营养均衡。', e'牛肉（按150g/人准备）
番茄（按1个/人准备）
鸡蛋（按1个/人准备）
葱
姜
蒜
盐（按2g/人准备）
胡椒粉（按0.5g/人准备）', e'将牛肉切成薄片，番茄切成小块，葱切成葱花，姜切成姜片，蒜剁成蒜泥。
把牛肉放入碗中，加入盐、胡椒粉腌制15 - 20分钟。
加水煮开，加入姜片和牛肉片，煮至牛肉变色。
加入番茄块，煮至番茄变软。
打散鸡蛋液，缓慢地倒入锅中，用筷子搅拌形成蛋花。
加入盐和胡椒粉调味。
最后加入葱花，即可出锅。', e'可以根据个人口味加入一定的醋或糖来调整口感。
如果喜欢辣味，可以加入一定的辣椒或辣椒酱来调味。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (166, 0, '汤与粥', '鲜', '小试牛刀', '63', '玉米排骨汤', '新鲜的排骨除了拿来烧或者炖之外，还可以用来煲汤，搭配玉米和胡萝卜煲出来的汤非常鲜美。', e'排骨500 - 800g
玉米一根（可多一根）
胡萝卜一根（可多一根）
生姜
大葱小半根
香葱一根
食用油10ml
黑胡椒粉4g
料酒10ml
醋10ml
食用盐10 - 15g
开水1000ml', e'备菜：大葱切成3 - 4cm的大段，用刀背拍一下；玉米剁成小块；胡萝卜切成滚刀块；生姜去皮切大片；新鲜的排骨砍成小块。
排骨凉水下锅，放入大葱、生姜、料酒开始焯水，大火烧开，撇去浮沫，捞出排骨，沥干水分。
热锅凉油，切大片的生姜和排骨一起下锅煸炒，待排骨表面微微焦黄，放入醋，继续煸炒一分钟。
冲入开水，一次给足，大火烧开。
先下入玉米，放入胡椒粉，盖盖小火炖二十分钟，然后放入胡萝卜，盖盖继续小火炖四十分钟。
出锅前三分钟，除了盐什么都不用放，最后撒上一把小葱花即可。', '', './玉米排骨汤.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (167, 0, '汤与粥', '鲜', '大展身手', '45', '排骨苦瓜汤', '排骨苦瓜汤是一道味道鲜美且容易烹饪的汤。不过汤的烹饪时间都较长，一般来说最好提前4个小时开始进行准备。', e'排骨250g到500g
苦瓜100g到200g
虾皮5g到15g
生姜5 - 10g（可选）', e'排骨洗净，切到约4cm ±2cm * 3 ± 2cm的小块（如没有剁排骨的工具，可以求助摊主）。
炒锅倒入冷水700ml和排骨一起加热至煮沸，关火捞出排骨。
苦瓜中间切为两半，清除干净内部的种子和苦瓜瓤，切为0.5 ± 0.3cm的苦瓜条，洗净。
若使用汤锅：汤锅倒入水1100ml和排骨，大火；等待水沸腾后将苦瓜和虾皮下锅转小火，放等待120 - 240分钟（在120分钟之后可以捞出一块肉进行品尝，若肉可以较为轻松的从骨头上分离即可关火）；出锅时加盐和白胡椒，推荐量为每250ml 0.3到0.6g盐，0.1到0.5g白胡椒。
若使用电压力锅：倒入1000ml水和排骨，虾皮和苦瓜；选择炖汤功能，进行烹饪（一般为加压烹饪45分钟）；出锅，和汤锅一样进行加盐和胡椒。', e'可以使用其他带有鲜味的食材代替虾皮，如瑶柱。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (168, 0, '素菜', '辛辣', '得心应手', '7', '手撕包菜', '手撕包菜是一道色香味俱全的汉族名菜，属于湘菜系。', e'包菜1颗
五花肉200g
小米辣2根
食用油60ml
料酒5ml
生抽5ml
香醋5ml
鸡精2g
姜2片
蒜头2粒
蒜苗0.5根
盐5g', e'1. 包菜对半切开，去掉中间白色部分。
2. 手撕包菜，碗中放入2g盐，清洗包菜并沥干备用。
3. 姜片、蒜头、小米辣、蒜苗处理后备用。
4. 五花肉切片，清水清洗后备用。
5. 锅中加入30ml食用油，倒入包菜翻炒，大火翻炒1分钟后，加入3g盐，继续翻炒2分钟后取出备用。
6. 锅中加入30ml食用油，倒入五花肉，大火翻炒1分钟。
7. 倒入姜片等材料，翻炒1分钟。
8. 倒入包菜翻炒后，加入香醋、料酒、鸡精、料酒，大火继续翻炒，2分钟后出锅。', e'1. 步骤五中，翻炒时间需要实际情况做调整，一般是炒到包菜七分熟后即可。七分熟是指包菜已经出水质感变软。
2. 步骤五中，加盐的作用是锁住包菜水分的同时，给包菜上一点味道。
3. 最后一个步骤中，翻炒时间根据实际情况和个人口感做灵活调整。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (169, 0, '荤菜', e'鲜
甜
酸
咸
辣', '大展身手', '6', '鱼香肉丝', '鱼香肉丝是一道经典川菜，具有咸、甜、酸、辣、鲜、香等特点，口感丰富，味道浓郁。', e'里脊肉200g
胡萝卜100g
青椒100g
木耳（干）5g
生抽10ml
料酒5ml
蛋清1个
淀粉10g
醋15ml
白糖10g
盐5g
姜20g
葱20g
蒜2瓣
豆瓣酱15g', e'制作腌料：将生抽5ml、料酒5ml、淀粉5g、水20ml、蛋清1个混合。
制作香汁：将生抽5ml、醋15ml、白糖10克、盐1克、淀粉5g、水20ml混合。
用腌料腌制里脊肉15 - 30分钟，抓匀。
干木耳泡4个小时，洗净，切成小块。
青椒洗净，去蒂，切成丝。
胡萝卜洗净，切成丝，焯水。
姜、蒜切沫，葱切成5mm的小段。
将锅烧热，加入15ml油，倒入腌肉，快速滑散至变白，盛出备用。
将锅烧热，加入5ml油，倒入全部葱、姜、蒜、豆瓣酱。
倒入全部胡萝卜，翻炒20s后，放入青椒和木耳，翻炒2分钟。
倒入炒过的肉，快速翻炒均匀，不要炒超过20秒。
倒入香汁，快速翻炒均匀，不要炒超过15秒。
关火，盛盘。', e'腌制肉时要抓匀，让肉充分吸收腌料。
炒肉时要快速滑散，保持肉质鲜嫩。
各种材料的翻炒时间要掌握好，避免炒老。
按照提供的焯水链接学习正确的焯水方法。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (170, 0, '汤与粥', '鲜', '得心应手', '35', '昂刺鱼豆腐汤', '昂刺鱼豆腐汤刺少肉嫩，营养丰盛，适合任何年龄的小伙伴', e'昂刺鱼或沙光鱼一条
豆腐100g
香葱一根
姜一块
胡椒粉3 - 5g
食用油15ml
料酒适量
食用盐10 - 15g
开水1L', e'鱼处理好后洗净，特别注意肚内的血丝，不洗干净会有腥味，放入大碗中，倒入料酒、10g姜片、5g盐，腌制15分钟。
豆腐切块，放入凉水浸泡5分钟，捞出备用。
煎鱼前，先用生姜片擦一下锅防止粘锅，倒入油（油量为15ml * 鱼的条数 ），烧热后放入鱼煎2 - 3分钟，期间需要晃动一下鱼，防止粘底，且需要翻一次身。
待鱼全部煎好之后，倒入开水、5ml料酒、姜片，小火转至大火，盖上锅盖、大火煮10分钟（水要稍微多一些，后面会蒸发掉一些）。
见汤变白后倒入准备好的豆腐，调中火再煮5分钟，加入10g盐、3g胡椒粉调味，最后撒上葱花出锅。', e'鱼肚内的血丝一定要洗净，否则会影响汤的腥味。
煎鱼时用生姜片擦锅可有效防止粘锅。
煮鱼时水要加够，避免中途加水影响汤的味道。', e'./沙光鱼豆腐汤.jpg
./昂刺鱼豆腐汤01.jpg
./昂刺鱼豆腐汤02.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (171, 0, '主食', '鲜香', '大展身手', '10', '炒河粉', '炒河粉是一道美味的主食，其做法多样，口感丰富。通过合理搭配食材和调料，能制作出鲜香可口的炒河粉。必备原料包括炒河粉、猪肉或牛肉，以及多种蔬菜和调料。制作时需先准备工作，处理好各种食材，然后热锅炒肉，再炒制河粉，最后进行点缀装盘。个人口味可根据自身情况调整调料用量，喜欢辣椒的也可自行添加。', e'炒河粉
猪肉/牛肉
盐
味精
老抽
生抽
孜然粉（或河粉料）
胡椒粉
黄瓜
面筋块
绿豆芽
鸡蛋
蒜瓣
小葱
淀粉', e'小葱切碎（葱白和葱叶分开）、蒜瓣拍碎，丢案板上备用。
打碎鸡蛋，捞一点蛋清到一只碗中，剩下的丢入另一只碗中备用。
将绿豆芽放入锅中，大火煮60秒。豆芽捞出，过凉水，放入盘中备用。
黄瓜切丝放入盘中备用，可和豆芽丢一起。
处理面筋，单独丢一个盘中。
肉切细条状，加入淀粉与刚刚碗中的鸡蛋清、胡椒粉，顺时针拌匀。
注：超市购买来的凉皮表面一般会有食用油，可以使用自来水清洗。面筋同样。
注：清洗面筋之后，请用手将面筋中的大量水分挤出（不需过于用力）。
加入食用油，锅热倒出。
倒入处理好的肉，翻炒均匀至变色，倒入碗中备用。
趁锅热，加入20g食用油（高血压人群可降低用量），倒入葱白、蒜爆炒出香。
加入河粉，淋入老抽提色，翻炒均匀后再加入河粉炒料，继续翻炒。
河粉即将透明时，放入炒制好的肉丝与面筋，并加入生抽提鲜，简单翻炒两次。
加入豆芽与黄瓜丝，翻炒至河粉完全透明。
关火！
撒入葱叶点缀，把锅端起。
倒入盘中，开始干饭。', e'个人口味根据地区、天气、时间均有不同，调料的具体使用量请据个人情况而定，喜欢辣椒的可以自行添加。
超市购买来的凉皮表面一般会有食用油，可以使用自来水清洗。面筋同样。
清洗面筋之后，请用手将面筋中的大量水分挤出（不需过于用力）。
高血压人群炒河粉时可降低食用油用量。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (172, 0, '主食', '辛辣', '得心应手', '1', '炒凉粉', '炒凉粉是一道流行于山西、陕西地区的特色小吃，入口滑嫩，老少皆宜。', e'凉粉500g
玉米油10ml
大蒜10g
香葱15g
豆瓣酱15g
生抽20ml
老抽10ml
食盐5g
十三香5g
中粗辣椒面15g
矿泉水20ml', e'凉粉改刀切麻将块大小。
开小火，起锅烧油，锅烧微热后，下入蒜末爆香后加入豆瓣酱炒出红油。
将凉粉块下入锅中，翻炒10秒。
加入生抽提味，老抽上色，翻炒均匀后加入辣椒面继续翻炒均匀。
加入食盐、十三香继续翻炒10秒。
加入准备好的矿泉水，再次翻炒10秒，待汤汁浓稠后，关火出锅装盘。
撒上葱花即可完成。', '选择凉粉时最好选用豌豆淀粉制作成的凉粉，条件不允许的话红薯淀粉或其他也可。', './chaoliangfen.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (173, 0, '素菜', '鲜', '轻松上手', '15', '陕北熬豆角', '陕北熬豆角是一种对初学者极其友善的菜，因其制作方式使用`熬`的方式，食材可多可少，可有可无，几乎不存在失败的可能性。', e'豆角300g
土豆1个
西红柿1个
螺丝椒（可选）2个
盐6g
生抽6ml
五香粉3g
蚝油6ml
葱3圈
姜2g
蒜2颗
香菜碎（可选）根据口味加', e'葱切花，蒜切沫，姜切丝，备用。
豆角去筋，切2-10cm小段，备用。
土豆去皮，切1cm³小块，备用。
西红柿去皮，切1cm³小块，备用。
辣椒去仔，切0.15cm宽条，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱姜蒜，翻炒至闻到葱姜蒜香味；
加入豆角，翻炒至变色（青绿色变为翠绿色）；
加入土豆块，翻炒30s；
加入热水（水面刚刚漫过菜），盖上锅盖熬至土豆变软（可以用筷子确认）；
加入西红柿块，加入盐，生抽，蚝油，五香粉，辣椒，熬至西红柿成汁（注意搅拌，防止糊锅）；
加入香菜碎，出锅。', e'加入西红柿后开始继续熬制后，需要偶尔翻搅防止糊底
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (174, 0, '主食', '咸', '小试牛刀', '1', '热干面', '热干面是武汉最出名的小吃之一，有多种配菜搭配，口味丰富，深受大众喜爱。', e'热干面特有的碱水面250g
小葱10g
酸豆角20g
肉末30g
蒜水30ml
肉汤汁30ml
萝卜干50g
芝麻酱40ml
辣椒油0 - 10ml
胡椒粉0 - 10g
酱油5ml
食盐3g
鸡精0 - 3g', e'水煮沸，加入碱水面，焯烫25秒钟捞起。
撒上食盐、鸡精和胡椒粉。
芝麻酱用90ml水稀释，搅匀，然后加入。
加入5ml酱油，加入30ml肉汤汁和蒜水。
加入萝卜干，肉末，酸豆角，葱花。
拌均匀后开吃。', e'辣椒油可根据个人口味添加。
制作过程中注意控制碱水面的焯烫时间。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (175, 0, '主食', '', '轻松上手', '5', '煮泡面加蛋', '煮泡面加蛋是能满足于各种人群的生存基本需求的重要主食，其材料方便易得，做法简单易上手且制作周期极短。', e'泡面 1 包
鸡蛋 1 个
水 550ml - 1000ml', e'先将水加热至沸腾（火候不做严格要求，使用热水会更快）
将取出的面饼放入锅中
将泡面里附带的佐料放入锅中
取出筷子轻微拨动泡面，使佐料充分溶解，面饼充分浸泡受热
盖上锅盖等待约 1 分钟至锅内水再次沸腾
去壳鸡蛋，加入锅中
等待约 3 至 4 分钟，即可', e'本指南中的鸡蛋包括但不仅限于：生鸡蛋，熟鸡蛋，卤蛋等
原材料泡面可在楼下便利店购买
可根据个人需要加入佐料，和其他食材包括但不仅限于：火腿肠，生菜，小肉丝，辣条，鱼干，虾仁，鸡腿', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (176, 0, '主食', '辛辣', '轻松上手', '7', '麻辣减脂荞麦面', '这道麻辣减脂荞麦面做法简单，无需厨艺基础，一份298千卡，兼具美味、便宜与减脂功效，20分钟即可完成。', e'半干荞麦面100g
娃娃菜8片（共150g）
生菜6片（共80g）
火锅底料25g
花生酱15g
全脂牛奶150ml
生抽6ml
辣椒油10ml
醋20ml
花椒油10ml
水500ml', e'娃娃菜、生菜洗好，备用。
锅内倒入500ml水，开大火，将荞麦面和娃娃菜放进去，等待水沸腾。
水沸腾后，转小火，加入火锅底料、花生酱、牛奶、生抽、辣椒油，水开后煮5分钟。
加入生菜，再煮2分钟。
加入醋、花椒油，关火，直接端着小锅开吃。', e'一定要选半干荞麦面，口感最好。
可以随意添加其他东西，比如火锅丸、蛋饺等。
火锅底料、花生酱、牛奶一定要加，口味三大巨头。
如果不能吃酸，可以不加醋。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (177, 0, '主食', '', '轻松上手', '5', '火腿饭团', '一道富含碳水、蛋白质和维生素的美食，制作难度简单，好吃又营养。', e'火腿 100g
米饭 125g
水 90ml
冷冻青豆 30g
冷冻玉米粒 30g
海苔碎 10g
喜欢的沙拉酱 20g
食用油 10 - 15ml', e'将米饭和水放到电饭锅里，点击米饭模式，等待完成。
冷冻玉米粒和青豆放到锅里，加水没过所有食材，沸腾后静待 2 分钟后，捞出。
火腿切成 1cm 的方块。
与此同时，加入 10ml 食用油，加入火腿翻炒至火腿上色。
将米饭，火腿，海苔碎，青豆，玉米粒，沙拉酱放入碗中，混合均匀即可。
装盘（如果有的话）。', e'沙拉酱的用量可以根据个人口味酌情调整。
可以尝试混合不同的沙拉酱。', './饭团.png', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (181, 0, '主食', e'甜
辣', '小试牛刀', '10', '韩式拌饭', '韩式拌饭是一道融合了米饭、丰富配菜和特色酱汁的美食，将各种食材搭配在一起，搅拌均匀后食用，口感丰富，令人满足。', e'米饭1碗 (400g)
鸡蛋1颗
火锅牛肉卷6卷 (60g)
豆芽1把 (80g)
蘑菇50g
胡萝卜1/4根
西葫芦50g
韩式辣酱25ml
雪碧2瓶盖 (20ml)
芝麻10g
芝麻油20ml
生抽15ml', e'蔬菜清洗后切丝，放入锅中翻炒至变软后盛出。
煮水，水沸腾时焯牛肉卷，约三分钟后捞出。
煎溏心蛋。
将米饭放在碗里，然后倒扣在大碗中。
把准备好的蔬菜和肉卷依次绕圈放在米饭上面，将煎蛋放在中间。
准备酱汁：将10ml韩式辣酱、5ml生抽、两瓶盖雪碧、10g芝麻、5ml芝麻油混合搅拌，可根据口味再加生抽和盐。
将备好的酱汁倒在摆好盘的碗中。', e'如果对外观有一定要求，可以用砂锅代替普通碗。
减肥的话，可以放无糖雪碧。', './韩式拌饭.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (182, 0, '素菜', '咸', '大展身手', '15', '红烧茄子', '这是一道美味的素菜，以茄子为主料，搭配多种蔬菜烧制而成，味道鲜香可口。', e'青茄子：份数 * 0.7个
青辣椒：份数 * 0.5个
洋葱：份数 * 0.3个
西红柿：1个
大葱：半颗
大蒜：3瓣
鸡蛋：1个
面粉：青茄子数量 * 150克
淀粉：面粉 / 4克
酱油：茄子数量 * 7克（向上取整）
盐：适量', e'1. 青茄子、青辣椒、西红柿、洋葱、大葱洗净。
2. 大葱切5毫米宽的葱花，大蒜扒皮并拍碎，西红柿切6立方厘米的块，青辣椒、洋葱切5g的块。
3. 茄子切菱形块（先切2公分厚的片，然后再把片切成2公分的条，最后斜刀切块儿...）。
4. 将面粉倒入盆中，依次加入少量水，搅拌均匀，呈粘稠糊状。
5. 加入淀粉，加入30克水，搅拌均匀。
6. 将鸡蛋打到盆中，加入（面粉 / 20）克的盐，搅拌均匀。
7. 将茄块倒入面糊中，搅拌使茄块的每一面都能沾上面糊。
8. 开大火，热锅，加入500毫升的油，当能看到锅里的油冒出一丝烟时，调至小火，将茄块用筷子夹入到油锅，待所有的茄块下锅之后，调至中火，直到茄块变金黄色时捞出，将油倒出。
9. 加入（份数 * 5）g的油，放入大蒜、葱花，翻炒15秒，放入青辣椒块翻炒30秒，放入西红柿翻炒30秒。
10. 放入炸好的茄块，加水面高度为锅内食材的0.8倍。
11. 放入酱油和（份数 * 3）g的盐。
12. 等待，直到汤汁呈粘稠状（水位大概为剩余食材高度的0.2 - 0.3倍），开盖，盛出菜，关火。', e'在操作的第4 - 6步骤中要注意顺序执行，否则会有灾难性错误。
炸茄块时注意控制油温，避免炸糊。
烧制过程中注意观察汤汁浓稠度，适时调整火候。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (183, 0, '主食', '辛辣', '得心应手', '5', '老友猪肉粉', '老友猪肉粉是一道具有特色的美食，以米粉为主食，搭配猪肉等食材，口味独特。', e'米粉250g
猪肉50g
酸笋50g
剁椒15g
豆豉30g
大蒜10g
料酒10 - 20ml
生抽15ml
白糖5g
米醋5ml
盐5ml
油15ml
生粉15ml
胡椒粉10ml', e'将全部猪肉用料酒、盐、生抽、生粉、胡椒粉倒在一个碗里调味，备用。
热锅不放油，下全部酸笋把水份炒干，炒干的酸笋中间留点空间。
放入10ml - 15ml食用油与全部大蒜、剁椒、豆豉到炒干的酸笋中间，全部推到中间炒出香味。
放入全部调味好的猪肉，持续放入10ml生抽炒一分钟。
放入5ml米醋、10ml生抽、450ml清水一起煮开。
水煮开后，放入温水泡好的米粉，继续煮3分钟就可以盛盘。', '米粉必须用50度的温水泡半小时才好吃，没泡过的很难吃。', './老友猪肉粉.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (184, 0, '主食', '鲜香', '轻松上手', '20', '芝麻烧饼', '芝麻烧饼，外酥里软，简单易做。', e'300克面粉
3克酵母粉
3克白糖
180克40℃温水
20克食用油
30克面粉
2克盐
4克十三香
20克食用油
白芝麻', e'制作面团：将300克面粉、3克酵母粉、3克白糖、180克40℃温水、20克食用油混合，醒面10分钟。
制作油酥：在小碗中放入30克面粉、2克盐、4克十三香、20克食用油，拌匀后静置。
做饼：把面团擀成长方形，抹上调好的油酥，从一头卷起，切成7个面剂子，对折，用虎口收拢，先沾水再沾白芝麻，擀成小圆饼。
烙饼：将电饼铛预热，倒入凉油（锅底铺满油），将擀好的饼放入电饼铛中，在饼的上方也刷点油，涂抹均匀盖上盖子，选大饼档，听到叮的一声出锅即可。', e'如果没有电饼铛，也可以用平底锅。
芝麻如果没有也可不用，一样好吃。', './芝麻烧饼.jpg', '7', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (185, 0, '素菜', '鲜', '得心应手', '5', '地三鲜', '地三鲜是一道以茄子、土豆、尖椒为主要食材，通过煎炸、炒制等烹饪方式制作而成的传统东北名菜。其口味鲜香，营养丰富。', e'茄子100g
土豆150g
尖椒3 - 4个
葱3g
姜10g
蒜10g
豆瓣酱20ml
生抽10ml
盐8g
糖10g
淀粉20g', e'土豆洗净、去皮。茄子、尖椒洗净。
葱切0.5cm小段，蒜剁碎，姜切末。
茄子、土豆、尖椒均切成15g的小块。
热锅，加入25ml油。
加入土豆，煎炸大约3分钟，至金黄色8分熟捞出，留下油。
加入茄子，煎炸大约40秒，至金黄色7分熟。若锅内没油，补充15ml油。
放入葱、姜、豆瓣酱、生抽、盐、糖。
放入之前处理的土豆和尖椒，翻炒1分钟。
放入蒜，加入200ml水和20g淀粉。
待水开后，汤减少一半时，关火盛盘。', e'煎炸土豆和茄子时要注意火候和时间，避免炸糊。
根据个人口味可适当调整盐、糖等调料的用量。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (186, 0, '素菜', e'鲜
咸
酸', '轻松上手', '4', '凉拌木耳', '凉拌木耳是一道制作简单且健康的菜品，利用发放物资中的木耳制作而成，烹饪方式相对简单', e'干木耳20g（或湿木耳120g）
蒜瓣2 - 3个
小米辣2个
盐2g
白糖5 - 10g
生抽15ml
醋15ml
香油5ml
芥末约2cm（可不用）', e'若用干木耳，泡发约45分钟，水量约400ml；湿木耳跳过此步骤。
泡发好的木耳去根并彻底洗净。
起锅烧水，水开后放入木耳，大火煮1.5 - 2分钟。
将蒜瓣、小米辣切碎放入碗中，依次加入盐、糖、生抽、醋、香油、芥末。
木耳盛出后沥水，放入碗中搅拌均匀，端盘。', e'调味品数量可根据个人口味调整，不喜欢芥末可不加。
木耳冷却15分钟左右入味更佳。', e'./1.jpg
./2.jpg
./3.jpg
./4.jpg
./5.jpg
./6.jpg
./7.jpg
./8.jpg
./9.jpg
./10.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (187, 0, '主食', e'酸
辣', '轻松上手', '8', '酸辣蕨根粉', '酸辣蕨根粉是一道适合初学者的简单易做的凉菜，可做主食，以酸辣口为主。', e'蕨根粉
油泼辣子
酱油
香醋
小米辣（可选）
蒜（可选）
葱（可选）
盐
糖', e'锅中加入约为深度3/5的水，烧开；水沸腾后加入蕨根粉，中小火煮8分钟，出锅。
根据配比，加入酱油、醋、油泼辣子，用筷子蘸取，尝一口；如果觉得此时酱油味稍浓，加入准备好的盐；如果觉得此时不够鲜，加入准备好的糖，充分搅拌至大部分颗粒状调料溶解。
取一个碗，加入上一步调制的酱料，将蕨根粉过冷水后放入酱料中，充分搅拌，将准备的葱、蒜、小米辣切碎后撒在粉上。', e'葱姜蒜为附加调料，加入可以增添风味，不加也并无大碍。
糖和盐根据个人口味，需要加入的具体量不同，请酌情加入。
建议使用碗作为最终装盘餐具，因为使用盘子会使吃粉变得困难一些。
整体口味偏辣，如果不能吃辣请减少油泼辣子的量并且不加入小米辣。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (188, 0, '素菜', '鲜', '轻松上手', '10', '金针菇日本豆腐煲', '金针菇日本豆腐煲是一道容易上手的日常料理', e'金针菇1-2把
日本豆腐2袋
小米椒3-5根
蒜2-3瓣
生抽15ml
蚝油5ml
老抽3ml
糖3g
食用油10-15ml', e'豆腐切片，小火煎到两面金黄出锅备用。
切蒜成蒜末；将生抽，蚝油，老抽，糖，100ml水调汁备用。
热锅放油，油热放小米椒、蒜末爆香，先放金针菇，炒软，把煎好的豆腐平铺在金针菇上，倒入配好的料汁，焖5分钟，大火收汁。', e'金针菇一定要先炒软
豆腐尽量不要翻炒，容易碎', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (189, 0, '素菜', '鲜', '轻松上手', '1', '水油焖蔬菜', '水油焖蔬菜中添加了油，提升了口感，还可提升脂溶性维生素的摄入，相比生吃蔬菜好处更多。', e'叶菜类蔬菜300g - 500g
食用油
盐3g
蚝油3ml（可选）', e'洗净蔬菜。
锅中加入150ml水，并烧开（水不需要能完全没过蔬菜）。
加入3g盐。
（可选）加入3ml蚝油。
加入2ml食用油。
下菜，翻拌一下，然后盖上锅盖焖1分钟。
盛盘。', e'不确定咸淡的情况，可以先少放盐，在出锅前尝味，考虑调整加盐。
可以用鸡汤、骨头汤等替代水，更好吃。
焖的时间不可过长。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (190, 0, '主食', '鲜', '轻松上手', '17', '微波炉腊肠煲仔饭', '程序员单身汉居多，做再多菜也可能吃不完，一份简单的腊肠煲仔饭正合适。使用微波炉烹制仅需15分钟，既营养又美味，是一道简单且细腻的主食。', e'米200ml
腊肠1根
鸡蛋1个
红萝卜1个
盐
油15ml
生抽10ml
香葱1颗', e'将米淘洗干净后倒入饭碗内，加入400ml的水，盖上盖。
放入微波炉，高火，6分钟，煮饭途中准备原料：切好腊肠、洗好青菜、切好红萝卜片、切好葱花、青菜碗中放入青菜、红萝卜片，倒入10ml油，放入5g盐、小碗中倒入10ml生抽、5ml油。
6分钟后，用毛巾或隔热手套取出碗，此时米饭已经八分熟。
在米饭上摆入切片的腊肠，继续高火2分钟。
取出腊肠饭，放入青菜碗，高火4 - 5分钟。
在腊肠饭上摆好青菜，磕入鸡蛋，看个人喜好继续高火40 - 60秒。
取出腊肠饭，此时已经基本完成。
将小碗放入，继续高火30秒。
在腊肠饭上淋上叮热的生抽，撒上葱花即可。
多余的青菜可以沾着酱油吃。', e'使用微波炉专用碗更安全。
注意取出碗时用毛巾或隔热手套防止烫伤。', './微波炉腊肠煲仔饭.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (191, 0, '素菜', e'甜
酸', '轻松上手', '10', '糖拌西红柿', '新鲜可口，制作简便，营养价值高，适合夏季食用，家庭餐桌上的一道美味凉菜。西红柿含有大量的维生素C，做法简单几分钟就可完成。', e'西红柿2个
白砂糖20g', e'用刀将西红柿皮米字型划开。
用筷子插入西红柿的菊花，在燃气上转动烤10秒（或用开水冲30秒），直到西红柿皮卷边。
去掉西红柿皮。
将西红柿沿纹路切成大块，去掉头部根蒂部，备用。
全部切好后，将西红柿在盘子中均匀码一层。
撒上白糖，重复上面一步直到全部西红柿放完。
放入冰箱冷藏10分钟。', '在制作过程中，请小心使用刀具。', './火山飘雪.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (192, 0, '素菜', '鲜', '轻松上手', '1', '芹菜拌茶树菇', '芹菜拌茶树菇是一道简单易做的凉拌菜，富含多种人体所需的维生素和矿物质。', e'闽星茶树菇1瓶
芹菜250 - 300g
香油5ml
蚝油大约7ml
味极鲜3ml
食用盐大约2g', e'若不是芹菜苗，用热水壶烧一壶热水备用；将新鲜芹菜苗或芹菜摘去黄叶清洗备用。
若不是芹菜苗，将芹菜摘去叶子单独放一个盆中，把芹菜茎用刀划成2 - 3毫米宽的芹菜条备用。
将芹菜苗切成4cm的芹菜段备用。
若不是芹菜苗，起锅开火，把热水壶的开水倒入锅中待水起泡沸腾，放入切好的芹菜条焯水，大约20秒放入芹菜叶，5秒后关火全部捞出过凉水备用。
将焯好的芹菜或芹菜苗撒上准备好的食盐、香油、蚝油和味极鲜搅拌均匀。
将茶树菇倒入盆中搅拌均匀。
装盘。', e'焯水时水位需没过芹菜。
芹菜叶太老太硬的话可以不要。', e'./芹菜拌茶树菇成品.jpg
./闽星茶树菇.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (193, 0, '主食', '醇厚', '小试牛刀', '255', '基础牛奶面包', '面包是常见的主食。普通面包需要经过长时间的发酵及和面。但本食谱尽量简化了制作步骤，方便新手上手，并尽量保证其风味。', e'高筋或中筋面粉（尽量使用高筋面粉，但避免使用低筋面粉。所有无特殊说明的“万能面粉”均为中筋面粉）
鸡蛋（不过分要求大小及重量）
糖（如有糖浆是最好的）
干酵母
盐
牛奶或淡奶油或炼乳或奶粉（最好使用奶粉，奶香味十足，但不要使用任何复方奶粉，如成人奶粉或婴儿奶粉，因为化学性质不稳定。同时可以两种奶制品混合使用。尽量避免选用额外含糖的原料，因为实际含糖量会多于本食谱建议加糖量）
黄油或玉米油（如果选用的奶制品含脂量极高可以不加。黄油尽量选用动脂无盐的。豆油可能会有豆腥味，尽量不要使用）
谷朊粉（可选）
香草精（可选）', e'制作酵头：将酵母和30℃的温水用刮刀或厨具混合均匀，静置5分钟。之后与面粉混合，搅拌均匀，此时的酵头应该是特别粘稠的面糊。用布盖上面糊，将面糊放置到温暖的地方进行发酵，时长为45-60分钟。最终的面糊应该是表面有很多气泡的且体积明显增大。
制作面团：将剩下的原料全部与酵头用刮刀混合、搅拌。在搅拌时一定要刮壁，使其充分混合。在形成面团且没有干粉时，用干净的干燥的一只手按压面团，另一只手扶住容器，使其形成一个大的面团，然后倒在面板或硅胶垫上操作。用手掌下部推开面团，然后对折再次推开，直至表面没有干粉结块。这时的面团还不是很光滑。使用喷壶将至少是当前面团三倍大的容器内喷上一层植物油（也可用手涂抹均匀），将面团放入并盖上布，发酵1小时。此时面团应该有原来的两倍大。在面板或硅胶垫上撒上薄薄的一层面粉（可以看见面板或硅胶垫的厚度即可），然后将面团拿出，用手压瘪面团排气。之后使用擀面杖，擀成1cm的厚片。并紧实、不留空隙地从一边卷起来。然后旋转90°，重复步骤4、步骤5。将面包整形，放到垫了硅油纸的烤盘或者涂抹油脂的模具内。注意接缝处朝下。在托盘或模具内，发酵30-45分钟。于此同时，预热烤箱。在面包上用剪子或者刀划开几条缝作为面包的花纹。用刷子刷上蛋液（可选）。放入烤箱，上下火180℃烤制30分钟，然后调165℃再烤10分钟。放凉后装入食品袋内，可保存一个星期。冷冻可保存一个月。', e'注意酵母是否过期，水温是否合适。
搅拌时要刮壁，确保原料充分混合。
按压面团时，用拳头推开面团，然后对折再次推开，将容器壁的面粉全部揉进面团里。
如果面团成型但比较硬，说明水分过少，可以在表面用湿润的手或者喷壶在表面均匀覆盖上水并盖上湿布静置发酵20分钟，如此往复。
发酵后的面团表面应当是有粘性的。如果没有，可在表面用湿润的手或者喷壶在表面均匀覆盖上水并再次发酵20分钟。
不同的烤箱温度不一样，在烤制过程中，要观察面包的颜色和状态，根据情况调整温度和烤制时间。
如果面包表面发苦，说明温度过高，尝试降低5-10℃或减少5-10分钟的烤制时间。
如果外部已经呈焦糖色但里面却没有熟，那么降低5-15℃并延长10-20分钟的烤制时间。
如果面包表面很硬或者开裂很严重，可以用锡纸覆盖面包并在最后十分钟拿开锡纸或者倒扣另一个烤盘并安在最上方的位置，然后在最后10分钟拿开锡纸或烤盘。
当装在食品袋内密闭一晚上后，面包会内部和表面会进一步回软。所以最好的品尝时机是第二天早上。
可以把面包切片进行冷冻，在下次使用时可以放置到常温处等待回温，亦或是直接加热。但千万不要放到冷藏区，在冷藏区面包的水分会迅速流失。', e'./1-1成品.jpg
./2-1设备简介1.jpg
./2-2设备简介2.jpg
./4-1酵头1.jpg
./4-2酵头2.jpg
./4-3酵头3.jpg
./4-4此时的面团.jpg
./4-5转移到容器内.jpg
./4-6成品面包.jpg
./5-1成品.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (194, 0, '荤菜', '辛辣', '大展身手', '42', '杀猪菜', '杀猪菜是一道具有特色的荤菜，以血肠、酸菜、排骨等为主要食材，经过一系列烹饪步骤制作而成。', e'血肠200克
酸菜500克
排骨400克
料酒10克
蒜瓣5个
姜粉5克
干辣椒5个
香叶2片
八角1个
葱结1个
香油10克
菜籽油10克
盐5克
蘸料：辣椒油5克、生抽10克、蒜蓉5克、香油2克
枸杞适量', e'血肠用牙签多扎一些小孔，然后放水中小火煮十分钟，不要让水烧开，保持80度，煮好的血肠切块备用。
排骨放料酒焯水，控干水分备用。
锅内放入菜籽油，放蒜瓣，干辣椒，姜粉炒香。
放入排骨翻炒至表面金黄。
酸菜洗净拧干水分，放入锅中，加入香油翻炒，大火翻炒二分钟。
加入600毫升热水。
转入电压力锅，加香叶，八角，葱结，盐。
浓香模式压40分钟。
到时间后放气开盖。加入血肠和枸杞，盖上锅盖焖二分钟即可，血肠是熟的，不需再加热。
倒入盆中，按照上表调制蘸料。', e'煮血肠时要严格控制水温，防止血肠爆开。
调制蘸料可根据个人口味适当调整各调料用量。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (218, 0, '素菜', '鲜', '轻松上手', '7', '西葫芦炒鸡蛋', '西葫芦炒鸡蛋是一道简单易做的家常菜。简单易购的食材，好吃又下饭。', e'西葫芦500g
鸡蛋3个
西红柿100g
食用油10 - 20ml
食用盐6g', e'西红柿洗净，切成小块，备用。
西葫芦洗净，切成边长约为4cm的菱形，备用。
打三个鸡蛋到碗里，打散搅匀，备用。
热锅，锅内放入5ml - 10ml食用油。
倒入鸡蛋，保持翻炒至鸡蛋成固体，用锅铲分成小块后盛到碗里，备用。
锅内放入5ml - 10ml食用油，倒入西红柿，炒至变软。
倒入西葫芦一起翻炒均匀，放入6g食用盐，将火调小然后等待4 - 5分钟。
倒入备用的鸡蛋，中火翻炒15秒。
关火，盛盘。', '', './西葫芦炒鸡蛋.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (195, 0, '主食', e'辛辣
咸
鲜', '得心应手', '30', '凉粉', '伤心凉粉吃了不会让人伤心的哦！', e'豌豆淀粉100g
大蒜3瓣
小米辣3颗
辣椒粉10g
酱油10ml
醋10ml
白糖3ml
鸡精3g
盐3g
花生碎5g
香菜5g', e'准备食材。
把豌豆淀粉和水各100克混合搅拌。
往锅中倒入600g水，大火煮开后转为小火。
倒入淀粉水，边倒边不断的搅拌，搅拌到浓稠且色泽均匀。
找一个容器，在容器中刷一层薄薄的食用油。
将煮好的淀粉倒入容器中冷藏2-4小时。
冷藏后取出，脱模，切条。
大蒜和小米辣剁成沫，放上10g辣椒粉，5g花生碎，热油搅拌均匀。
再加入10ml酱油，10ml醋，5g白糖，3g鸡精，3g盐搅拌均匀。
将调味料倒在凉粉上，然后撒上香菜即可。', e'制作凉粉的关键在于淀粉水的搅拌，要确保浓稠且色泽均匀。冷藏时间可根据个人口感调整。制作调味料时，可根据个人口味适当增减调料用量。
参考: [制作凉粉的详细步骤](https://www.zhms.cn/recipe/mzvyy.html?source=2)', e'./liangfen.jpg
./lf2.jpg
./lf3.jpg
./lf4.jpg
./lf5.jpg
./lf6.jpg
./lf7.jpg
./lf8.jpg
./lf9.jpg
./lf10.jpg
./lf11.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (196, 0, '荤菜', '鲜香', '大展身手', '120', '商芝肉', '此菜色泽红润，质地软嫩，肥而不腻，有浓郁的商芝香味，是陕西省商县特有的风味菜。因商芝属于陕西特产，此菜原料获取难度较大，不易制作。', e'带皮猪五花肉（去骨）500克
商芝50克
葱10克
姜2克
八角3个
蜂蜜15克
醋5克
料酒15克
味精1.5克
酱油10克
摊鸡蛋皮一张约15克
精盐1克
鸡汤200克
芝麻油10克
熟猪油2000克（消耗约60克）', e'将肉刮洗干净，入煮锅煮至六成熟（变色为白），捞出趁热用蜂蜜、醋涂抹肉皮。
炒锅内放入熟猪油，用旺火烧至八成熟（约200度，油表有大量青烟，油状平静），将肉块皮朝下投入，炸至呈金红色时，捞入凉肉煮锅（之前煮完的煮锅）中泡软，放在案板上，切成三寸(10 cm)长、两分(0.6 cm)厚的片，仍然皮朝下，整齐装入蒸碗内。
将5克大葱切成2.4 cm长的段，5克切成2.4 cm长的斜形片。姜去皮洗净，1.5克切成片，5克切成末，摊的鸡蛋皮切成2.4 cm长的等腰三角形片。
商芝入沸水锅中煮软捞出，去除老茎、杂质，淘洗干净，切成3 cm长的段，放入碗中,加酱油（5克）、精盐（1克）、熟猪油（10克）拌匀，盖在肉片上，另将鸡汤（100克）放入一小碗中，加酱油（5克）、精盐（0.5克）、料酒（15克）搅匀，浇入蒸碗，再放入姜片、葱段、八角上笼用旺火蒸约半小时后，转用小火继续蒸约一小时三十分钟，熟烂后取出，拣去姜、葱、八角，倒、过滤原汁，将肉扣入汤盘。
炒锅内，放入鸡汤（100克），加入原汁，用旺火烧沸，下入姜末、葱片、味精后搅匀，投入摊鸡蛋皮，淋芝麻油，浇入汤盘即成。', e'商芝属于小地方不特别有名的特产，至少本人在其他地方没有见到过，在制作时可换成其他蕨类蔬菜。
对于使用剩余的熟猪油，可以考虑重新收集到油壶。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (197, 0, '主食', '鲜香', '大展身手', '10', '中式馅饼', '这是一道制作中式馅饼的菜谱，详细介绍了必备原料、工具、计算出的原材料比例以及具体的操作步骤，还提供了附加内容和说明。', e'面粉（非自发粉）
肉沫
油
盐
糖
生粉
酱油
风味调料（如鸡粉、孜然、椒盐，可选）
蒜头
大葱
鸡蛋（可选）
胡萝卜（可选）', e'准备原料：取肉沫解冻，加入1/2所有调料（油、盐、糖、酱油、风味调料）和全部的生粉，搅拌均匀，腌制30分钟；将面粉加入碗中，加入鸡蛋，加入剩下1/2所有调料，加入相当于面粉1/2的水，搅拌均匀；蒜头切为蒜末；大葱切段；胡萝卜切末。
烹饪：热锅冷油，宽油起锅；待油烧热后，放入蒜末爆香；加入腌制的肉沫，翻炒，直至断生；将胡萝卜末加入肉沫中一同翻炒，直至油被染为金黄色；关火，冷却2分钟；将炒好的肉沫倒入生面糊中，搅匀；重新开火，平底锅铺底油；调至小火，将面糊倒入锅中均匀铺满，保证厚度不要过高；在饼的表面尚为液态时，撒上大葱段；保持小火，直到底面凝固；将饼翻面，继续小火煎烤，直至另一侧凝固；之后，每一面再额外煎20秒；关火出锅。', e'将肉沫和胡萝卜末加入面糊后，应该尽量搅匀，保证味道扩散到饼内各处。
肉沫和胡萝卜末即馅料可以使用各类熟馅料替代。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (198, 0, '主食', '鲜', '大展身手', '35', '日式咖喱饭', '日式咖喱饭是一道受欢迎的美食，以浓郁的咖喱味和丰富的食材为特色。使用咖喱块搭配土豆、胡萝卜、洋葱和肉类等食材，经过烧煮制作而成。冷藏后的咖喱风味更佳。可搭配米饭食用，还可根据个人喜好添加花椰菜、培根、煎蛋等作为点缀。', e'半盒好侍咖喱块(115g)
洋葱2个
土豆2个
胡萝卜1根
肉2斤
蒜头2 - 3瓣
花椰菜（可选）
培根（可选）
煎蛋或太阳蛋（可选）', e'胡萝卜去头尾，去皮，滚刀切；洋葱剥去外层去芯，切成月牙状；土豆去皮、切大块；肉切块状；剥蒜拍平切碎；咖喱块切碎。
热油锅放入蒜和肉，快速翻炒至肉表面变白；加入胡萝卜，快速翻炒至均匀受热；加入洋葱，快速翻炒至洋葱变透明状；加入土豆，保持翻炒至土豆变软（可用筷子确认）。
加水没过所有食材，沸腾后等待15分钟。
关火，加咖喱并搅拌。
等待咖喱融化后再开火，缓慢搅拌10分钟，防止糊锅，至外观呈粘稠状态关火结束制作。
冷藏的咖喱每次取出需要吃的份量，微波炉单人份高火2 - 3分钟或锅需额外加50ml水，加热时保持搅拌，加热后盖在米饭上。', e'步骤1 - 6可以在2 - 5的等待过程进行，也可在此时用清水锅煮些蔬菜或做个煎蛋。
2 - 5到2 - 6之间，要注意观察沸腾的水位线，如发现低于2/3的食材应加热水至没过食材。
食材用量与咖喱成正比，半盒约六碗份，做好的咖喱在冰箱冷藏后风味更佳。', './成品.jpg', '6', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (199, 0, '主食', '咸', '轻松上手', '200', '炒方便面', '炒方便面是在探究传统煮方便面改良方向后进行的成功尝试，能大幅提升方便面美味程度，简单易做。', e'方便面（用量为1.2包/人向下取整）
盐（用量为鸡蛋用量*2g）
鸡蛋（用量为1.4个/人向下取整）
火腿肠（用量为0.7个/人向上取整）
食用油（用量为10 - 18ml/人）', e'火腿肠预处理：将火腿肠撕开包装，切成宽度1cm的小块。
面的处理：向煮锅中加入300ml水煮沸，加入方便面面饼煮45秒，煮时挑动打散面条，打散后立刻关火，将面汤和面分离，用凉水冲一下面条。
酱料处理：准备小碗，挤入所有菜包、酱包以及50% - 80%的粉包，取出80ml面汤加入小碗搅匀得调料碗。
鸡蛋的预处理：取出计算好数量的鸡蛋打入小碗，每个鸡蛋加2g盐搅拌均匀，热锅20s，加入份数*8ml油，加入鸡蛋翻炒约20s至固态后取出暂存。
最终步骤：热锅20s，增加锅内油到份数*10ml，加入火腿肠翻炒10秒，加入面翻炒30秒，加入调料碗翻炒30秒，加入煎鸡蛋翻炒30秒，关火盛盘，在北京可盛盘后加入1:1兑水稀释的芝麻酱。', e'全部粉包都挤进去会很咸，注意粉包用量。
在北京制作时，芝麻酱太浓稠可1:1兑水稀释。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (200, 0, '荤菜', '鲜香', '得心应手', '33', '小酥肉', '小酥肉是一道美味可口的传统名菜，以其外酥里嫩的口感和浓郁的香味而受到人们的喜爱。', e'去皮猪肉500克
鸡蛋2个
面粉30克
红薯淀粉120克
老姜20克
小葱15克
料酒15克
盐4克
十三香2克
胡椒粉3克
味精5克
鸡精5克
花椒碎3克
花椒粒3克
生抽8克
植物油适量', e'制作葱姜水：老姜切丝，小葱不用切，倒入料酒、清水，用手捏揉5分钟。
猪肉处理：将猪肉去皮洗净，切成8 - 10厘米长、1.5厘米厚的肉条，加入盐、十三香、胡椒粉、味精、鸡精、花椒碎、花椒粒、生抽，倒入葱姜水，抓匀并充分揉制10分钟，封上保鲜膜放冷藏室静置30分钟。
猪肉裹粉：将面粉、红薯粉倒入腌制好的肉中，加入鸡蛋清，充分揉制15分钟。
初炸定形状：锅中倒入植物油，大火将油温加热至150°后转小火，将裹好粉的肉条用筷子夹入油锅中，捋成喜欢的形状，炸3 - 5分钟定型，捞出沥油。
复炸出成品：将油温升至180°放入初炸好的肉条，炸至金黄色捞出。', e'裹粉一定要把红薯粉揉散，不要有干的颗粒裹在里面。
如果肉太多吃不完，可以只炸一遍然后放冰箱，后面再吃的时候拿出来复炸，口感基本没影响。
如果对时间没把握可以稍微多炸一下，否则肉会带一点生味。没有经验可以一条一条的下锅，防止粘连。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (201, 0, '主食', '', '大展身手', '16', '披萨饼皮的做法', '披萨制作总体来说比较简单，稍微有点麻烦也是争议最多的就是披萨饼皮，做好了披萨饼皮喜欢吃什么口味的披萨，直接把准备好的食材放上去烤熟就好，所以这里重点说一下披萨饼皮如何制作。本教程中的饼皮是属于软面团低温隔夜发酵。', e'中筋面粉
水（温水）
安琪干酵母粉
食用盐
橄榄油
白砂糖', e'用准备好的温水把酵母粉化开，稍微搅拌小就好，备用。
取准备好的面粉，依次添加盐、橄榄油、白砂糖。
准备混合水和面粉，边加水边搅拌直至水全部加完。
搅拌至看不到干米粉为止。
用差不多三倍大面团的容器装好，密封，冰箱冷藏（4度）等待8~12小时，一般晚上做第二天就可以用。
观察面团醒发完毕，差不多是原始大小大约两倍算醒发完毕。
取醒发好的面团，均匀分成四份，分别用保鲜膜盖好，备用。
案板撒稍微多一点的干面粉，准备开始揉面。
因为是比较湿的面团，所以粘上干面粉后才没那么粘手，不用揉太多次，面团表面稍微光滑一点就可以了。
用手拉扯，或者擀面杖擀平，也不一定非得擀圆，只要厚度均匀，烤箱放得进去就好。
铺好油纸，放上饼皮，依照个人口味，把准备好的食材放上去，撒上芝士碎。
水果烤箱上180度，下220度，16分钟即可。
肉蔬菜烤箱上200度，下230度，18分钟即可。
挤上沙拉酱或者其他自己喜欢的酱即可享用~', e'一定要注意水的比例。
烤箱品质层次不齐，第一次做注意观察火候对披萨的影响。
一般不特别标注是低筋或高筋面粉，基本都是中筋面粉。
容易出水的水果不能作为食材，比如西瓜、橘子等。', './001.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (202, 0, '素菜', e'鲜
酸
甜', '轻松上手', '10', '雷椒皮蛋', '雷椒皮蛋是一道简单的下饭凉菜，食材常见，操作简便，虽卖相一般，但却是夏天下饭的神器之一。', e'皮蛋2个
长条青椒4根
葱10cm
蒜3 - 4瓣
小米辣3 - 4颗
食用油10 - 20ml
生抽15 - 20ml
陈醋15 - 20ml
白糖6 - 10g
香油5 - 7ml', e'青椒清洗，去除根部，侧面切开，去除内部的子后在案板压平，备用。
葱切成半厘米小段，备用。
蒜去皮，切成碎末，备用。
皮蛋去皮，备用。
小米辣，切成5 - 10mm的小段，备用。
热锅，锅内放入10ml - 20ml食用油。
放入全部青椒，改小火保持锅子温度，煎至青椒变软。
关火，将皮蛋和青椒放入小铁盆中。
可选择用擀面杖的一头在小盆中砸击皮蛋和青椒，至皮蛋与青椒混合；也可将青椒用手撕开，撕成大约半厘米的条状，用叉子将皮蛋压碎。
倒入小米辣、生抽，陈醋，白糖，香油，以及其他未使用的备用食材，均匀搅拌。', e'制作过程中一定要去除青椒子，否则会在锅里炸开。
砸皮蛋和青椒时注意不要吵到邻居。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (203, 0, '荤菜', '醇厚', '大展身手', '180', '带把肘子', '肘肉酥烂不腻，肘皮胶粘，香醇味美，辅佐以葱段，甜面酱，别有一番风味，因脚爪形似把柄，故得其名，是陕西省大荔县名菜。', e'带脚、爪猪前肘 1 个（大约二斤五两 = 1250 克）
红豆腐乳 1 块 = 10 克
甜面酱 150 克
精盐 15 克
红酱油 35 克
白酱油 25 克
料酒 25 克
蒜片 50 克
姜末 10 克
八角 3 个
桂皮 5 克
葱 200 克', e'将肘子刮洗干净，肘头朝外、肘把（脚爪）朝里、肘皮朝下放在案板上。
用刀在正中由肘头向肘把沿着腿骨将皮剖开，剔去腿骨两边的肉（三面离肉），底部骨与肉相连，使骨头露出，然后将两节腿骨由中间用刀背（还是用斧头吧）砸断。
肘子放入煮锅煮至七成熟捞出（外观正常，内部淡红色），用干净抹布擦干水，趁热用红酱油涂抹肉皮。
取蒸锅一个，锅底放入八角、桂皮，先将肘把的关节处用手掰断，不伤外皮，再将肘皮朝下装进蒸锅内，装锅时根据肘子体型，将肘把贴住锅边窝着装进锅内，成为圆形。
撒入精盐，用消过毒的干净纱布盖在肉上，再将甜面酱（50 克）、葱（75 克）、红豆腐乳、红酱油、白酱油、姜、蒜等在纱布上抹开，用旺火蒸大约三小时（以蒸烂为准）。
蒸完取出，揭去纱布，扣入盘中，拣去八角，上桌时另带葱段和甜面酱小碟（或将甜面酱抹到肘面上，另带葱段小碟亦可）。', e'肘子七成熟要根据实际情况判断，有条件可询问家中长辈。
蒸锅下半放水，上半放肘子，蒸时及时加水防止蒸干。
对于使用剩余的调料，可妥善保存下次使用。', '', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (204, 0, '素菜', '鲜', '轻松上手', '1', '菠菜炒鸡蛋', '这道菜难度系数简单，营养丰富。', e'菠菜 350g
鸡蛋 2 个
食用油 15ml
食用盐 5g', e'菠菜去根，洗净，放在篮子里，焯水。
将鸡蛋打入碗中，搅匀。
热锅，加入 10ml 油。
油热后，倒入鸡蛋液，中火翻炒 15 秒，先煎成蛋饼，然后再用锅铲切成小块。
关火，将鸡蛋块盛到盘子中，不要洗锅。
重新开火，倒入 5ml 油，油热后，放入菠菜，大火翻炒 15 秒后，倒入鸡蛋块，翻炒均匀。
加入 5g 盐、100ml 饮用水，大火翻炒 10 秒。
关火，盛盘。', '无', './菠菜炒鸡蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (220, 0, '素菜', '辛辣', '小试牛刀', '6', '小炒藕丁', '小炒藕丁是一道简单易做的菜，莲藕营养丰富，非常适合素食。', e'大葱 1 段
小米辣 1 - 2 根
莲藕 1 段
生抽 30 ml
老抽 15 ml
耗油 15 ml
食用油 10 - 15ml', e'大葱、小米辣切小段，备用
莲藕去皮，切成不超过 3cm 的小块，放入水中备用（防止氧化发黑）
取炒锅，锅内放入 500ml 凉水，煮沸
将藕丁下入沸水中，焯水 2 分钟后，取出放入盘中备用
将锅中水倒掉后，将锅加热干燥，加入 10 - 15 ml 食用油
待油温升高后，下入葱花，小米辣爆香
将处理好的藕丁下入锅中，大火翻炒
加入生抽、老抽、耗油
翻炒 2 分钟即可出锅', e'食用莲藕要挑选外皮呈黄褐色、肉肥厚而白的。如果发黑，有异味，则不宜食用。
请尽量不要使用铁器，会导致莲藕发黑', './小炒藕丁.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (205, 0, '荤菜', '鲜香', '小试牛刀', '110', '简易红烧肉', '这是一道新手不败的菜谱，香糯可口，色泽诱人，肥而不腻，配米饭非常好吃。', e'猪五花肉3 - 4斤
姜6片
冰糖15克
生抽10ml
老抽15ml
料酒5ml
开水600 - 900ml
香叶3片
八角2个
鹌鹑蛋0 - 2个（可选）
豆皮0 - 80g（可选）
盐2 - 3g
葱（白色部分葱白）', e'猪五花肉切大块（约4.5cm ，冷冻半小时至一小时更好切）；豆皮切2cm的宽度；生姜切片（每片厚度约3mm ）；水烧开；鹌鹑蛋煮熟并用叉子/牙签扎孔；准备好大葱白色的部分葱白。
冷水锅中放入切好的猪五花肉，加入料酒与葱姜，煮15分钟去掉血腥。
锅中放入两片生姜提味。
开中小火后直接加入五花肉，不需要放入食用油，每块五花肉六个面都煎一下，煎至出油即可。
将煎出的油倒出备用，并将五花肉推至一边，加入15g冰糖，翻炒至冰糖融化。
融化后将五花肉与冰糖炒至融合上色，加入生抽10ml、老抽15ml、料酒5ml，翻炒至上色。
加入烧好的开水炖煮40分钟（刀工差切得过大请自觉延长炖煮时间），并放入生姜2片、香叶3片、八角2个。
盖上锅盖煮至沸腾后，加入煮好扎好孔的鹌鹑蛋和豆皮，开中小火，等待40分钟。（中途可适当翻搅防止粘锅）。
打开锅盖，待汤汁快没有的时候开大火收汁（切记不可收干）。
加入2 - 3g盐，翻炒一下，即可出锅。', e'如果有可能，请尽量把刀磨的锋利一些。
每次制作前需要确定计划做几份。一份正好够2 - 3个人吃。如果只有1人食用，可以考虑食材减半。
冷冻猪五花肉半小时至一小时更好切。
刀工差切得过大的话请自觉延长炖煮时间。
收汁时切记不可收干汤汁。', e'./000.jpg
./001.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (206, 0, '主食', '', '大展身手', '2', '烙饼', '介绍了烙饼的详细制作过程，包括原料准备、操作步骤等', e'面粉400g
热水130ml（80度）
冷水130ml
油', e'将400g面粉倒入盆中，一半用凉水和面，一半用热水和面，搅拌成面絮，用手揉成团。用保鲜膜封起来，醒面40分钟。
醒好的面不用揉，稍微摁一下，用一横刀一竖刀将其分成四份。
搓圆，擀开，擀成与电饼铛大小差不多的饼，取1/4的油酥，将饼表面涂抹均匀。
沿饼的半径切开，从外圈将其卷成圆锥形，然后将圆锥尾部捏好，防止油酥外漏。
按压面饼圆锥尖的地方，将其压扁，然后再次擀成与电饼铛大小差不多的面饼（厚度约为3mm）。
将电饼铛预热，涂上凉油（热锅凉油），将擀好的饼放入电饼铛中，将饼的上方也刷点油，涂抹均匀（锁住水分），盖上盖子。
大火烙一分钟，打开盖子，将饼翻个面再烙一分钟。
重复以上动作，完成饼的烙制。', '', './成品.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (207, 0, '主食', e'甜
咸', '得心应手', '15', '炸酱面', '炸酱面是一道常见的中式面食，以其浓郁的炸酱和劲道的面条受到人们喜爱。制作时，先将白菜切丝焯水备用，煮面条至断生后盛出，蒜末与肉丁炒熟，加入豆瓣酱和甜面酱焖煮成炸酱，最后将面条、白菜和炸酱拌匀即可。', e'肉丁/肉末（份数 * 150g）
挂面（份数 * 150g）
蒜（份数 * 3个）
白菜（份数 * 3片）
油（份数 * 10g）
豆瓣酱（份数 * 15g）
甜面酱（份数 * 15g）', e'白菜切丝，焯水至软化熟透，盛出备用。
煮面条至断生，连同汤水一同盛出备用。
蒜末，油锅烧热，下蒜末和肉，炒至肉完全熟透。
下豆瓣酱和甜面酱，加30g水盖盖焖煮至收汁粘稠，得到炸酱。
第2步面条倒掉汤水，盛入碗中，加第1步的菜和第4步的炸酱，拌匀可吃。', e'肉推荐瘦肉丁，口感更好，一次买多可分装小保鲜袋冷冻备用，每次取用前30秒微波炉解冻。
面条口感关键在于劲道，勿选龙须等细面，第2步中不要完全煮熟，盛出并在进行后续步骤时，汤水会进一步催熟。
本文以白菜为例，可灵活替换为易获取的各种蔬菜，口感影响不大，以半碗的量为宜。
如有条件且熟练后，第1、2步和3、4步可分时并行执行。
第3/4步可选加干辣椒（= 份数 * 3个）。
甜咸口个人有爱好，两种酱的配比需要自己迭代优化。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (208, 0, '主食', '', '轻松上手', '10', '炒年糕', '闽南风味的炒年糕是一道制作过程简单、原料获取方便的主食，适合海外朋友满足口腹之欲。', e'年糕/白粿250g*份数
葱2根*份数
食用油50ml
酱油15ml
盐1 - 2g*份数
（可选）鸡蛋
（可选）青菜', e'锅中加水烧开，煮熟年糕，碗中加水确保年糕不会粘连，捞起年糕备用。
小葱切葱花（将葱白和葱叶分开），青菜切小段备用。
（可选）制作炒蛋。
热锅，加入30ml食用油。
将葱白倒入锅中，直至大部分葱白变成焦黄色且发出香味，倒出葱油备用。
重新热锅，加入20ml食用油。
加入所有辅料（鸡蛋，青菜等），翻炒均匀。
将年糕的水倒掉，向锅中加入年糕。
加入酱油和盐，翻炒均匀。
关火，加入葱油，翻炒均匀，乘盘。', e'辅料的选择可以根据个人选择酌情添加，如加入瘦肉等
在煮年糕的时候注意搅拌，以免粘锅', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (209, 0, '主食', '醇厚', '轻松上手', '5', '老干妈拌面', '老干妈拌面是一道简单易做的家常美食，只需将煮好的面搭配上老干妈和酱油，搅拌均匀即可享用。', e'面（120克*份数）
老干妈（15ml*份数）
酱油（5ml*份数）', e'1. 将水倒入锅中并煮沸。
2. 将面均匀放入锅中，煮的过程注意搅拌，避免面粘成一坨。
3. 当用筷子挑起一根面且该面能自然地从筷子上滑落时再等30秒关火。
4. 将面夹入碗中。
5. 按照计量放入老干妈和酱油。
6. 用筷子将碗里的面、老干妈、酱油拌均匀。', '煮面时要充分搅拌，确保面条不粘连。掌握好煮面的时间，以保证面条口感劲道。调味可根据个人口味适当调整老干妈和酱油的用量。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (219, 0, '素菜', '鲜', '轻松上手', '5', '蚝油生菜', '这道菜富含维生素，做法简单，尝起来爽口又不上火。', e'生菜1棵（200g±50）
蚝油6 - 8ml
大蒜4 - 5瓣
生抽6ml
盐0.5g
白糖1g
食用油5 - 8ml', e'生菜洗净并去掉烂菜叶。
热锅，先放1L清水（凉），然后在锅内放入2ml - 3ml食用油和0.5g盐，等待锅中的水煮沸。
水沸后，放入生菜，将每一片生菜叶都焯水10s。
捞出生菜，控干水份，摆盘 。
调汁：将生抽10ml、蚝油6 - 8ml、盐0.5g、白糖1g放入碗中调匀，并加入10 - 15ml清水（凉）搅拌均匀。
再开火，热锅，放入食用油5 - 8ml，油热放入蒜泥。
等待有蒜香飘出，倒入调好的汁，煮沸即可，立马关火。
将锅中的汤汁均匀地浇在生菜上。', e'生菜焯水时间不宜过长，10s左右能保持脆嫩口感。
调汁时各种调料的用量可根据个人口味适当调整。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (252, 0, '素菜', '鲜', '小试牛刀', '4', '洋葱炒鸡蛋', '洋葱炒鸡蛋是中国日常生活中熟知的菜品', e'鸡蛋2个
洋葱50g
食用油50ml
盐2g
葱半根
料酒2ml', e'鸡蛋打入大碗中，加入洋葱片、盐后搅拌60S。
起锅烧油，倒入鸡蛋，一面煎炸30 - 45S，翻面继续翻炒，反复2 - 3分钟后散上料酒出锅。
鸡蛋装盘，散上葱花。', e'搅拌鸡蛋时注意力度均匀，确保蛋清和蛋黄充分混合。
煎鸡蛋时控制好火候，避免煎糊。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (210, 0, '荤菜', '辛辣', '大展身手', '10', '冷吃兔', '冷吃兔是一道具有独特风味的川菜，以兔肉为主料，搭配多种香料和辣椒，经过炸制、炒制等工序制作而成。味道香辣可口，兔肉鲜嫩有嚼劲。', e'兔肉
盐（根据兔肉斤数计算用量）
味精（根据兔肉斤数计算用量）
蚝油（根据兔肉斤数计算用量）
料酒（根据兔肉斤数计算用量）
蒜（根据兔肉斤数计算用量）
姜（根据兔肉斤数计算用量）
小葱/大葱/洋葱（根据兔肉斤数计算用量）
干辣椒（辣椒段总体积等于兔肉总体积）
青花椒（3斤兔肉对应一整碗吃饭用的花椒）
八角（根据兔肉斤数计算用量）
桂皮（根据兔肉斤数计算用量）
香叶（根据兔肉斤数计算用量）
山奈（根据兔肉斤数计算用量）
白蔻（根据兔肉斤数计算用量）
小茴香（根据兔肉斤数计算用量）
白芝麻（根据兔肉斤数计算用量）', e'蒜、姜扒皮并剁碎备用，八角、桂皮、香叶、山奈、白蔻、小茴香洗净备用。
干辣椒剪成2厘米的小段，洗净备用。
小葱/大葱/洋葱洗净，洋葱切成小块。
兔肉剁成2厘米的小块，加入盐、料酒、味精调味，腌制15分钟。
锅中倒油，油温4成热下小葱/大葱/洋葱，中小火煸炒出香味，待到小葱/大葱/洋葱微焦，将其捞出。
开大火升高油温，油温8成热时下入兔肉，炸制过程转中小火，炸至兔肉微微焦黄时捞出兔肉。注意油量应淹没兔肉，若未淹没需及时补充。
升高油温，倒入干辣椒、青花椒、八角、桂皮、香叶、山奈、白蔻、小茴香；转小火将辣椒段炸脆。注意辣椒极容易炸糊，要小火，基本等到没太多水气蒸发时，就可以下兔肉了。
重新倒入兔肉，加入蚝油、翻炒几分钟。
关火，加入蒜、姜、白芝麻，翻炒均匀。
放置一夜更加入味。', e'在炸制兔肉过程中注意油量要淹没兔肉，防止炸制不均。
炸辣椒时一定要小火，密切关注辣椒状态，避免炸糊。
使用剩余的食用油可考虑重新收集到油壶。
放置一夜能让冷吃兔更加入味。', '', '', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (211, 0, '素菜', e'咸
鲜', '小试牛刀', '6', '虎皮青椒', '虎皮青椒是一道色香味俱全的特色名菜，以青椒为主要食材，通过独特的烹饪方式制作而成。', e'青椒5个
大蒜2 - 3瓣
油20ml
白糖15g
生抽15ml
香醋15ml
盐4g', e'去掉青椒蒂，用自来水冲洗干净。
青椒切长片，平均一个青椒纵向切成3 - 4片。
大蒜去皮，切成碎末，体积在2mm x 2mm x 2mm。
拿一个小碗倒入20ml油，将大蒜末放入其中。
白糖、生抽、醋、盐全部倒入砵（碗）等容器，搅拌。
将调料1倒入锅中，开火加热5成放入青椒，青椒片不要叠在一起，单独成片放置锅中。
用锅铲不停的按压青椒，合适的时候翻面。
翻炒约2分钟，待青椒表皮出现褶皱时，倒入调料2。
加大火候继续翻炒30s后即可出锅盛入盘中。', e'制作过程中注意控制火候，避免青椒炒糊。
调料的用量可根据个人口味适当调整。', './虎皮青椒.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (212, 0, '素菜', e'鲜
酸', '轻松上手', '2', '凉拌莴笋', '凉拌莴笋是一道开胃小菜，色香味俱全，口感清爽。', e'莴笋 1 根
萝卜 0.25 根
小米辣 2 个
姜 1 片
蒜头 2 粒
盐 5g
食用油 25ml', e'莴笋削皮，切小条。萝卜切条，一起放入大碗，加入盐搅拌，放置 10 分钟
放置后的莴笋用水清洗 1-2 遍
起锅烧水，放入莴笋，水煮 1 分钟捞出，沥干水分，放入大碗
起锅烧油，放入姜片、蒜粒、小米椒煸炒 30-45S ，倒入莴笋中
搅拌充分，端盘', e'萝卜非必须，只是为了增加菜色
端盘后，可以根据个人口味，额外增加生抽、白砂糖、香醋、芝麻等佐料
莴笋条的大小看个人口感决定，但莴笋皮要尽量多削点，不然真的影响口感
冰镇效果更加', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (213, 0, '素菜', '鲜', '得心应手', '5', '茭白炒肉', '茭白味道鲜美，有一定营养价值', e'茭白 2 根
瘦肉 100g
淀粉 15g
食用油 30ml
鸡精 5g
姜 1 片
蒜 1 个
料酒 5ml
盐 2g', e'准备：茭白切片，每片厚度 0.5cm；瘦肉切条，厚度 0.3 - 0.5cm，加入料酒、生粉、盐、水搅拌；姜切片、蒜头剁碎。
制作：起锅水烧开，放入茭白，水煮 60 - 90S 后取出沥干；起锅，倒入 15ml 油，倒入瘦肉，反复翻炒 60S 取出；起锅，倒入 15ml 油，倒入姜、蒜翻炒 30S，加入茭白继续翻炒 30S；继续加入瘦肉翻炒 60S，加入 20ml 水，加入盐、鸡精后翻炒 60S 出锅。', '最后一个步骤，可以考虑加蚝油、生抽代替盐上色。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (214, 0, '素菜', '辛辣', '小试牛刀', '11', '素炒豆角', '一道巨下饭的家常菜', e'豆角250g
小米椒2个
葱3圈
蒜2颗
生抽6ml
老抽2ml
蚝油6ml
盐6g', e'葱切花，蒜切末，备用。
生抽、老抽、蚝油、盐混合调料汁，备用。
小米椒切圈，备用。
豆角去筋，45°斜切4 - 10cm小段，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱、小米椒，翻炒至闻到香味。
加入豆角，翻炒30s。
加入料汁，开大火翻炒2分钟。
倒入150ml水。
转中小火，盖上锅盖焖制8 - 10分钟。
加入蒜末，出锅。', '切豆角需要一定的刀工，不会的可以使用剪刀', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (215, 0, '素菜', '鲜', '小试牛刀', '3', '莴笋叶煎饼', '莴笋叶煎饼营养丰富且美味。利用常见的食材，简单几步就能制作出可口的煎饼。选择莴笋叶是因为某些省市蔬菜包中常包含，它直接焯水凉拌有苦味，做成煎饼则别有风味，也可换成韭菜等。', e'莴笋叶50g
鸡蛋2个
食用油30ml
生抽5ml
淀粉15g
鸡精2g', e'莴笋叶剁碎，加入鸡蛋、生粉、生抽、鸡精搅拌均匀备用。
起锅烧油，倒入莴笋叶浆汁，均匀平铺在锅面上。
第一面炸120S后，翻面再炸60S后出锅。', e'选择莴笋叶时可考虑当地蔬菜包中是否有，若不喜欢其苦味可尝试换成韭菜等。
制作过程中注意控制油温，避免炸焦。', e'./1.jpeg
./2.jpeg
./3.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (216, 0, '素菜', e'酸
辣', '轻松上手', '3', '酸辣土豆丝', '酸辣土豆丝是一道简单易做的菜，色泽光亮，酸辣可口，辅料辣椒富含维生素C，用料简单，好学易做。', e'土豆240g
大蒜4瓣
青椒0.5个
红椒0.5个
干辣椒3个
葱1根
生抽5ml
陈醋10ml
盐2g
食用油10 - 15ml', e'土豆去皮、切丝（或用刨丝器）。
切好的土豆丝用清水清洗，去除多余的淀粉，然后对土豆丝焯水10秒。沥干，备用。
葱蒜干辣椒切小块，青红椒切丝。
热锅，小火热油爆香蒜和干辣椒。
加入青红椒翻炒几下，加入土豆丝翻炒至变色。
加5ml生抽，10ml陈醋，蒜末，最后加入盐翻炒均匀即可。', e'清洗土豆丝淀粉一定要去干净，不然会全黏在一起
加入蒜末、盐后应尽快出锅，保留蒜香以及避免破坏口感。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (217, 0, '素菜', '鲜', '小试牛刀', '2.5', '西红柿豆腐汤羹', '西红柿豆腐汤羹是一道很清淡美味的汤羹', e'西红柿1个
鸡蛋1个
豆腐100g
食用油5ml
盐2g
淀粉5g
鸡精2g
香葱0.5根
姜1片
开水350ml', e'西红柿切成小丁、鸡蛋打入碗中搅拌、豆腐切块备用
起锅烧油，放入姜片5S后倒入入西红柿翻炒30S
锅中加入开水，汤水烧开，60S后到入鸡蛋液、豆腐块
汤水重新烧开后，加入水淀粉，沿一个方向搅拌2圈
加入鸡精、盐、香葱，30S后起锅', '', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (221, 0, '素菜', e'鲜
甜', '得心应手', '5', '脆皮豆腐', '浓郁的酱汁裹满豆腐，吃一口就停不下来，别提有多好吃。', e'老豆腐 1 块
鸡蛋 2 只
生抽 20 g
蚝油 10 g
老抽 5 g
白糖 10 g
玉米淀粉 50 g
食用油 18ml', e'鸡蛋搅拌形成蛋液放置备用
配置酱料 （20 g 生抽+10 g 蚝油+5 g 老抽+10 g 白糖+10 g 玉米淀粉+200 ml 清水）
老豆腐切片 （个人建议，仅供参考  人 * 5 片，厚度 1.2 cm）
玉米淀粉倒入盘中，将老豆腐片粘上淀粉后，粘上蛋液，放置一旁
热锅，锅内放入 18ml 食用油。等待 10 秒让油温升高
将粘上蛋液的老豆腐片均匀放入锅中，铺好锅底，小火煎至金黄翻面
待两面煎至金黄后，倒入酱料，让每块豆腐都沐浴在酱料中，大火 3 分钟至酱汁浓稠
关火', '制作过程中可根据个人口味适当调整调料用量。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (222, 0, '素菜', '甜', '小试牛刀', '8', '拔丝土豆', '拔丝土豆是一道色香味俱全的特色名菜，属于鲁菜系', e'土豆2个
食用油300ml
淀粉30g
白砂糖120g
水100ml
芝麻5g', e'土豆去皮，切均匀的小块。放入淀粉（不加水）搅拌，使得淀粉覆盖土豆表面
起锅烧油，放入土豆块，缓缓翻滚煎炸5 - 7分钟 ，直至筷子可以插进土豆
取出土豆，放入大碗备用
锅中加入水、白砂糖，沿着一个方向慢慢搅动白砂糖，直到白砂糖颜色变成褐色
重新倒入土豆，翻炒30S后出锅
土豆盛盘，散上芝麻', e'土豆煎炸不可太熟透，否则在拔丝端盘时不容易定型，影响美观
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (223, 0, '素菜', '鲜香', '得心应手', '13', '红烧冬瓜', '红烧冬瓜是一道具有色泽红亮，香鲜味美、营养价值丰富的家常菜', e'冬瓜300g
食用油50ml
料酒2ml
淀粉10g
生抽10ml
老抽15ml
鸡精3g
香葱0.5根
姜末1粒
蚝油15ml', e'冬瓜去皮，切边长不超过2cm小块。
起锅烧油，放入冬瓜，缓缓翻滚煎炸2分钟 ，直至冬瓜表面泛金黄色。
取出冬瓜，放入大碗备用。
利用锅中的剩余油，依次放入姜末、生抽、蚝油，翻炒15S。
重新倒入冬瓜，翻炒30S后，加入开水，水要没过冬瓜表面，大火煮10分钟。
加入老抽上色，继续煮，直至冬瓜软糯（筷子可以轻松插近冬瓜）。
加入鸡精、料酒、香葱翻炒后30S， 取出冬瓜到大碗中。
锅中剩余汤汁保留，倒入水淀粉，煮开后汤汁浇灌在冬瓜表面。', '', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (224, 0, '素菜', '鲜', '小试牛刀', '3', '鸡蛋火腿炒黄瓜', '这是一道简单易做的家常菜，由鸡蛋、火腿和黄瓜炒制而成，味道鲜美。', e'黄瓜1根（约200g）
鸡蛋2个
火腿肠1根（约40g）
红尖椒1个（可选）
食用油10ml
生抽3ml
盐2g', e'黄瓜洗净，切半圆形片，备用。
火腿切半圆形片，备用。
红尖椒（可选）切碎，备用。
将鸡蛋打入碗中，搅匀，即为鸡蛋液。
热锅里倒5ml食用油。
油热后转小火，倒入打散的鸡蛋液，用筷子划散，翻炒至鸡蛋结为固体且颜色微微发黄，即为半熟鸡蛋，盛出备用。
不用洗锅，往锅内倒入5ml食用油，倒入黄瓜片大火翻炒1分钟。
把半熟鸡蛋倒入锅中，调入2g盐、3ml生抽，立刻倒入火腿片和辣椒碎（可选）翻炒均匀。
关火，盛盘。', e'火腿是咸的，要在调味后才加入，这样不会让火腿也沾上盐。
炒鸡蛋时用筷子划散可以使鸡蛋更加蓬松。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (225, 0, '荤菜', e'甜
辣', '大展身手', '13', '干煸仔鸡', '干煸仔鸡是一道甜辣口味的川菜，由北京大学食堂赵春月厨师长研发，广受师生喜爱。', e'鸡腿肉400g
土豆200g
青椒60g
蒜瓣10g
盐3g
鸡精3g（可选）
胡椒粉2g
生抽5g
老抽2g
料酒5g
淀粉20g
郫县红油豆瓣酱40g
白糖30g
花椒碎2g', e'鸡腿去骨（如使用鸡腿排可忽略此步骤），鸡腿肉用刀背砸一砸，切成2cm的块。
鸡腿肉中加入盐、鸡精（可选）、胡椒粉、生抽、老抽、料酒，抓拌至粘手时加入淀粉拌匀，加入食用油防止粘连，腌制30分钟。
土豆去皮，切成2cm的块，沸水煮5分钟后捞出，控干水分，防止油炸时爆锅。
青椒去籽，切成2cm小片，放在笊篱中备用。
锅中加入宽油（根据锅的形状，能没过食材即可），油温烧至180℃时，下入土豆块炸3分钟后捞出。
待油温再次升高到180℃时，下入鸡块炸2分钟后捞出。
待油温再次升高到180℃时，下入鸡块复炸1分钟后捞出。
待油温再次升高到180℃时，下入土豆块复炸1分钟后，将锅中的油和土豆块经过笊篱过滤倒出，让笊篱上的青椒片断生。
锅中加入5ml食用油，小火煸炒蒜瓣至发黄，下入红油豆瓣酱煸炒出香，下入白糖炒融化，下入花椒碎，加40ml清水，不停搅拌至酱汁粘稠。
下入炸好的鸡块、土豆块、青椒片，搅拌均匀后出锅。', e'不舍得使用宽油油炸的话，可改用更少的油煎鸡块和土豆块。会增长用时，部分影响口感，但不会影响总体味道。
对于使用剩余的食用油，可以考虑重新收集到油壶。', './干煸仔鸡成品.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (226, 0, '素菜', '鲜', '轻松上手', '10', '蒸箱鸡蛋羹', '蒸箱鸡蛋羹是一道简单快捷易做的菜，适用于有家庭蒸箱的厨师。', e'鸡蛋 1 个
食用盐 1g
食用油 5ml
生抽 6ml（可选）', e'一个鸡蛋放入碗中打散。
向碗中加入鸡蛋体积 1.0 - 1.5 倍 60 度纯净水，并且搅拌均匀。
加入食用盐 1g。
加入食用油 5ml。
过滤蛋液，去掉蛋液中的浮沫（可选）。
确认蒸箱的水源已经补充至足够（若不确定，可把水槽补满）。
将已经完全搅拌均匀的鸡蛋液碗放入蒸箱。
调节至100摄氏度蒸10分钟。
打开蒸箱 （注意：蒸箱在开启时会有蒸气瞬间喷出，注意缓慢开启）。
出锅（可加入生抽调味）。
享用。', e'超出水的范围后，水越少会口感变得太弹，水越多会变得太稀。
过滤蛋液可去掉蛋液中的浮沫，不过滤蒸出来的蛋会有气泡导致不好看。
蒸箱开启时会有蒸气瞬间喷出，注意缓慢开启。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (227, 0, '素菜', '辛辣', '得心应手', '6', '干锅花菜', '干锅花菜是湘菜常见的一道菜', e'花菜 400g
五花肉 100g
辣椒 1 - 2 根
生抽 10ml
白糖 5g
蒜 3 - 4 个
盐 2g
油 10ml', e'花菜朵朝下，没入淡盐水中浸泡 20 分钟。然后洗净用小刀拆成小朵。
入开水锅中焯水 1 分钟，捞出立即用冷水冲淋至完全凉透，沥水备用。
五花肉切成薄片，大蒜白色切下用刀背拍扁，小红辣椒切成段。
锅烧热放油，油热下大葱白爆香。
下五花肉片入锅，用中火煸炒至表面全部变色，继续煸炒一会儿，把肥肉部分的油份逼出一部分。
倒入红辣椒段和花菜，翻炒几下。
加入 10ml 生抽。
再加入 5g 白糖，转大火不断翻炒 1 分钟。
把大蒜叶部分切成段，放入锅中，翻炒几下后，关火盖上盖子焖 1 分钟即可。', e'花菜浸泡盐水可去除杂质和残留农药。
焯水后用冷水冲淋能保持花菜脆爽口感。
煸炒五花肉逼出部分油份可减少油腻感。', './干锅花菜.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (228, 0, '素菜', '鲜', '得心应手', '5', '上汤娃娃菜', '上汤娃娃菜是一道美味且适合作为减肥餐的素菜，具有独特的鲜香味道。', e'娃娃菜700g
金针菇10g
皮蛋一个
午餐肉（火腿肠）适量
葱3g
姜10g
蒜10g
盐
糖
淀粉
蚝油
味精', e'娃娃菜洗净，竖着切开切成段。
葱切小段，蒜切片，姜切小片。
皮蛋切成丁，火腿肠或者午餐肉切成1cm大小的丁。
金针菇洗净撕开。
烧热水，娃娃菜放进去十秒钟出一下水捞出。
热锅凉油，加热锅倒入油过一遍就倒出来，重新倒入一点油。
调至小火加入葱姜蒜，煎炒出香味。
加入300g清水（水量没过娃娃菜即可），放入娃娃菜、金针菇、午餐肉。
加入调味料蚝油、糖、盐、味精烧开。
煮3分钟，煮开后开始装盘，盛出娃娃菜后皮蛋放在上面把汤汁浇上去。', e'如果不喜欢金针菇可不放。
拍照技术有限，但味道不错。', './上汤娃娃菜.png', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (229, 0, '素菜', '鲜香', '得心应手', '8', '葱煎豆腐', '葱煎豆腐是一道美味的素菜，具有独特的鲜香风味。制作过程中，豆腐煎至金黄，搭配葱和辣椒，口感丰富。', e'白豆腐（数量根据份数 * 0.8 向上取整）
葱（数量根据份数，2根/三人）
青辣椒（数量根据份数，1.5只/三人）
盐（数量根据份数 * 3g）
鸡精（数量根据份数 * 1.5g）', e'豆腐洗净，切约5mm厚度，置于碟中。
葱洗净，除去根部，切成葱花，备用。
辣椒洗净，切开，去籽，切成1cm * 1cm状，备用。
热锅，加入份数 * 9ml油。
油入锅后，使其均匀布于锅底，均匀放入豆腐，小火煎至金黄翻面。
待两面金黄，盛入碟中备用。
补油至覆盖锅底，倒入辣椒大火翻炒，并铲碾3分钟。
倒入豆腐，翻炒，加入盐与鸡精，中火翻炒1分钟后倒入10ML水，大火收汁。
出锅前撒上之前计算好的葱花，起锅盛盘。', e'注意控制火候，避免豆腐煎糊。
根据个人口味调整盐和鸡精的用量。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (230, 0, '素菜', '鲜', '轻松上手', '15', '鸡蛋羹', '鸡蛋羹，又称水蒸蛋，不需要准备复杂的食材，是一道简单快捷易做的菜，当早餐或是正餐都可。', e'鸡蛋2个
食用盐3g
香油2 - 4ml
生抽或味极鲜8ml
白醋或料酒2ml（可选）
70度纯净水适量', e'两个鸡蛋放入碗中打散。
加入食用盐3g。
加入2ml白醋或料酒（可选）。
向碗中加入鸡蛋体积1 - 1.5倍的70度纯净水，并且搅拌均匀。
过滤蛋液，去掉蛋液中的浮沫（可选）。
向任意一口锅中加入50ml清水，水烧开后，放入盛有鸡蛋液的碗，蒸碗要盖上一个盖子，倒扣一个有凹槽的铁碟子，或者使用保鲜膜来减少水汽进入。
中火蒸10分钟。
关火，再闷上5分钟。
出锅，加入香油和生抽即可享用，也可用藤椒油代替香油。', e'盐起到增加底味和凝固作用。
加入白醋或料酒可去除鸡蛋腥味，加入米醋会使鸡蛋微微发黑，加入料酒没有醋的酸味。
1倍的水鸡蛋更弹，1.5倍的水鸡蛋更嫩。
过滤蛋液可使蒸出来的蛋没有气泡更好看。
蒸蛋时要注意减少水汽进入，避免变成蜂窝状。
可在此基础上派生，添加火腿肠、肉馅、虾皮等材料丰富口感。', './鸡蛋羹.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (231, 0, '素菜', '鲜', '得心应手', '15', '蒲烧茄子', '蒲烧茄子是一道特色菜肴，从外观上与鳗鱼有相似之处，制作过程需注意茄子的选择和烹饪步骤，还可根据个人口味添加小葱等进行点缀。', e'1个长的上小下大的茄子（注意不要使用浙茄和圆茄）
20ml蜂蜜
15ml白糖
40ml生抽
10ml老抽
20ml料酒
100ml水', '茄子削皮、横着切成两段；蒸5分钟；纵向切开，不要切断，在两边切面各划2~3刀至可以摊平；煎至两面金黄；往茄子上浇蒲烧汁至没过1/2茄子高度；煎至背面上色，翻面，同时收汁，若无法收汁可以加入水淀粉（生粉和水的比例在1:4到1:10根据收汁情况而定）；把剩下的蒲烧汁浇在茄子上；出锅。', e'根据锅的类型决策不同量的油，不粘锅油汇聚成滴后要散布在茄子的面积，铁锅摊开后油可以刚好覆盖锅底；若觉得腻可以在装盘后撒点切成2~5mm的小葱；炒茄子（鱼香茄子、酱爆茄子）推荐浙茄，细长所以切成滚刀块刚刚好，皮很嫩不像这里需要去皮，茄子的味道适中。灵魂在于蒲烧汁，也可以买现成的蒲烧汁。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (232, 0, '素菜', '鲜', '轻松上手', '15', '陕北熬豆角', '陕北熬豆角是一种对初学者极其友善的菜，因其制作方式使用`熬`的方式，食材可多可少，可有可无，几乎不存在失败的可能性。', e'豆角600g
土豆1个
西红柿1个
螺丝椒2个
盐12g
生抽12ml
五香粉6g
蚝油12ml
葱3圈
姜2g
蒜2颗
香菜碎(可选)', e'葱切花，蒜切沫，姜切丝，备用。
豆角去筋，切2 - 10cm小段，备用。
土豆去皮，切1cm³小块，备用。
西红柿去皮，切1cm³小块，备用。
辣椒去仔，切0.15cm宽条，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱姜蒜，翻炒至闻到葱姜蒜香味；
加入豆角，翻炒至变色（青绿色变为翠绿色）；
加入土豆块，翻炒30s；
加入热水（水面刚刚漫过菜），盖上锅盖熬至土豆变软（可以用筷子确认）；
加入西红柿块，加入盐，生抽，蚝油，五香粉，辣椒，熬至西红柿成汁（注意搅拌，防止糊锅）；
加入香菜碎，出锅。', e'加入西红柿后开始继续熬制后，需要偶尔翻搅防止糊底
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (233, 0, '早餐', '', '轻松上手', '6', '牛奶燕麦', '这是一道高蛋白、富含粗谷物纤维、能带来饱腹感的懒人快速营养早餐。', e'牛奶280ml
燕麦40g
鸡蛋1个
椒盐3g（可选）
直饮水200ml（非直饮水时）', '方法一：将牛奶倒入早餐杯（冷的即可），准备好200ml水（直饮水直接加入燕麦，非直饮水则烧开后加入），水沸后煮2分钟，捞出煮好的燕麦倒入牛奶中（尽量不倒入煮燕麦的水）；方法二：将快煮燕麦放入容器，倒入牛奶搅拌，放入微波炉中等火力微波4分钟；煎蛋时热锅，放一层底油，油热后煎鸡蛋，每面煎20s，可考虑加入3g椒盐调底味，关火后装盘。', e'由于不同微波炉火力不同，故微波炉火力无法精确表明；不建议混合物超过容器容量50%，否则加热过程中内容物极有可能溢出；不建议使用玻璃杯进行烹饪。
可搭配水果蔬菜、苏打饼干食用更佳。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (253, 0, '素菜', e'咸
鲜
酸
甜', '轻松上手', '5', '凉拌油麦菜', '凉拌油麦菜是一道制作简单的素菜，清爽可口。', e'油麦菜1颗（约200g）
芝麻酱10ml*份数
酱油5ml*份数
醋15ml*份数
香油5ml*份数
白糖5g*份数
蚝油10ml*份数
蒜2头*份数', e'蒜拍碎切末
将醋，酱油，芝麻酱，香油，糖，蚝油，蒜末放到碗里搅拌均匀
油麦菜切段，每段不超过4cm
油麦菜放到一个大点的盆里，倒入上述碗中酱料，充分搅拌均匀。', e'芝麻酱可以用花生酱代替
芝麻酱一定要和油麦菜混合均匀才更好吃。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (234, 0, '素菜', '辛辣', '得心应手', '7', '手撕包菜', '手撕包菜是一道色香味俱全的汉族名菜，属于湘菜系', e'包菜1颗
五花肉200g
小米辣2根
食用油60ml
料酒5ml
生抽5ml
香醋5ml
鸡精2g
姜2片
蒜头2粒
蒜苗0.5根
盐5g', e'1. 包菜对半切开，去掉中间白色部分；
2. 手撕包菜，碗中放入2g盐，清洗包菜并沥干备用；
3. 姜片、蒜头、小米辣、蒜苗处理后备用；
4. 五花肉切片，清水清洗后备用；
5. 锅中加入30ml食用油，倒入包菜翻炒，大火翻炒1分钟后，加入3g盐 ，继续翻炒2分钟后取出备用；
6. 锅中加入30ml食用油，倒入五花肉，大火翻炒1分钟；
7. 倒入姜片等材料，翻炒1分钟；
8. 倒入包菜翻炒后，加入香醋、料酒、鸡精、料酒，大火继续翻炒，2分钟后出锅。', e'1. 步骤五中，翻炒时间需要实际情况做调整，一般是炒到包菜七分熟后即可。七分熟是指包菜已经出水质感变软；
2. 步骤五中，加盐的作用是锁住包菜水分的同时，给包菜上一点味道；
3. 最后一个步骤中，翻炒时间根据实际情况和个人口感做灵活调整。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (235, 0, '素菜', e'咸
酸
辣', '轻松上手', '10', '雷椒皮蛋', '雷椒皮蛋是一道简单的下饭凉菜，食材常见，虽成品卖相一般，但却是夏天下饭的神器之一。', e'皮蛋2个
长条青椒4根
葱10cm
蒜3 - 4瓣
小米辣3 - 4颗
食用油10 - 20ml
生抽15 - 20ml
陈醋15 - 20ml
白糖6 - 10g
香油5 - 7ml', e'青椒清洗，去除根部，侧面切开，去除内部的子后在案板压平，备用
葱切成半厘米小段，备用
蒜去皮，切成碎末，备用
皮蛋去皮，备用
小米辣，切成5 - 10mm的小段，备用
热锅，锅内放入10ml - 20ml食用油
放入全部青椒，改小火保持锅子温度，煎至青椒变软
关火，将皮蛋和青椒放入小铁盆中
将青椒用手撕开，撕成大约半厘米的条状，用叉子将皮蛋压碎
倒入生抽，陈醋，白糖，香油，以及葱、蒜末、小米辣
均匀搅拌', e'一定要去除青椒子，否则会在锅里炸开
砸皮蛋和青椒时注意不要吵到邻居', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (236, 0, '素菜', '鲜', '得心应手', '10', '包菜炒鸡蛋粉丝', '包菜炒鸡蛋粉丝是中国一道常见的家常菜', e'包菜半颗
鸡蛋2个
粉丝1把
胡萝卜半根
菜籽油20ml
盐2g
生抽15ml
老抽10ml
蚝油10ml
葱半根
蒜瓣2片
干辣椒5根', e'1. 胡萝卜、包菜切丝备用；
2. 粉丝先用冷水浸泡1小时，然后将粉丝放入锅中，加入开水烧至粉丝烫软捞出备用；
3. 鸡蛋打入碗中，加入盐后搅拌15秒；
4. 葱、蒜、辣椒切成小粒备用；
5. 起锅烧油，倒入鸡蛋，打散炒熟盛出；
6. 再倒入油，放入葱、蒜、干辣椒翻炒8秒；
7. 下胡萝卜、包菜丝儿翻炒30秒；
8. 放入粉丝；
9. 放调料，生抽15ml，老抽10ml，蚝油10ml，盐2克；
10. 放入之前炒好的鸡蛋，翻炒约15秒；
11. 出锅摆盘。', e'1. 粉丝浸泡时间可根据实际情况调整，确保泡软即可；
2. 炒鸡蛋时要充分打散，这样炒出的鸡蛋更蓬松；
3. 调料的用量可根据个人口味适当调整。', './1.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (237, 0, '素菜', '鲜', '小试牛刀', '5', '蚝油三鲜菇', '几分钟就能做出的蚝油蘑菇，滑嫩入味鲜美可口', e'鲜香菇2朵
蟹味菇30g
白玉菇30g
小米辣1根
菜椒0.5颗
食用油10ml
盐5g
料酒2ml
淀粉10g
生抽10ml
鸡精3g
香葱0.5根
姜末1粒
蚝油5ml
开水350ml
西蓝花100g', e'蟹味菇、白玉菇去掉根部泥土，掰散菌朵
香菇切片（每片厚度0.5-1cm）
生粉倒入小碗中，加入50ml水，搅拌至融化成水淀粉备用
水开，放入西蓝花，清水煮3分钟，放入碗中备用
洗锅烧开水，加入5g食用盐，倒入蟹味菇、白玉菇、香菇，水煮1分钟
1分钟后，捞出沥干水分
起锅烧油，待油冒小泡，放入姜末、小米辣、菜椒煸炒30S
倒入三鲜菇，依次倒入生抽、蚝油、鸡精，翻炒均匀后，倒入水淀粉
中火烧干汁，加入料酒、葱花出锅
摆上西蓝花', '', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (238, 0, '素菜', e'鲜香
辛辣', '小试牛刀', '18', '烤茄子', '烤茄子做法简单方便，味道香极了，成品和烧烤摊的烤茄子差不多。', e'茄子1个（大约200g）
食用油20 - 30毫升
酱油4 - 6克
小米椒1个（大约20g）
蒜蓉3 - 4瓣
孜然1 - 3克
食用盐0.5 - 2克', e'将酱油、孜然、食用盐、蒜蓉和切碎的小米椒置于碗中，均匀搅拌备用
茄子洗净，用纸巾擦干表面的水分
用叉子在茄子的一侧扎4 - 8下
使用15 - 25ml的食用油涂满茄子表面
将烤箱温度设置为200℃ （打开烤箱风扇 大火），预热2分钟
将茄子放入烤箱中层或者上层，烤制12 - 15分钟 （茄子表面有褶皱，且能按压0.3 - 0.5cm的深度即可）
取出茄子，用刀茄子上竖着划一个口子。口子居中，上下距1 - 1.5cm
用小刀或者叉子伸入口子，竖着切割茄子内部
将口子微微掰开，倒入第一步准备的酱料
再次将茄子放入烤箱，将烤箱温度设置为200℃ ，烤制4 - 7分钟
取出，关闭烤箱电源', e'茄子表面有水分、未涂满食用油或未使用叉子扎孔可能导致茄子在烤制的过程中爆裂
第一次用刀划口子的时候，可以直接将茄子竖直切成两半，然后切割出纹路后涂抹上酱料', './烤茄子.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (239, 0, '素菜', '鲜', '小试牛刀', '2', '炒茄子', '家常炒茄子，做法简单，原料不复杂，制作过程中需注意一些要点，如酱油用量、是否添加可选材料等，能做出美味可口的菜肴。', e'茄子（份数 * 1.8个）
八角（份数 * 1个）
虾皮（份数 * 正常男子手抓半把）
香葱（份数 * 2颗）
酱油（份数 * 40ml）
菜籽油或花生油', e'将茄子洗净，竖切为两段，每段切菱形块，放入碗中。
洗净香葱并切成葱花，切好八角，分别放案板上待命。
开火热锅至无水。
往锅内倒食用油，没过锅底两倍。
若有八角等可选材料，热油约6成熟时放入；若没有则热油至9成熟。
待油到9成熟，将碗中茄子倒入锅内用锅铲翻炒约40秒。
锅铲悬空与锅平行，把酱油倒入锅铲内（一人约2.5锅铲），继续翻炒。
待锅内茄子变色且变软时捞出。', e'因酱油缘故本菜不必加盐，出锅前可尝，不咸可加微量盐，下次增加酱油量。
若加虾皮，可酌情减少酱油量。
炒时一直用大火。
一定不可加水，油可多放。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (254, 0, '荤菜', e'辛辣
醇厚', '得心应手', '41', '湖南家常红烧肉', '湖南家常红烧肉，入口软糯，肥而不腻', e'带皮五花肉500g
干小米椒（根据个人情况而定）
姜3片
生抽5克
老抽2克
香叶5片
桂皮1小块
八角3颗
冰糖6颗
料酒20克
盐2克
冰糖（锁油上色）
食用油10g
开水', e'带皮五花肉洗净冷水下锅，加入姜片2~3片去腥味，煮到沸腾捞出冷水冲净白沫
五花肉切块，尺寸1.5cm*1.5cm块状大小
热锅加入油，加入冰糖小火搅拌至焦糖色即可，加入切好的五花肉，中火翻炒上色
加入备好的姜片、八角、桂皮、生抽、老抽、料酒、干小米椒、盐，小火翻炒1分钟，加开水没过肉
加盖中火煮沸，转小火慢炖30分钟，慢炖期间，间隔10分钟搅拌一次防止粘锅
小火慢炖汤汁剩三分之一的时，调成中火收汁出锅。', '', './湖南家常红烧肉.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (240, 0, '素菜', '鲜', '小试牛刀', '4', '白灼菜心', '白灼菜心是经典粤菜，是用煮沸的水或汤将生的食物烫熟的烹饪技法，能保持原有的鲜味，是减肥或快速解决绿叶菜的绝佳方式。', e'新鲜菜心250g
食用油10g
生抽5g
蚝油5g
盐5g
糖5g
大蒜四五瓣
小米辣一两根
洋葱适量
姜丝适量', e'菜心洗净，去除根部比较硬或老的地方，刮菜心根茎部分。
大蒜切成蒜末，准备好洋葱、姜丝、小米辣。
调制灵魂料汁：生抽5g、蚝油5g，加3g糖和100g清水成一碗汁儿。
一锅500ml清水加5g盐和10g食用油烧开。
将菜心根茎在沸水中烫1分钟，直到根茎颜色变成深绿，再将整个菜心放到锅中烫熟1分钟，捞起来码入盘中。
开另一小锅将兑好的料汁倒入，小火烧开，放入一半的蒜末，一点点姜丝和小米椒碎，可先在锅底倒油，五成热后倒入蒜末、洋葱，稍稍爆香后再加入料汁，加入小米辣煮开。
料汁稍微收汁，煮沸后稍等十来秒，直接浇在菜心上。', e'选择新鲜的菜心。
锅内烧清水要加油和盐。
如果加淀粉，汤汁煮沸后更容易挂在菜心上，味道会更重一些，广东人可能吃不惯。', './白灼菜心.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (241, 0, '荤菜', '辛辣', '大展身手', '40', '新疆大盘鸡', '新疆大盘鸡是一道色香味俱全的新疆名菜，以鸡块和土豆、青椒、红椒等配菜烧制而成，汤汁浓郁，搭配皮带面食用，味道极佳。', e'两个火枪腿的鸡肉（约1kg）
土豆2个（约750g）
大葱100g
菜椒甜椒各一个（各50g）
白糖20g
干线椒5个
大蒜4瓣
油50g
花椒
香叶
香果
盐5g
生抽7ml
蚝油10g
料酒100g（可拿啤酒代替）', e'肉剁成块状，用清水加盐浸泡5分钟去除血水，去腥后空干水。
葱蒜辣椒土豆等洗净，土豆削皮。
葱白切长段（4cm一段），菜椒和线椒切块状。
土豆切成滚刀块（4cm*4cm大小）。
炒糖色：锅中加油，放入白砂糖，用锅铲搅拌炒化，炒出焦黄色，倒入空干水的鸡肉翻炒上色。
放入花椒，香叶，香果，干线椒等翻炒。
放入5g盐，生抽7ml，蚝油10g ，料酒100g，倒入1升清水（料酒可用啤酒代替）。
调至中火，水烧开后转中小火慢炖入味。
当水收至鸡肉即将露出时，将土豆放在锅表面，不翻动，继续盖锅盖炖，一会后放入大葱，菜椒和甜椒继续炖。
炖到汁收得差不多时翻面，让土豆吸汤汁，最后关火盛出。
另：可买粗面剂子，压扁后用手拉成宽面，下好后放入大盘鸡中与汤汁搅拌。', e'鸡肉用盐浸泡可有效去除血水和腥味。
炒糖色时要注意火候，防止糖炒糊。
炖土豆时不要翻动，以免粘锅。
喜欢吃辣可以多放些干线椒。', e'./大盘鸡.jpeg
./大盘鸡皮带面.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (242, 0, '荤菜', '辛辣', '得心应手', '5', '辣椒炒肉', '这是一道色香味俱全的家常美食，选用青椒和猪瘦肉为主要食材，通过特定的烹饪步骤制作而成，口感香辣可口。', e'青椒（吃辣可选杭椒、螺丝椒，不吃辣用尖椒、甜椒） 份数*3个
猪瘦肉 份数*200g
盐 份数*3g
生抽 份数*3ml
蚝油 份数*3ml
大蒜 份数*5g
姜 份数*5g
酱油（可选） 份数*2ml
豆豉（可选） 份数*3g', e'将青椒洗净，去除青椒把以及青椒籽，用滚刀手法切好备用。
大蒜用刀拍一下，横切成蒜瓣，生姜切碎成姜末。
将猪瘦肉顺着纹理切成肉片，洗净放入空碗，加入计算好的生抽、蚝油、盐搅拌均匀，腌制10分钟。
热锅，不放油，把切好的青椒放入锅中，大火干煸至虎皮状后，再加2g盐继续翻炒1分钟后捞起。
不用洗锅，大火热锅，加入份数*8ml油，等待30s，加入蒜瓣、姜末翻炒15s。
加入腌制好的猪肉倒入锅内翻炒2分钟，再加入干煸过的青椒翻炒1分钟。
根据个人口味喜好加入豆豉，最后加入酱油，继续翻炒30s。
出锅，盛盘。', e'辣椒只能选择青椒，螺丝椒为最优解，切勿选择其他品种辣椒。
对于腌制猪肉时调料的用量可根据个人口味微调。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (243, 0, '素菜', e'酸
咸', '轻松上手', '15', '凉拌黄瓜', '凉拌黄瓜是一道清爽可口的凉拌菜，制作简单，口感清脆。', e'黄瓜200克*份数
醋7.5ml + 4ml*份数
酱油5ml + 2.5ml*份数
蒜3瓣*份数
盐0.4克 + 0.2克*份数
香油5ml + 2ml*份数
蚝油5ml', e'用菜刀将黄瓜拍扁，再剁成长3厘米的碎块。
将碎黄瓜装入碗中。
将蒜拍碎切成碎末。
将醋，酱油，盐，蚝油和蒜依次倒入碗中搅拌均匀并腌制15分钟。
将香油倒入碗中并均匀搅拌。', e'部分情况下黄瓜端头有苦味，请洗净切下后确认。
做好之后直接开吃，亦可先准备好后放入冰箱冷藏（并非冷冻）后食用。
若放入冰箱冷藏，则需使用保鲜膜包紧，并在8小时内食用完毕，否则黄瓜会因过度腌制失去清脆口感。
推荐黄瓜去皮，口感更好。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (244, 0, '荤菜', '鲜', '得心应手', '7', '黄瓜炒肉', '这是一道常见的家常菜，具有鲜美的口味。通过合理的食材搭配和烹饪步骤制作而成。', e'黄瓜（100克*份数）
猪瘦肉（50克*份数）
食用油（50克*份数）
生抽（5克*份数）
盐（10克*份数）
蒜（2瓣*份数）
小米辣（1根*份数）', e'将猪瘦肉切片，放入碗中，倒入10克食用油和生抽，搅拌均匀，腌制10分钟。
将黄瓜切去5厘米的头尾，剩余部分斜着切成0.5厘米的薄片。
把黄瓜倒入碗中，撒上8克盐，搅拌均匀，腌制5分钟。
蒜瓣去皮，压扁，切成蒜末备用。
小米辣去丁切分成均匀0.5厘米的段状。
热锅，倒入40克油，等油温冒烟，放入蒜蓉小米辣翻炒5次。
放入腌制好的猪瘦肉，翻炒至肉熟变色。
放入黄瓜，加入2克盐，大火翻炒均匀半分钟（若无法保证大火可增加到50秒），出锅。', e'腌制猪肉时加入食用油可使炒出的肉更嫩。
炒黄瓜时要大火快炒，以保证口感脆爽。
如果无法保证大火，适当延长黄瓜的炒制时间。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (245, 0, '素菜', e'酸
甜', '轻松上手', '30', '话梅煮毛豆', '酸甜可口、营养价值高的一种简易美食', e'毛豆 300g
话梅 6 颗
食用盐 2g', e'清水加入食用盐，毛豆浸泡 15 分钟
加入开水，倒入毛豆、话梅，水煮 20 - 30 分钟
起锅开吃', '', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (246, 0, '素菜', '鲜', '轻松上手', '2', '炒滑蛋', '炒滑蛋是一道简单易做的菜，一般初学者5分钟即可完成。', e'鸡蛋4颗
牛奶30ml
食用油10ml', e'鸡蛋加入牛奶以及5ml食用油搅拌均匀，备用
大火烧热平底锅约30s, 加入5ml食用油
烧30s转小火, 并且放入搅拌好的鸡蛋
在锅中静置5秒后，用锅铲将蛋液从边缘缓慢推向中间
翻炒至鸡蛋大致凝固后关火，装盘', '最后可根据个人口味撒些黑胡椒或者盐来调味。', './炒滑蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (263, 0, '素菜', '鲜', '小试牛刀', '2 ', '西红柿豆腐汤羹', '西红柿豆腐汤羹是一道很清淡美味的汤羹', e'西红柿 1 个
鸡蛋 1 个
豆腐 100g
食用油 5ml
盐 2g
淀粉 5g
鸡精 2g
香葱 0.5 根
姜 1 片
开水 350ml', e'西红柿切成小丁、鸡蛋打入碗中搅拌、豆腐切块备用。
起锅烧油，放入姜片 5S 后倒入入西红柿翻炒 30S。
锅中加入开水，汤水烧开，60S 后到入鸡蛋液、豆腐块。
汤水重新烧开后，加入水淀粉，沿一个方向搅拌 2 圈。
加入鸡精、盐、香葱，30S 后起锅。', e'制作过程中注意火候和搅拌方向，确保汤羹口感均匀。
食材的用量可以根据个人口味适当调整。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (247, 0, '素菜', '鲜', '轻松上手', '10', '西红柿炒鸡蛋', '西红柿炒蛋是中国家常几乎最常见的一道菜肴。它的原材料易于搜集，制作步骤也较为简单，所以非常适合新厨师上手，是很多人学习做菜时做的第一道菜。', e'西红柿 1 个（约 180g）
鸡蛋 1.5 个
食用油 4ml*鸡蛋个数
盐 1.5 - 2g
糖 0 - 2g
葱花 0 - 10g', e'西红柿洗净
可选：去掉西红柿的外表皮（开水烫表皮，然后将西红柿放入冷水，剥去外皮）
西红柿去蒂，切成边长不超过 4cm 的小块
将鸡蛋打入碗中，加入 1g*份数的盐，搅匀，可考虑加入 1ml 醋
热锅，加入食用油
油热后，倒入鸡蛋液。翻炒至鸡蛋结为固体且颜色微微发黄
关火，将半熟鸡蛋盛盘，重新开火
加入西红柿块，锅铲拍打并翻炒 20 秒，或至西红柿软烂
向锅中加入半熟鸡蛋，翻炒均匀，可考虑加入 10ml 番茄酱和 50ml 清水，可额外加入一些其它熟肉和材料
加入剩余的盐、糖（可选）、葱花（可选），翻炒均匀
关火，盛盘', e'对于快速做法：直接在有半熟鸡蛋的锅中加入西红柿块，与鸡蛋一起翻炒直至西红柿软烂。
可以考虑加入两滴生抽替代盐进行调味。
可以考虑向鸡蛋中加入 1ml 醋，去除腥味，令鸡蛋更蓬松。
可以考虑加入 10ml 番茄酱和 50ml 清水，增加汤汁。
可以额外加入一些其它熟肉和材料。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (248, 0, '荤菜', e'辛辣
鲜香', '大展身手', '3', '回锅肉', '回锅肉是一道色香味俱全的特色传统名菜，属于川菜系。正宗回锅肉使用二刀肉制作，肉质坚实，肥瘦合适。此菜谱详细介绍了回锅肉的做法，包括必备原料和工具、计算用量、具体操作步骤以及简易版本，还提供了一些小贴士。', e'五花肉（0.5斤/男人，0.3斤/女人）
小葱2棵
生姜10 - 40g
青红椒（根据受辣程度选择，0 - 30g）
蒜苗1把
料酒5ml
豆瓣酱10ml
味精5g
生抽5ml', e'五花肉一段处理：先炙皮，再用钢丝球洗净皮，然后放入锅中，加能淹没五花肉的水、生姜片、料酒和打结的小葱，大火煮开撇浮沫，继续煮15分钟至瘦肉能用筷子轻松刺穿。
配菜处理：青红椒切圈，蒜苗切段，生姜切小薄片，将5ml豆瓣酱和5ml生抽提前混合。
五花肉二段处理：将煮熟的五花肉捞出放入冷水晾凉，擦干水后切成上肥下瘦的2mm薄片。
开始炒肉：锅烧热放底油滑锅，放入五花肉煸炒至肥肉透明、肉片微卷，倒入豆瓣生抽混合物和5g味精翻炒15秒，放入青红椒圈和小姜片，再放入另5ml豆瓣酱翻炒30秒，放入蒜苗翻炒60秒后出锅。
简易版本：选用冰冻五花肉常量放置0.5小时或鲜五花肉放冰箱冷藏1小时，切成2 - 5mm薄片，中火干煸辣椒30 - 45秒后取出，锅烧热放底油滑锅，放入姜片煸炒15秒，倒入五花肉，间隔10S翻炒一次，待五花肉出现焦黄色，倒入之前干煸过的辣椒，生抽调味，继续翻炒60秒后出锅。', e'不喜欢蒜苗可换成洋葱或其他蔬菜，但要注意蔬菜易熟程度提前炒至。
回锅肉比较大块可切成5厘米见方的块，煮至筷子稍微用力可插入猪皮即可。
回锅肉过冷水晾凉后肉质更紧致。
回锅肉擦干水可避免炒的时候爆油溅伤。
回锅肉不要切厚，否则很腻。', e'./1.jpeg
./2.jpeg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (249, 0, '汤与粥', '鲜', '得心应手', '30', '皮蛋瘦肉粥', '皮蛋瘦肉粥是一道营养丰富、口感鲜美的传统粥品。以大米为基础，加入皮蛋、瘦肉等食材，经过精心熬制而成。具有浓郁的鲜味，是早餐的不错选择。', e'饮用水1升
皮蛋2颗
瘦肉100g
大米150ml
小葱1棵
香菜1棵
生菜4叶
生姜1拇指块
酱油5ml
蚝油5ml
盐2g
胡椒粉1g
食用油10ml', e'大米洗净，放入电饭锅内胆，加入1升饮用水。
瘦肉洗净，简易晾去水分，加入10ml食用油，揉搓均匀，放入电饭锅内胆。
皮蛋去壳，洗净，对半切开，分离蛋白蛋黄，蛋白简单切碎块，蛋黄揉碎，放入电饭锅内胆。
生姜洗净，削皮，去除枯黄枯黑无法食用部分，切丝，放入电饭锅内胆。
小葱洗净，去除根部和枯黄枯黑无法食用部分，切碎，放入小碗备用。
香菜洗净，去除根部和枯黄枯黑无法食用部分，切碎，放入小碗备用。
生菜洗净，去除根部和枯黄枯黑无法食用部分，切碎，放入小碗备用。
将酱油、蚝油、盐、胡椒粉搅拌均匀，放入小碗备用。
使用电饭锅煮粥模式将主料煮熟。
待主料煮熟后，生菜单独过一次热水，并与其余配料一同开盖加入主料中搅拌均匀。
将酱料与其余配料一同开盖加入主料中搅拌均匀。', e'计量和处理食材时有条件带上一次性手套，生蔬食材建议提前洗净放置一旁。
作为早餐时可提前一夜准备好主料，保温模式到第二天早餐，再添加配料和酱料。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (250, 0, '荤菜', e'咸
甜
酸
辣', '得心应手', '10', '鱼香茄子', '这道菜超级下饭，色香味俱全', e'茄子2根
肉末20g
盐3 - 5g
糖5 - 10g
味精5g
生抽10ml
老抽5ml
醋10ml
水淀粉100ml
豆瓣酱20 - 30g
小葱、姜、蒜、小米辣 （根据自己口味）', e'将茄子切成条。
将肉切成肉沫，葱姜蒜切碎、小米椒切丁。
调鱼香汁：碗中放入盐、味精、糖、生抽、老抽、醋、水淀粉搅拌均匀。
锅中倒入300ml油，开小火，等油温七成热放入茄子炸两分钟，当茄子边缘微黄就捞出。多出的油可以盛出以后炒菜用。
锅中留15 - 30ml油，倒入肉沫炒至颜色变白就盛出来。
锅中倒入15 - 30ml油，放入豆瓣酱、葱白、姜、蒜炒香，然后倒入肉沫翻炒均匀。
加入80 - 150ml清水，倒入茄子、倒入料汁，爆炒入味收汁。最后放入葱翻炒均匀，就可以起锅了。', e'茄子看个人喜好，可以去皮，肉沫也可以多放一点。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./yxqz1.jpg
./yxqz2.jpg
./yxqz3.jpg
./yxqz4.jpg
./yxqz5.jpg
./yxqz6.jpg
./yxqz7.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (251, 0, '荤菜', e'辛辣
鲜香', '得心应手', '8', '孜然牛肉', '这道菜以牛肉为主料，搭配青椒等食材，通过一系列烹饪步骤制作而成，具有浓郁的孜然和辣椒香味。', e'牛柳或牛肩肉（根据人数按250g/人准备）
青椒（根据人数按2颗/人准备，每颗100g）
孜然（根据人数按20g/人准备）
小米椒（根据人数按3颗/人准备，每颗5g）
生抽酱油（根据人数按20ml/人准备）
淀粉（根据人数按10g/人准备）
油（根据人数按15ml/人准备）
盐（根据人数按3g/人准备）
葱（根据人数按1根/人准备，每颗20g）', e'首先将小米椒切碎，和孜然粒一起放入捣药罐捣碎成颗粒（时间紧张可跳过）。
青椒切头去籽（喜欢辣的可不去），切成丝，葱切段。
牛肉提前解冻，洗净，晾干或用厨用纸吸干，顺着纹理切成片。
进行腌肉，加入生抽，淀粉，油，均匀搅拌，静止30分钟。
热锅下油，放入葱，爆出香味后放入腌好的牛肉煸炒。
牛肉变色后均匀放入孜然辣椒颗粒并炒熟。
然后下入青椒丝，断生后放盐。
大火炒1分钟后关火再翻炒30秒保证受热均匀即可出锅。', '如果没有捣药罐，可不进行捣碎孜然和小米椒的步骤。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (255, 0, '素菜', '鲜', '轻松上手', '15', '鸡蛋羹', '鸡蛋羹，又称水蒸蛋，不需要准备复杂的食材，是一道简单快捷易做的菜，当早餐或是正餐都可。', e'鸡蛋2个
食用盐3g
香油（或芝麻油）2 - 4ml
生抽 / 味极鲜8ml
白醋（或料酒）2ml（可选）', e'两个鸡蛋放入碗中打散。
加入食用盐3g。
加入2ml白醋，去除鸡蛋的腥味（可选）。
向碗中加入鸡蛋体积1 - 1.5倍的70度纯净水，并且搅拌均匀。
过滤蛋液，去掉蛋液中的浮沫（可选）。
向任意一口锅中加入50ml清水，水烧开后，放入盛有鸡蛋液的碗。
蒸碗要盖上一个盖子，倒扣一个有凹槽的铁碟子，或者使用保鲜膜来减少水汽进入，这是为了避免其变成蜂窝状。
中火蒸10分钟。
关火，再闷上5分钟。
出锅。
加入香油和生抽即可享用。', e'盐起到了重要的增加底味和凝固作用。
加入米醋也行，但米醋的颜色会使鸡蛋微微发黑。
还可以加入料酒，同样具有去腥的作用，且没有醋的酸味。
1倍的水鸡蛋更弹，1.5倍的水鸡蛋更嫩。
不过滤蒸出来的蛋会有气泡导致不好看。
蒸碗要盖上一个盖子，倒扣一个有凹槽的铁碟子，或者使用保鲜膜来减少水汽进入，这是为了避免其变成蜂窝状。
也可用藤椒油代替香油，增加麻爽口感。
上面介绍的是基础水蒸蛋做法，可以在此基础上派生，添加诸如火腿肠、肉馅、虾皮等材料，丰富鸡蛋羹的口感。', './鸡蛋羹.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (256, 0, '素菜', e'咸
甜', '轻松上手', '4', '炒青菜', '炒青菜制作简单方便，预计10分钟即可完成。加入白糖会让青菜颜色更绿。', e'青菜100g*份数
食用油10 - 15ml（覆盖锅底即可）
食盐2g*份数
饮用水70ml*份数
白糖5g*份数', e'青菜掰成小瓣，用清水洗净，备用。
中火或大火热锅后，锅内放入10 - 15ml食用油。再等待30秒让油温升高。
将准备好的青菜倒入锅中，翻炒至青菜变软（约1分钟）。
倒入计算好的清水，水位应当完全浸润或即将没过青菜，加入食盐 （2g*份数），继续翻炒约1分钟。
最后加入白糖小火加热2分钟，加热时盖上锅盖。
盛盘。', '加入白糖，会让青菜颜色更绿。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (257, 0, '水产', '鲜', '大展身手', '15', '油焖大虾', '一道色香味俱全的美食，以虾为主要食材，经过剪须、挑沙包、虾线，炸料油，烹饪虾并调味，最后收汁浇汁等步骤制作而成。制作过程参考B站老饭骨视频[从小吃到大的油焖大虾居然是假的？泰斗级大师还原真·味道](https://www.bilibili.com/video/BV17f4y1W7z9)。', e'黑虎虾或明虾10只
花椒5g
葱50g
姜20g
黄酒30g
盐3g
冰糖10g
植物油', e'剪虾枪到根上，虾须虾爪都剪掉，沙包挑掉，开背虾线挑出来，洗净备用。
炸料油：油温三成热放花椒，油热离火，放葱姜（不要让油变色最好）葱稍微变黄沥油 （葱油弄多了可以留着作为拌面使用）。
下油，虾摆放整齐，两面变色后轻轻摁虾头。
放姜米（姜切成细颗粒）。
加入黄酒30g。
加入水两小碗。
加入盐3g。
加入冰糖10克。
大火烧开转小火盖盖子闷（中途不能再加汤水，不要开盖）。
皮亮虾弯就可以起锅，虾摆盘。
收汁（过滤后倒回锅里收浓，放葱油 ） 汤汁剩余1/4时。
浇汁。', e'葱油弄多了可以留着作为拌面使用。
中途不能再加汤水，不要开盖。', './油焖大虾.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (258, 0, '素菜', e'酸
辣', '轻松上手', '3', '酸辣土豆丝', '酸辣土豆丝是一道简单易做的菜。色泽光亮，酸辣可口。辅料辣椒富含维生素C。该菜用料简单，好学易做', e'土豆240g
大蒜4瓣
青椒0.5个
红椒0.5个
干辣椒3个
葱1根
生抽5ml
陈醋10ml
盐2g
食用油10 - 15ml', e'土豆去皮、切丝（或用刨丝器）。
切好的土豆丝用清水清洗，去除多余的淀粉，然后对土豆丝焯水10秒。沥干，备用。
葱蒜干辣椒切小块，青红椒切丝。
热锅，小火热油爆香蒜和干辣椒。
加入青红椒翻炒几下，加入土豆丝翻炒至变色。
加5ml生抽，10ml陈醋，蒜末，最后加入盐翻炒均匀即可。', e'清洗土豆丝淀粉一定要去干净，不然会全黏在一起
加入蒜末、盐后应尽快出锅，保留蒜香以及避免破坏口感。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (259, 0, '素菜', '鲜', '轻松上手', '7', '西葫芦炒鸡蛋', '西葫芦炒鸡蛋是一道简单易做的家常菜。简单易购的食材，好吃又下饭。', e'西葫芦500g
鸡蛋3个
西红柿100g
食用油10 - 20ml
食用盐6g', e'西红柿洗净，切成小块，备用。
西葫芦洗净，切成边长约为4cm的菱形，备用。
打三个鸡蛋到碗里，打散搅匀，备用。
热锅，锅内放入5ml - 10ml食用油。
倒入鸡蛋，保持翻炒至鸡蛋成固体，用锅铲分成小块后盛到碗里，备用。
锅内放入5ml - 10ml食用油，倒入西红柿，炒至变软。
倒入西葫芦一起翻炒均匀，放入6g食用盐，将火调小然后等待4 - 5分钟。
倒入备用的鸡蛋，中火翻炒15秒。
关火，盛盘。', '', './西葫芦炒鸡蛋.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (260, 0, '素菜', '甜', '小试牛刀', '6', '拔丝土豆', '拔丝土豆是一道色香味俱全的特色名菜，属于鲁菜系', e'土豆2个
食用油300ml
淀粉30g
白砂糖120g
水100ml
芝麻5g', e'土豆去皮，切均匀的小块。放入淀粉（不加水）搅拌，使得淀粉覆盖土豆表面。
起锅烧油，放入土豆块，缓缓翻滚煎炸5 - 7分钟 ，直至筷子可以插进土豆。
取出土豆，放入大碗备用。
锅中加入水、白砂糖，沿着一个方向慢慢搅动白砂糖，直到白砂糖颜色变成褐色。
重新倒入土豆，翻炒30S后出锅。
土豆盛盘，散上芝麻。', e'土豆煎炸不可太熟透，否则在拔丝端盘时不容易定型，影响美观。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (261, 0, '素菜', '鲜', '轻松上手', '8', '金针菇日本豆腐煲', '金针菇日本豆腐煲是一道容易上手的日常料理', e'金针菇 1-2 把
日本豆腐 2 袋
小米椒 3-5 根
蒜 2-3 瓣
生抽 15ml
蚝油 5ml
老抽 3ml
糖 3g
食用油 10-15ml', e'豆腐切片，小火煎到两面金黄出锅备用。
切蒜成蒜末；将生抽，蚝油，老抽，糖，100ml 水调汁备用。
热锅放油，油热放小米椒、蒜末爆香，先放金针菇，炒软，把煎好的豆腐平铺在金针菇上，倒入配好的料汁，焖 5 分钟，大火收汁。', e'金针菇一定要先炒软
豆腐尽量不要翻炒，容易碎', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (262, 0, '素菜', '鲜', '轻松上手', '1', '菠菜炒鸡蛋', '这道菜难度系数简单，营养丰富。', e'菠菜 350g
鸡蛋 2 个
食用油 15ml
食用盐 5g', e'菠菜去根，洗净，放在篮子里，焯水
将鸡蛋打入碗中，搅匀
热锅，加入 10ml 油
油热后，倒入鸡蛋液，中火翻炒 15 秒，先煎成蛋饼，然后再用锅铲切成小块
关火，将鸡蛋块盛到盘子中，不要洗锅
重新开火，倒入 5ml 油，油热后，放入菠菜，大火翻炒 15 秒后，倒入鸡蛋块，翻炒均匀
加入 5g 盐、100ml 饮用水，大火翻炒 10 秒
关火，盛盘', '', './菠菜炒鸡蛋.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (264, 0, '素菜', e'酸
咸', '轻松上手', '15', '凉拌黄瓜', '凉拌黄瓜是一道清爽可口的凉拌菜，制作简单，口感丰富。', e'黄瓜 200 克/份
醋 7.5 ml + 4 ml/份
酱油 5 ml + 2.5 ml/份
蒜 3 瓣/份
盐 0.4 克 + 0.2 克/份
香油 5 ml + 2 ml/份
蚝油 5 ml', e'用菜刀将黄瓜拍扁，再剁成长 3 厘米的碎块
将碎黄瓜装入碗中
将蒜拍碎切成碎末
将醋，酱油，盐，蚝油和蒜依次倒入碗中搅拌均匀并腌制 15 分钟
将香油倒入碗中并均匀搅拌', e'部分情况下黄瓜端头有苦味，请洗净切下后确认
做好之后直接开吃，亦可先准备好后放入冰箱冷藏（并非冷冻）后食用
若放入冰箱冷藏，则需使用保鲜膜包紧，并在 8 小时内食用完毕，否则黄瓜会因过度腌制失去清脆口感
推荐黄瓜去皮，口感更好', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (265, 0, '素菜', '鲜', '小试牛刀', '11', '素炒豆角', '一道巨下饭的家常菜', e'豆角250g
小米椒2个
葱3圈
蒜2颗
生抽6ml
老抽2ml
蚝油6ml
盐6g', e'葱切花，蒜切末，备用。
生抽、老抽、蚝油、盐混合调料汁，备用。
小米椒切圈，备用。
豆角去筋，45°斜切4 - 10cm小段，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱、小米椒，翻炒至闻到香味。
加入豆角，翻炒30s。
加入料汁，开大火翻炒2分钟。
倒入150ml水。
转中小火，盖上锅盖焖制8 - 10分钟。
加入蒜末，出锅。', '切豆角需要一定的刀工，不会的可以使用剪刀', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (266, 0, '素菜', e'咸
甜', '轻松上手', '4', '炒青菜', '炒青菜制作简单方便，预计10分钟即可完成', e'青菜100g*份数
食用油10 - 15ml（覆盖锅底即可）
食盐2g*份数
饮用水70ml*份数
白糖5g*份数', e'青菜掰成小瓣，用清水洗净，备用。
中火或大火热锅后，锅内放入10 - 15ml食用油。再等待30秒让油温升高。
将准备好的青菜倒入锅中，翻炒至青菜变软（约1分钟）。
倒入计算好的清水，水位应当完全浸润或即将没过青菜，加入食盐 （2g*份数），继续翻炒约1分钟。
最后加入白糖小火加热2分钟，加热时盖上锅盖。
盛盘。', '加入白糖，会让青菜颜色更绿。', '', '份数', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (267, 0, '素菜', '辛辣', '轻松上手', '3', '凉拌莴笋', '凉拌莴笋是一道开胃小菜', e'莴笋 1 根
萝卜 0.25 根
小米辣 2 个
姜 1 片
蒜头 2 粒
盐 5 g
食用油 25 ml', e'莴笋削皮，切小条。萝卜切条，一起放入大碗，加入盐搅拌，放置 10 分钟。
放置后的莴笋用水清洗 1 - 2 遍。
起锅烧水，放入莴笋，水煮 1 分钟捞出，沥干水分，放入大碗。
起锅烧油，放入姜片、蒜粒、小米椒煸炒 30 - 45 S ，倒入莴笋中。
搅拌充分，端盘。', e'萝卜非必须，只是为了增加菜色。
端盘后，可以根据个人口味，额外增加生抽、白砂糖、香醋、芝麻等佐料。
莴笋条的大小看个人口感决定，但莴笋皮要尽量多削点，不然真的影响口感。
冰镇效果更加。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (268, 0, '素菜', '鲜', '得心应手', '5', '茭白炒肉', '茭白味道鲜美，有一定营养价值，与瘦肉搭配炒制，色香味俱全。', e'茭白2根
瘦肉100g
淀粉15g
食用油30ml
鸡精5g
姜1片
蒜1个
料酒5ml
盐2g', e'准备：茭白切片，每片厚度0.5cm；瘦肉切条，厚度0.3 - 0.5cm，加入料酒、生粉、盐、水搅拌；姜切片、蒜头剁碎。
制作：起锅水烧开，放入茭白，水煮60 - 90S后取出沥干；起锅，倒入15ml油，倒入瘦肉，反复翻炒60S取出；起锅，倒入15ml油，倒入姜、蒜翻炒30S，加入茭白继续翻炒30S；继续加入瘦肉翻炒60S，加入20ml水，加入盐、鸡精后翻炒60S出锅。', '最后一个步骤，可以考虑加蚝油、生抽代替盐上色。对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (269, 0, '素菜', '辛辣', '小试牛刀', '5', '小炒藕丁', '小炒藕丁是一道简单易做的菜，莲藕营养丰富，非常适合素食。', e'大葱1段
小米辣1 - 2根
莲藕1段
生抽30ml
老抽15ml
蚝油15ml
食用油10 - 15ml', e'大葱、小米辣切小段，备用
莲藕去皮，切成不超过3cm的小块，放入水中备用（防止氧化发黑）
取炒锅，锅内放入500ml凉水，煮沸
将藕丁下入沸水中，焯水2分钟后，取出放入盘中备用
将锅中水倒掉后，将锅加热干燥，加入10 - 15ml食用油
待油温升高后，下入葱花，小米辣爆香
将处理好的藕丁下入锅中，大火翻炒
加入生抽、老抽、蚝油
翻炒2分钟即可出锅', e'食用莲藕要挑选外皮呈黄褐色、肉肥厚而白的。如果发黑，有异味，则不宜食用。
请尽量不要使用铁器，会导致莲藕发黑', './小炒藕丁.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (270, 0, '素菜', e'鲜
咸
甜
辣
酸', '轻松上手', '5', '凉拌木耳', '凉拌木耳是一道制作简单且健康的菜品，因发放物资中有干货，木耳作为较为健康的食材被选用，其烹饪方式相对简单。', e'干木耳20g（或湿木耳120g）
蒜瓣2 - 3个
小米辣2个
盐2g
白糖5 - 10g
生抽15ml
醋15ml
香油5ml
芥末约2cm（可不加）', e'1. 若用干木耳，用约400ml水泡发45分钟，湿木耳跳过此步骤。
2. 将泡发好的木耳去根并彻底洗净。
3. 起锅烧水，水开后放入木耳，大火煮1.5 - 2分钟。
4. 将蒜瓣、小米辣切碎放入碗中，依次加入盐、糖、生抽、醋、香油、芥末。
5. 木耳盛出后沥水，放入碗中。
6. 搅拌充分后即可端盘。', e'1. 调味品数量可根据个人口味调整，不喜欢芥末可不加。
2. 木耳冷却入味后口味更佳，约15分钟。', e'1.jpg
2.jpg
3.jpg
4.jpg
5.jpg
6.jpg
7.jpg
8.jpg
9.jpg
10.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (271, 0, '素菜', e'鲜
甜', '得心应手', '3', '脆皮豆腐', '浓郁的酱汁裹满豆腐，吃一口就停不下来，别提有多好吃。', e'老豆腐 1 块
鸡蛋 2 只
生抽 20 g
蚝油 10 g
老抽 5 g
白糖 10 g
玉米淀粉 50 g
清水 200ml', e'鸡蛋搅拌形成蛋液放置备用
配置酱料 （20 g 生抽+10 g 蚝油+5 g 老抽+10 g 白糖+10 g 玉米淀粉+200 ml 清水）
老豆腐切片 （个人建议，仅供参考  人 * 5 片，厚度 1.2 cm）
玉米淀粉倒入盘中，将老豆腐片粘上淀粉后，粘上蛋液，放置一旁
热锅，锅内放入 18ml 食用油。等待 10 秒让油温升高
将粘上蛋液的老豆腐片均匀放入锅中，铺好锅底，小火煎至金黄翻面
待两面煎至金黄后，倒入酱料，让每块豆腐都沐浴在酱料中，大火 3 分钟至酱汁浓稠
关火', '无', '无', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (272, 0, '素菜', '鲜', '轻松上手', '15', '陕北熬豆角', '陕北熬豆角是一种对初学者极其友善的菜，因其制作方式使用`熬`的方式，食材可多可少，可有可无，几乎不存在失败的可能性。', e'豆角300g
土豆1个
西红柿1个
螺丝椒2个
盐6g
生抽6ml
五香粉3g
蚝油6ml
葱3圈
姜2g
蒜2颗
香菜碎根据口味添加', e'葱切花，蒜切沫，姜切丝，备用。
豆角去筋，切2-10cm小段，备用。
土豆去皮，切1cm³小块，备用。
西红柿去皮，切1cm³小块，备用。
辣椒去仔，切0.15cm宽条，备用。
起锅烧油(10ml - 15ml)，冒烟后放入葱姜蒜，翻炒至闻到葱姜蒜香味；
加入豆角，翻炒至变色（青绿色变为翠绿色）；
加入土豆块，翻炒30s；
加入热水（水面刚刚漫过菜），盖上锅盖熬至土豆变软（可以用筷子确认）；
加入西红柿块，加入盐，生抽，蚝油，五香粉，辣椒，熬至西红柿成汁（注意搅拌，防止糊锅）；
加入香菜碎，出锅。', e'加入西红柿后开始继续熬制后，需要偶尔翻搅防止糊底
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (273, 0, '素菜', '', '得心应手', '8', '茄子炖土豆', '一道美味的家常菜，以茄子、土豆和肉为主要食材，通过特定烹饪步骤制作而成。', e'茄子（份数 * 1个，每个约150g）
土豆（份数 * 1个，每个约150g）
肉（份数 * 180克）
辣椒50克
酱油（份数 * 15毫升）
盐（份数 * 5克）
蒜3瓣', e'将茄子、土豆、辣椒洗净，蒜扒皮并拍碎。
将茄子、土豆切成约6立方厘米的块，辣椒切成5克的小块，肉切成3厘米的丝。
开火，热锅，加入份数 * 13毫升的油。
当能看到锅里的油冒出一丝烟时，放入辣椒。
煸出辣椒香气后，立刻放入肉，用铲子翻炒30秒。
放入土豆，翻炒30秒。
放入茄子，翻炒30秒。
放入酱油和盐，继续翻炒5分钟。
加入水，水面高度为锅内食材高度的0.9倍，并盖上锅盖。
等待，直到锅内水的高度剩余食材高度的0.1倍时，开盖，放入蒜，搅拌均匀，关火。', '在操作的第5-7步骤中要注意：在此过程中注意锅底如果没有液体（油或水），则加5毫升的水再继续翻炒。', '', '2-3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (274, 0, '素菜', '鲜', '轻松上手', '30', '芹菜拌茶树菇', '芹菜拌茶树菇是一道简单易做的凉拌菜，富含多种人体所需的维生素和矿物质。', e'闽星茶树菇1瓶
芹菜250 - 300g
香油5ml
蚝油大约7ml
味极鲜3ml
食用盐大约2g', e'（如果是芹菜苗这一步略过）用热水壶烧一壶热水，备用
新鲜的芹菜苗或者芹菜摘去黄叶清洗，备用
（如果是芹菜苗这一步略过）将芹菜摘去叶子单独放一个盆中，将芹菜茎用刀划成2 - 3毫米宽的芹菜条备用
芹菜苗切成4cm的芹菜段，备用
（如果是芹菜苗这一步略过）起锅开火，将热水壶的开水倒入锅中待水起泡沸腾
（如果是芹菜苗这一步略过）将切好的芹菜条放入锅中焯水，大约20秒放入芹菜叶，5秒后关火全部捞出过凉水，备用
将盆中焯好的芹菜或者芹菜苗撒上准备好的食盐，香油，耗油和味极鲜搅拌均匀
将茶树菇倒入盆中搅拌均匀
装盘', e'焯水时的水位需要没过芹菜
芹菜叶太老太硬的话可以不要', e'./芹菜拌茶树菇.jpg
./闽星茶树菇.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (275, 0, '素菜', '鲜香', '得心应手', '14', '红烧冬瓜', '红烧冬瓜是一道具有色泽红亮，香鲜味美、营养价值丰富的家常菜', e'冬瓜 300g
食用油 50ml
料酒 2ml
淀粉 10g
生抽 10ml
老抽 15ml
鸡精 3g
香葱 0.5 根
姜末 1 粒
蚝油 15ml', e'冬瓜去皮，切边长不超过 2cm 小块。
起锅烧油，放入冬瓜，缓缓翻滚煎炸 2 分钟 ，直至冬瓜表面泛金黄色。
取出冬瓜，放入大碗备用。
利用锅中的剩余油，依次放入姜末、生抽、蚝油，翻炒 15S。
重新倒入冬瓜，翻炒 30S 后，加入开水，水要没过冬瓜表面，大火煮 10 分钟。
加入老抽上色，继续煮，直至冬瓜软糯（筷子可以轻松插近冬瓜）。
加入鸡精、料酒、香葱翻炒后 30S， 取出冬瓜到大碗中。
锅中剩余汤汁保留，倒入水淀粉，煮开后汤汁浇灌在冬瓜表面。', '遵循本指南的制作流程而发现有问题或可以改进的流程，请提出 Issue 或 Pull request 。', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (276, 0, '早餐', '', '大展身手', '33', '完美水煮蛋', '科学家研发的循环水煮法，可同时达到蛋黄绵密、蛋白均匀凝固且保留最多营养素的效果。需精准控制温度与时间，难度较高。', e'新鲜鸡蛋1个（约60g）
100°C沸水1500ml
30°C温水1500ml', e'准备两锅水：A锅维持100°C沸水，B锅维持30°C温水。
用漏勺将鸡蛋放入A锅，启动计时器。
精准每2分钟将鸡蛋转移至另一锅水。
重复转移操作共16次（总时长32分钟）。
最后一次转移后，在B锅静置30秒。
立即放入冰水终止加热（维持30秒）。
剥壳时从钝端气室处开始，沿纵轴剥离蛋膜。', '关键参数：蛋黄中心温度67±1°C，蛋白分层温度：外层100°C→87°C，中层87°C→55°C，内层55°C→30°C；营养优势：多酚含量比传统煮法高23%。', 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1yBdnK.img?w=768&h=512&m=6', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (277, 0, '素菜', '咸', '小试牛刀', '9', '椒盐玉米', '椒盐玉米是一道美味可口的素菜，制作过程并不复杂。通过合理的解冻、裹淀粉、煎制和调味步骤，能轻松做出色香味俱佳的椒盐玉米。', e'玉米粒（袋装）350g
淀粉40 - 70g
椒盐粉10g
芝麻粒10g
油
若干吸油纸', e'玉米粒直接解冻，可温水泡15分钟或灶上开水煮5分钟（带着包装一起煮，撕掉一个口）。
拿出一个簸箕垫上吸油纸，倒入解冻好的玉米粒，摇晃直到吸油纸变湿，再倒入第二个垫有吸油纸的簸箕重复操作，直至玉米表面无明显水滴但保持湿润。
倒入大量淀粉，摇晃至淀粉裹住玉米粒。
开灶放锅，倒入油铺满锅底，油热8成，倒入裹淀粉的玉米粒，中火先煎30s，不要翻炒。
轻微翻炒3分钟出锅，撒上3g椒盐和芝麻粒。', e'玉米粒不要自己剥，可通过外卖软件买已剥好的，30分钟送达后温水解冻。开水解冻慢就拿开水煮（带着包装一起煮，撕掉一个口）。
操作过程中注意不要过度翻炒，以免淀粉掉落。', './椒盐玉米.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (278, 0, '素菜', '辛辣', '得心应手', '5', '干锅花菜', '干锅花菜是湘菜常见的一道菜', e'花菜 400g
五花肉 100g
辣椒 1 - 2 根
生抽 10ml
白糖 5g
蒜 3 - 4 个
盐 2g
油 10ml', e'花菜朵朝下，没入淡盐水中浸泡 20 分钟。然后洗净用小刀拆成小朵。
入开水锅中焯水 1 分钟，捞出立即用冷水冲淋至完全凉透，沥水备用。
五花肉切成薄片，大蒜白色切下用刀背拍扁，小红辣椒切成段。
锅烧热放油，油热下大葱白爆香。
下五花肉片入锅，用中火煸炒至表面全部变色，继续煸炒一会儿，把肥肉部分的油份逼出一部分。
倒入红辣椒段和花菜，翻炒几下。
加入 10ml 生抽。
再加入 5g 白糖，转大火不断翻炒 1 分钟。
把大蒜叶部分切成段，放入锅中，翻炒几下后，关火盖上盖子焖 1 分钟即可。', '如果您遵循本指南的制作流程而发现有问题或可以改进的流程，请提出 Issue 或 Pull request 。', './干锅花菜.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (279, 0, '素菜', '鲜', '得心应手', '7', '地三鲜', '地三鲜是一道经典的东北菜，由茄子、土豆和尖椒三种蔬菜搭配烹制而成。这道菜口感丰富，咸香可口，是一道深受大众喜爱的家常菜。', e'茄子100g
土豆150g
尖椒3 - 4个
葱3g
姜10g
蒜10g
豆瓣酱20ml
生抽10ml
盐8g
糖10g
淀粉20g', e'土豆洗净、去皮。茄子、尖椒洗净。
葱切0.5cm小段。蒜剁碎。姜切沫。
茄子、土豆、尖椒均切成15g的小块。
热锅，加入25ml油。
加入土豆，煎炸大约3分钟，待其到大约8分熟，以显示金黄色为准。
捞出土豆，留下油。
加入茄子，煎炸大约40秒，待其到大约7分熟，以显示金黄色为准。
如果锅内已经没有流动的油，可以考虑补充15ml油。
放入葱、姜。
放入豆瓣酱。
放入生抽。
放入盐。
放入糖。
放入之前处理的土豆。
放入尖椒。
翻炒1分钟。
放入蒜。
加入200ml水和20g淀粉。
待水开后，汤减少一半时，关火盛盘。', e'煎炸土豆和茄子时，要注意火候和时间，以免炸糊。
加入淀粉水后，要不断搅拌，以免粘锅。
如果喜欢吃辣，可以加入适量的干辣椒。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (280, 0, '素菜', '鲜', '小试牛刀', '6', '葱煎豆腐', '葱煎豆腐是一道美味的素菜，制作过程相对简单，口感鲜嫩，葱香四溢。', e'白豆腐（数量 = 份数 * 0.8 向上取整）
葱（数量 = 2 根/三人）
青辣椒（数量 = 1.5 只/三人）
盐（盐量 = 份数 * 3g）
鸡精（鸡精量 = 份数 * 1.5g）', e'豆腐洗净，切约 5mm 厚度，置于碟中。
葱洗净，除去根部，切成葱花，备用。
辣椒洗净，切开，去籽，切成 1cm * 1cm 状，备用。
热锅，加入份数 * 9ml 油。
油入锅后，使其均匀布于锅底，均匀放入豆腐，小火煎至金黄翻面。
待两面金黄，盛入碟中备用。
补油至覆盖锅底，倒入辣椒大火翻炒，并铲碾 3 分钟。
倒入豆腐，翻炒，加入盐与鸡精，中火翻炒 1 分钟后倒入 10ML 水，大火收汁。
出锅前撒上之前计算好的葱花，起锅盛盘。', e'计算原材料数量时，要根据实际份数准确计算，确保用量合适。
煎豆腐时要小火慢煎，保证两面金黄且熟透。
翻炒辣椒和豆腐时要注意火候和时间，避免炒糊。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (281, 0, '素菜', e'辛辣
鲜香', '小试牛刀', '8', '榄菜肉末四季豆', '这道菜将四季豆的清爽、五花肉的醇厚、橄榄菜的独特风味以及小米辣的辛辣巧妙融合，味道鲜香可口。', e'四季豆220g
五花肉100g
橄榄菜20g
大蒜10g
小米辣10g
20ml油
2ml酱油
2g盐
1g鸡精
1g胡椒粉
0.5g糖', e'将四季豆洗净，撕去筋，切成大小均匀的颗粒备用。
将大蒜拍碎剁成蒜末备用。
将小米辣切成大小均匀的颗粒备用。
将五花肉去皮，剁成肉末备用。
将锅烧热，加入20ml油滑锅，滑好后倒出热油，加入10ml冷油；若没有晾油瓶，可直接放肉末小火煸炒两分钟炒出猪油。
肉末炒香后加入蒜末、橄榄菜和小米辣炒出香味。
加入四季豆开中火煸炒至少5分钟至熟透。
四季豆炒熟后加入2ml酱油从锅边淋入，再加入2g盐、1g鸡精、1g胡椒粉和0.5g糖。
将调料翻炒均匀后出锅装盘。', e'制作过程中一定要确保四季豆熟透，避免食物中毒。
热锅冷油可防止肉末粘锅，若没有晾油瓶也可不进行滑锅操作。', './榄菜肉末四季豆.JPG', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (282, 0, '素菜', '鲜', '得心应手', '5', '蚝油三鲜菇', '几分钟就能做出的蚝油蘑菇，滑嫩入味鲜美可口', e'鲜香菇2朵
蟹味菇30g
白玉菇30g
小米辣1根
菜椒0.5颗
食用油10ml
食用盐5g
料酒2ml
淀粉10g
生抽10ml
鸡精3g
香葱0.5根
姜末1粒
蚝油5ml
开水350ml
西蓝花100g', e'蟹味菇、白玉菇去掉根部泥土，掰散菌朵
香菇切片（每片厚度0.5 - 1cm）
生粉倒入小碗中，加入50ml水，搅拌生粉直至融化没有颗粒（即水淀粉）备用
水开，放入西蓝花，清水煮3分钟，放入碗中备用
洗锅烧开水，加入5g食用盐，倒入蟹味菇、白玉菇、香菇，水煮1分钟
1分钟后，捞出沥干水分
起锅烧油，待油开始冒小泡，放入姜末、小米辣、菜椒煸炒30S
倒入三鲜菇，然后依次倒入生抽、蚝油、鸡精，翻炒均匀后，倒入水淀粉
中火烧干汁，加入料酒、葱花出锅
摆上西蓝花', '', e'./1.jpeg
./2.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (283, 0, '素菜', '鲜', '轻松上手', '5', '蚝油生菜', '这道菜富含维生素，做法简单，尝起来爽口又不上火。', e'生菜1棵（200g ± 50）
蚝油6 - 8ml
大蒜4 - 5瓣
生抽6ml
盐0.5g
白糖1g
食用油5 - 8ml', e'生菜洗净并去掉烂菜叶。
热锅，先放1L清水（凉），然后在锅内放入2ml - 3ml食用油和0.5g盐，等待锅中的水煮沸。
水沸后，放入生菜，将每一片生菜叶都焯水10s。
捞出生菜，控干水份，摆盘 。
调汁：将生抽10ml、蚝油6 - 8ml、盐0.5g、白糖1g放入碗中调匀，并加入10 - 15ml清水（凉）搅拌均匀。
再开火，热锅，放入食用油5 - 8ml，油热放入蒜泥。
等待有蒜香飘出，倒入调好的汁，煮沸即可，立马关火。
将锅中的汤汁均匀地浇在生菜上。', '', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (284, 0, '主食', e'鲜
咸', '大展身手', '13', '日式肥牛丼饭', '日式肥牛丼饭是一道美味可口的日式料理，以其丰富的口感和浓郁的风味而受到广泛喜爱。这道菜以肥牛片、洋葱和米饭为主要食材，搭配特制的酱汁，烹制出一道色香味俱佳的美食。肥牛丼饭的制作过程相对简单，适合家庭烹饪。它不仅可以作为一顿美味的晚餐，还可以作为午餐或早餐的选择。无论是在忙碌的工作日还是悠闲的周末，日式肥牛丼饭都能为您带来满足的味觉享受。', e'洋葱 1个
肥牛 250克
葱 1 - 2根
白芝麻 5克
味淋 40g（或料酒 30g）
酱油 30g
耗油 20g
糖 5g
老抽 5g（可选）
清酒 15g（可选）', e'洋葱剥去外层去芯，切成月牙状；葱洗净切成 0.5cm 的小段；热锅直接放入白芝麻，前后晃动锅体使芝麻均匀受热至略呈金黄色；肥牛焯水 1 分钟后捞出；将 40g 味淋（或 30g 料酒），30g 酱油，20g 耗油，5g 糖，5g 老抽（可选），在碗中搅拌混合成调料。
热油锅放入洋葱，快速翻炒至洋葱变透明状；关小火，加入 250g 水（或出汁），开回大火加热等待 3 分钟；加入牛肉和调料；不断翻动所有食材 10 分钟，防止食材粘锅；关火；盛装肥牛丼至米饭上（注意要把汁水淋一些在饭上）；撒上葱花和白芝麻。
冷藏的牛丼每次取出需要吃的份量，加热后盖在米饭上。微波炉：单人份高火 2 - 3 分钟；锅：需额外加 50ml 水，加热时需不断翻动。', e'如果用的是比较不错的牛肉，可以选择不焯水，能够更加保留牛肉的风味，因为加入了味淋所以不会很腥，无需担心牛肉不熟，加热 10 分钟肯定熟了。
如果有条件，选择加入 15g 清酒。
冷藏的牛丼加热时，微波炉单人份高火 2 - 3 分钟；用锅加热需额外加 50ml 水，加热时需不断翻动。', './成品.png', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (285, 0, '素菜', e'酸
甜', '轻松上手', '25', '话梅煮毛豆', '酸甜可口、营养价值高的一种简易美食', e'毛豆 300g
话梅 6 颗
食用盐 2g', e'将清水加入食用盐，毛豆浸泡 15 分钟
加入开水，倒入毛豆、话梅，水煮 20 - 30 分钟
起锅开吃', '', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (286, 0, '水产', '鲜', '得心应手', '8', '微波葱姜黑鳕鱼', '这道菜改编自西雅图Veil餐厅主厨Johnny Zhu的母亲Margaret Lu的菜谱。原菜谱使用罗非鱼，Johnny改为鳕鱼，也可用大比目鱼鱼排、海鲈鱼、鳟鱼等，每种鱼密度有差别，烹饪时间需微调。', e'黑鳕鱼，带皮，2片，450g
青葱，葱白，25g
青葱，葱绿，10g
姜，13g
料酒，5mL
酱油，25mL
芝麻油，2mL
花生油，50mL', e'鱼片分别放入密封袋，鱼皮向下放在盘子中。
取葱白切丝25g，姜去皮后切丝10g，混合在一起后分成两半，分别放在袋内鱼片上。
每个袋子倒入2.5mL料酒。
封好密封袋，放入微波炉中，中火（800瓦）微波至不透明且容易散开时（约3.5 - 5分钟），从袋中取出鱼片。
去除青葱和姜。
取酱油25mL，芝麻油2mL，混合均匀后平均淋在两片鱼片上。
取葱绿切细丝10g，姜去皮后切丝3g，混合后分成两份撒在鱼片上。
取花生油50mL，在小锅中加热至190℃。
将热油淋到放有葱绿的鱼片上，立刻上桌。', e'每种鱼密度有差别，烹饪时间要做微调。可参考：海鲈鱼整条450g微波6.5分钟；罗非鱼整条800g微波6分钟；大比目鱼片170g微波2.25分钟；龙脷鱼片170g微波1.5分钟。
如果想让香气更为浓郁，在微波前可将葱姜与料酒均匀涂抹在鱼片的两侧，再进行微波加热。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (287, 0, '荤菜', '鲜香', '大展身手', '40', '南派红烧肉', '这是一道色香味俱全的传统名菜，色泽诱人，肥而不腻，香糯无比，搭配米饭非常美味，且是新手不败的菜谱。', e'猪五花肉约2斤
油100 - 150ml（色拉油、猪油、花生油均可）
冰糖约15块
白砂糖30g
老抽15ml
料酒20ml
香叶4片
八角3个
生姜6片
盐2 - 3g
葱（小葱白色部分葱白切成小段，小葱最佳，大葱也可）
蒜（中间切开，不拍扁）
花椒10g
凉水没过食材的量
开水没过食材的量', e'猪五花肉切大块（约4.5cm），生姜切片（每片厚度约3mm），小葱白色部分切成小段，蒜中间切开，将部分葱姜拿出，剩余的生姜、葱白、蒜、花椒、八角、香叶提前放入碗中备用。
凉水锅中放入切好的五花肉，加入料酒与2/5葱姜，煮15分钟去掉血腥，捞出洗净。
按照炒糖色教程中的操作2制作糖色。
将准备好的生姜、葱白、蒜、花椒、八角、香叶还有五花肉倒入锅中大火翻炒，闻到香味后倒入开水至没过全部肉炖煮，普通锅50 - 60分钟，高压锅40分钟。
加入10ml料酒。
盖上锅盖煮至沸腾后，每隔25分钟打开盖子将浮在表面的油和沫捞出。
当水的高度减至肉最高的高度与锅底高度的3/5时，转中火，并捞出除肉和水以外的所有辅料，开始收汁。
打开锅盖，待汤汁快没有呈粘稠状出锅（切记不可收干）。', e'尽量把刀磨锋利。
锅最好选用砂锅，其次是铝锅、高压锅，不要用铁锅、铜锅。
蒜中间切开，不要拍扁，以免影响收汁时的味道。
注意炖煮时间，普通锅和高压锅时间不同。
及时捞出表面的油和沫，收汁时注意不要收干。', '', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (288, 0, '素菜', '鲜', '得心应手', '10', '蒲烧茄子', '蒲烧茄子是一道具有特色的素菜，外观与鳗鱼相似，味道鲜美。', e'1个长的上小下大的茄子（注意不要使用浙茄和圆茄）
20ml蜂蜜
15ml白糖
40ml生抽
10ml老抽
20ml料酒
100ml水', e'茄子削皮、横着切成两段。
蒸5分钟。
纵向切开，不要切断，在两边切面各划2~3刀至可以摊平。
煎至两面金黄。
往茄子上浇蒲烧汁至没过1/2茄子高度。
煎至背面上色，翻面，同时收汁，若无法收汁可以加入水淀粉（生粉和水的比例在1:4到1:10根据收汁情况而定）。
把剩下的蒲烧汁浇在茄子上。
出锅。', e'根据锅的类型决策不同量的油，不粘锅油汇聚成滴后要散布在茄子的面积，铁锅摊开后油可以刚好覆盖锅底。
灵魂在于蒲烧汁，也可以买现成的蒲烧汁。
如果觉得腻可以在装盘后撒点切成2~5mm的小葱，颜色搭配上也能不那么单调。
炒茄子（鱼香茄子、酱爆茄子）墙裂推荐浙茄，细长所以切成滚刀块刚刚好，皮很嫩不像这里需要去皮，茄子的味道适中。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (289, 0, '素菜', e'咸
酸
辣', '轻松上手', '10', '雷椒皮蛋', '雷椒皮蛋是一道简单的下饭凉菜，食材常见，操作简便，虽成品卖相一般，但却是夏天下饭的神器之一。', e'皮蛋2个
长条青椒4根
葱10cm
蒜3 - 4瓣
小米辣3 - 4颗
食用油10 - 20ml
生抽15 - 20ml
陈醋15 - 20ml
白糖6 - 10g
香油5 - 7ml', e'青椒清洗，去除根部，侧面切开，去除内部的子后在案板压平备用。
葱切成半厘米小段备用。
蒜去皮，切成碎末备用。
皮蛋去皮备用。
小米辣切成5 - 10mm的小段备用。
热锅，锅内放入10ml - 20ml食用油。
放入全部青椒，改小火保持锅子温度，煎至青椒变软（可用筷子试，插入即透即可）。
关火，将皮蛋和青椒放入小铁盆中。
可选择用擀面杖一头在小盆中砸击皮蛋和青椒，至皮蛋与青椒混合；也可将青椒用手撕开，撕成大约半厘米的条状，用叉子将皮蛋压碎。
倒入生抽，陈醋，白糖，香油，以及葱、蒜、小米辣，均匀搅拌。', e'制作过程中一定要去除青椒子，否则会在锅里炸开。
砸皮蛋和青椒时注意不要吵到邻居。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (290, 0, '素菜', '鲜香', '小试牛刀', '2', '炒茄子', '家常炒茄子做法简单，原料不复杂，有多种可选材料，制作时需注意油和酱油的用量等，遵循一定流程可做出美味菜肴。', e'茄子（数量 = 份数 * 1.8 个）
八角（数量 = 份数 * 1 个）
虾皮（数量 = 份数 * 正常男子手抓半把）
香葱（数量 = 份数 * 2 颗）
酱油（数量 = 份数 * 40 ml）
菜籽油或花生油', e'将茄子洗净，竖切为两段，每段切菱形块，放入碗中。
将香葱洗净切成葱花，切好八角，分别放案板上。
开火热锅至无水。
往锅内倒食用油，没过锅底两倍。
若有八角等可选材料，热油约 6 成熟时放入；若无则热油至 9 成熟。
待油到 9 成熟，将碗中茄子倒入锅内用锅铲翻炒约 40 秒。
将锅铲悬空与锅平行，把酱油倒入锅铲内，一人约 2.5 锅铲，继续翻炒。
等到锅内茄子变色且变软时捞出。', e'因酱油缘故不必加盐，出锅前可尝，不咸可加微量盐并增加下次酱油量。
加了虾皮可酌情减少酱油量。
炒时一直大火。
一定不可加水，油可多放不可少放。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (291, 0, '素菜', '鲜', '轻松上手', '5', '西红柿炒鸡蛋', '西红柿炒蛋是中国家常几乎最常见的一道菜肴。它的原材料易于搜集，制作步骤也较为简单，所以非常适合新厨师上手，是很多人学习做菜时做的第一道菜。', e'西红柿1个（约180g）*份数
鸡蛋1.5个*份数，向上取整
食用油4ml*鸡蛋/个
盐1.5 - 2g*份数
糖0 - 2g*份数
葱花0 - 10g*份数', e'西红柿洗净。
可选：去掉西红柿的外表皮（开水烫表皮，然后将西红柿放入冷水，剥去外皮）。
西红柿去蒂，切成边长不超过4cm的小块，即为`西红柿块`。
将鸡蛋打入碗中，加入`1g*份数`的盐，搅匀，即为`鸡蛋液`（可考虑向鸡蛋中加入1ml醋，这可以去除腥味，令鸡蛋更蓬松）。
热锅，加入食用油。
油热后，倒入`鸡蛋液`。翻炒至鸡蛋结为固体且颜色微微发黄，即为`半熟鸡蛋`。
关火。将`半熟鸡蛋`盛盘，重新开火（注意：不要洗锅）。
加入`西红柿块`，锅铲拍打并翻炒20秒，或至西红柿软烂。
向锅中加入`半熟鸡蛋`，翻炒均匀（可考虑加入10ml番茄酱和50ml清水，增加汤汁；也可额外加入一些其它熟肉和材料）。
加入剩余的盐、糖（可选，如果倾向于甜味版本）、葱花（可选），翻炒均匀。
关火，盛盘。', e'可以考虑向鸡蛋中加入1ml醋，去除腥味并令鸡蛋更蓬松。
不要洗锅可节省时间。
可根据个人口味加入10ml番茄酱和50ml清水增加汤汁，或额外加入其它熟肉和材料。
遵循不同口味偏好有多种做法，如快速做法：直接在有`半熟鸡蛋`的锅中加入 `西红柿块`，与鸡蛋一起翻炒直至西红柿软烂；加入盐改为“加入两滴生抽”。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (292, 0, '素菜', '鲜', '小试牛刀', '5', '白灼菜心', '白灼菜心是经典粤菜，用煮沸的水或汤将生的食物烫熟，能保持原有的鲜味，是减肥或快速解决绿叶菜的绝佳方式。', e'新鲜菜心250g
食用油10g
生抽5g
蚝油5g
盐5g
糖5g
大蒜四五瓣
小米辣一两根
洋葱适量
姜丝适量', e'菜心洗净，去除根部比较硬或老的地方，刮菜心根茎部分。
大蒜切成蒜末，准备好洋葱。
调制灵魂料汁：生抽5g、蚝油5g，加3g糖和100g清水半碗成一碗汁儿。
一锅500ml清水加5g盐和10g食用油烧开。
将菜心根茎在沸水中烫1分钟，直到根茎颜色变成深绿，再将整个菜心放到锅中烫熟1分钟，捞起来码入盘中。
开另一小锅将兑好的料汁倒入，小火烧开，放入一半的蒜末，一点点姜丝和小米辣碎，加入洋葱碎和大蒜，先在锅底倒油，五成热后倒入蒜末、洋葱，稍稍爆香后再加入料汁，加入小米辣煮开。
料汁稍微收汁，煮沸后稍等十来秒，直接浇在菜心上。', e'选择菜心要新鲜。
锅内烧清水要加油和盐。
如果加淀粉，汤汁儿煮沸后更容易挂在菜心上，味道会更重一些，广东人可能吃不惯。', './白灼菜心.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (293, 0, '素菜', '鲜', '轻松上手', '5', '西红柿炒鸡蛋', '西红柿炒蛋是中国家常几乎最常见的一道菜肴。它的原材料易于搜集，制作步骤也较为简单，所以非常适合新厨师上手，是很多人学习做菜时做的第一道菜。', e'西红柿 1 个（约 180g）
鸡蛋 1.5 个
食用油 4ml * 鸡蛋个数
盐 1.5 - 2g
糖 0 - 2g
葱花 0 - 10g
10ml 番茄酱（可选）
50ml 清水（可选）
1ml 醋（可选）', e'西红柿洗净，可选择去掉外表皮（开水烫表皮后放入冷水剥去外皮），去蒂，切成边长不超过 4cm 的小块，得到西红柿块。
将鸡蛋打入碗中，加入 1g * 份数的盐，搅匀，可考虑加入 1ml 醋，得到鸡蛋液。
热锅，加入食用油。
油热后，倒入鸡蛋液，翻炒至鸡蛋结为固体且颜色微微发黄，得到半熟鸡蛋，关火，将半熟鸡蛋盛盘，重新开火（不洗锅）。
加入西红柿块，锅铲拍打并翻炒 20 秒，或至西红柿软烂。
向锅中加入半熟鸡蛋，翻炒均匀，可考虑加入 10ml 番茄酱和 50ml 清水，增加汤汁，也可额外加入一些其它熟肉和材料。
加入剩余的盐、糖（可选，如果倾向于甜味版本）、葱花（可选），翻炒均匀。
关火，盛盘。', e'可根据个人口味选择是否加番茄酱、清水、醋等。制作过程中注意火候，避免鸡蛋炒糊。对于使用剩余的食用油，可以考虑重新收集到油壶。
快速做法：直接在有半熟鸡蛋的锅中加入西红柿块，与鸡蛋一起翻炒直至西红柿软烂，继续后续步骤。也可将加入盐改为加入两滴生抽尝试不同口味。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (294, 0, '饮料', '甜', '轻松上手', '20', '奶茶', '奶茶是一种简单易做的饮料，一般初学者30分钟即可完成。', e'袋泡红茶2包（约4g）
全脂奶粉或淡奶11 - 12g
砂糖5 - 7g
180 - 200mL沸水', e'取袋泡红茶2包放入杯中，加入180 - 200mL沸水。
等待20 - 30分钟。
称取11 - 12g奶粉和5 - 7g砂糖，分别加入前一步骤得到的液体中。
搅拌均匀即可饮用。', e'加入沸水后，尽量保持杯子内部温暖，例如使用开口较小的杯子或盖上盖子。如果气温较低时，使用量杯量取可能导致沸水在冲入红茶前冷却，则可以不使用量杯量取而直接估计其体积。
等待时间结束后可提起或搅动茶包以使冲泡更加均匀。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (295, 0, '饮料', e'甜
醇厚', '轻松上手', '0', '长岛冰茶', '长岛冰茶不含茶却有着冰茶的口感，是一种有着较高酒精度（约15%），但口感柔和易于接受的鸡尾酒。', e'金酒15ml
龙舌兰酒15ml
伏特加15ml
白朗姆酒15ml
橙味甜酒15ml
柠檬汁30ml
枫糖浆20ml
可乐75ml
柠檬1个
冰块100克', e'柠檬对半切，挤出30ml柠檬汁至杯中。
依次向杯中加入15ml金酒，15ml龙舌兰酒，15ml伏特加，15ml白朗姆酒，15ml橙味甜酒。
向杯中缓慢倒入20ml枫糖浆，边倒边搅拌。
向杯中加入75ml可乐。
向杯中加入冰块直至满杯。
轻轻搅拌20秒。
开始享用。', e'注意各种酒的用量要准确。
搅拌时动作要轻缓，避免酒液溢出。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (296, 0, '水产', '鲜香', '得心应手', '10', '咖喱炒蟹', '咖喱炒蟹是一道色香味俱全的特色名菜，第一次吃咖喱炒蟹是在泰国的建兴酒家中餐厅，爆肉的螃蟹挂满有蟹黄味道的咖喱，味道十分美妙，喜欢吃海鲜的人绝对不能错过。操作简单，对沿海地区的人比较友好。', e'青蟹（肉蟹）1只（约300g）
咖喱块15g（一小块）
洋葱200g
椰浆100ml
鸡蛋1个
生粉适量
大蒜5瓣', e'肉蟹掀盖后对半砍开，蟹钳用刀背轻轻拍裂，切口和蟹钳蘸一下生粉，不要太多。撒5g生粉到蟹盖中，盖住蟹黄，备用；
洋葱切成洋葱碎，备用；
大蒜切碎，备用；
烧一壶开水，备用；
起锅烧油，倒入约20ml食用油，等待10秒让油温升高；
将螃蟹切口朝下，轻轻放入锅中，煎20秒，然后翻面，每面煎10秒。煎完将螃蟹取出备用；
将螃蟹盖放入锅中，使用勺子舀起锅中热油泼到蟹盖中，煎封住蟹盖中的蟹黄，煎20秒后取出备用；
不用刷锅，再倒入10ml食用油，大火让油温升高至轻微冒烟，将大蒜末，洋葱碎倒入，炒10秒钟；
将咖喱块放入锅中炒化（10秒），放入煎好的螃蟹，翻炒均匀；
倒入开水300ml，焖煮3分钟；
焖煮完后，倒入椰浆和蛋清，关火，关火后不断翻炒，一直到酱汁变浓稠；
出锅。', e'注意煎螃蟹时的火候和时间，避免煎糊；焖煮时注意观察水量，避免烧干；炒酱汁时要不断翻炒，防止粘锅。
对于参考的视频链接，若失效可通过搜索引擎查找类似教学视频。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (297, 0, '饮料', '甜', '轻松上手', '10', '可乐桶', '一种将威士忌与可口可乐搭配制作而成的饮品，因冰块和可乐的口感能掩盖威士忌酒味，受到很多人喜爱，但不善酒力者易在不知不觉中过量饮酒，制作时需保证个人与饮酒者安全。', e'波旁威士忌100毫升
可口可乐500毫升
柠檬1个
冰块300克', e'柠檬处理：将柠檬对半切（刀方向垂直于柠檬的头尾连线），从其中一半切取一片柠檬备用，再次将柠檬对半切，用压汁器压出柠檬汁置于容器中备用，把挤压过的柠檬置于容器中备用。
正式调配：选择一个容量约1升的大型玻璃杯或铁皮酒桶，将冰块和挤压过的柠檬放入杯中（可按个人喜好设计摆放），倒入15毫升柠檬汁（喜酸可多加或全加），沿杯壁缓慢倒入可口可乐至距离杯口3/4处（控制可乐和威士忌比例约在5:1），倒入威士忌直至满杯。', '可乐桶因口感易让人不知不觉过量饮酒，制作和饮用时要保证个人与饮酒者安全。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (298, 0, '荤菜', '辛辣', '轻松上手', '20', '黄焖鸡', '黄焖鸡是一道十分下饭的美食，食材平平无奇又十分容易烹制，一学就会。', e'鸡腿两只
香菇5朵
青椒两个
生姜片两片
干辣椒5-6个
盐10g
料酒10ml
白胡椒粉5g
白糖5g
酱油5ml
味精适量', e'鸡腿洗净，剁成4cm大小的块。
生姜切片、干辣椒切成小圈。
香菇切片，青椒切成细长的马蹄状。
炒糖色：锅里倒入底油，冷油时放入白糖。
小火慢慢加热，待油温逐渐升高，白糖开始融化并变成较深的棕色（期间要不断搅拌，防止糊锅）。
迅速倒入鸡块，转大火，快速翻炒！烹入料酒，继续翻炒片刻。
将生姜片和干辣椒倒入。
放入酱油，炒匀。
倒入清水，以能淹住鸡肉为准。
倒入香菇片，白胡椒粉，盐。
翻炒均匀后，盖上锅盖焖煮，转中小火15 - 20分钟，有条件可以转至砂锅。
待鸡肉软烂，汤汁浓稠后（汤汁不要收的太干），最后放入青椒。
放入味精，兜炒均匀后，关火！青椒基本断生即可，不要炒时间久了。', e'炒糖色时要小火并不断搅拌，防止糊锅。
焖煮时注意火候和时间，避免鸡肉煮干或不熟。
青椒不要炒太久，断生即可保持口感。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (299, 0, '水产', e'鲜
辛辣', '得心应手', '25', '鳊鱼炖豆腐', '鳊鱼炖豆腐是一道融合了鳊鱼的鲜嫩与豆腐的醇厚的美味佳肴。鳊鱼经煎制后香气四溢，再与豆腐一同炖煮，吸收了鱼的鲜味，变得更加入味。调料的运用巧妙地提升了整体风味，干辣椒的点缀带来微微的辛辣，增添了别样的刺激。', e'鳊鱼550克
老豆腐400克
姜5片
葱半根（50克）
蒜4个
老抽2ml
桂皮1块
冰糖5块
干辣椒4 - 6个
料酒5ml
生抽4ml
盐5 - 8克
八角1个
香叶1 - 3片
食用油10ml
热水400克', e'鳊鱼改刀，放上姜片和料酒腌制5 - 10分钟。
老豆腐切块后放入水中备用。
锅中加油，放点盐，把腌制的鱼用厨房纸擦干水分，放入锅中两面煎。
两面煎好后，把鱼推向锅边，放入葱姜蒜、干辣椒、香叶、八角炒出味道。
炒出佐料香味后，加入料酒、生抽、老抽、冰糖、桂皮，倒入热水，水量和鱼平齐或者少点。
大火烧开后，放入老豆腐，豆腐贴在锅边，加入食盐，转小火。
小火烧10 - 15分钟，然后大火收点汁，出锅，出锅时加入切碎的大蒜。', e'煎鱼时全程中小火，鱼的两面各煎2 - 4分钟即可。
煎鱼时可在锅中放盐防止粘锅。
不太喜欢重口的可以不放老抽。
干辣椒和盐的用量可根据个人口味调整。
最后出锅时加入切碎的大蒜，味道会更好。', './鳊鱼炖豆腐.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (300, 0, '早餐', '', '小试牛刀', '18', '苏格兰蛋', '苏格兰蛋是一种用新鲜肉糜裹住鸡蛋，放入油中炸至金黄制成，这个版本比较费事，所以在此就给大家带来简易版,简易版苏格兰蛋是利用手抓饼皮包裹住芝士培根糖心蛋放入油中炸至金黄制成，大约耗时20-30分钟。', e'鸡蛋50g（约1颗）
手抓饼1份-2份（看鸡蛋大小）
芝士片1-2片
培根片1-2片', e'用冷水下锅水开3分钟后捞出
鸡蛋捞出，放入冰水中剥壳更快速也更完整
用芝士片包裹鸡蛋
培根片包裹鸡蛋
手抓饼两端切除以矩形包裹鸡蛋
油温6成下锅（油面波动，有青烟，筷子插入油中周围泛起气泡即是6成温度） 炸制金黄即可
空气炸锅160度15分钟
切开即可食用', '芝士片、培根片、手抓饼直接淘宝购买即可', e'./egg1.png
./egg2.png
./egg3.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (301, 0, '荤菜', '鲜', '大展身手', '55', '羊排焖面', '羊排焖面是一道硬菜，适合聚会时候大展身手。缺点就是有点花时间，优点就是好吃，而且一道菜补齐人体所需的三大营养物质。', e'带皮羊排肉500g
青椒2个
甜椒2个
大葱适量
花椒适量
干辣椒适量
生姜4片
白砂糖适量
老抽适量
中筋面粉300g
盐3g
水180ml', e'羊肉冷水下锅焯水，水开后撇掉血沫，捞出羊肉。
切好生姜，将干辣椒与花椒放入碗里备用。
在炒锅加入较多油，油热后放入白砂糖，给羊肉炒出焦糖色。
羊肉水份炒干后，放入盐、老抽，以及备好的调味料。
加入清水没过羊肉，大火煮沸后继续煮10分钟，之后小火炖煮30分钟。
期间进行和面：先把中筋面粉、盐、水混合均匀，加水边和边搅拌，把面团和到光滑，醒面10分钟，再次和面到光滑，醒面5分钟，把面团揉成条，切成6到8个小剂子，抹上油，等待5分钟，把面团剂子擀成面皮。
放入青椒，甜椒，大葱，以及面皮进行翻炒。
翻炒均匀之后，即可出锅。', e'如果用超市的面条代替，尽量选择宽面。
对于使用剩余的食用油，可以考虑重新收集到油壶。', './羊排焖面.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (302, 0, '主食', e'咸
辛辣', '得心应手', '10', '炒馍', '炒馍是一道利用隔天略硬的馒头制作的美食，通过搭配各种调料和可选的鸡蛋，经过翻炒等步骤而成。制作过程中需注意火候控制，以防炒糊，调味料可依个人喜好调整，还可添加其他辅料增添风味。', e'馒头2个
盐3g
油20ml
孜然粉3g
辣椒粉3g
五香粉3g
小葱2棵
鸡蛋（可选）2个', e'将馒头切成小块或小片。
若选用鸡蛋，将其打进碗里打散，可加盐和五香粉各1g或不加，待炒时加入。
把鸡蛋浇在馒头上，搅拌均匀，注意鸡蛋量不宜过多。
大火热锅，倒入食用油（若用不锈钢锅怕伤锅，可先倒油烧至油热）。
放入馍丁进行翻炒，使其均匀受热。
将火调小，持续翻炒至馍丁呈金黄色。
放入盐、胡椒粉、五香粉。
最后放入葱花一起翻炒几下。
关火出锅。', e'炒的过程中要密切关注火候，防止炒糊。若不小心炒糊，可将火调小，沿锅边加油润锅或洒水，注意分散添加，避免集中在一处。
调味料可根据个人口味放入其他香料，如南德调味料等。
如果喜欢吃更脆的口感，可将火开到最小，多翻炒一会儿，关火后趁锅热再放置一会儿再倒出。
辅料可根据个人口味换成蒜末、蒜苗等，且可单独爆香后再混合。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (303, 0, '素菜', e'甜
酸', '轻松上手', '10', '糖拌西红柿', '新鲜可口，制作简便，营养价值高，适合夏季食用，家庭餐桌上的一道美味凉菜。西红柿含有大量的维生素C，做法简单几分钟就可完成。', e'西红柿2个
白砂糖20g', e'用刀将西红柿皮米字型划开
用筷子插入西红柿的菊花，在燃气上转动烤10秒（或用开水冲30秒），直到西红柿皮卷边
把西红柿的皮去掉
将西红柿沿纹路切成大块，去掉头部根蒂部，备用
全部切好后，将西红柿在盘子中均匀码一层
撒上白糖，重复上面一步直到全部西红柿放完
放入冰箱冷藏10分钟', '在制作过程中，请小心使用刀具。', './火山飘雪.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (304, 0, '荤菜', e'咸
酸
甜', '小试牛刀', '12', '凉拌鸡丝', '凉拌鸡丝是一道快手且少油低卡的菜肴，制作简单，适合隔离期间制作。', e'鸡胸肉200克
麻油5毫升
生抽4毫升
香醋4毫升
白糖3克
盐2克
料酒20毫升
姜20克
凉白开水', '姜切片备用；锅中倒入4升水，加入鸡胸肉、姜片，倒入20毫升料酒，开大火不盖盖将水烧开；水开后转中火，用勺子将浮沫捞出；继续煮5 - 7分钟（非冷冻肉煮5分钟，冷冻肉煮7分钟），用筷子插入鸡胸肉，能轻松插入代表鸡肉熟了，不熟则延长煮制时间；用凉白开水冲泡鸡胸肉，使其降至室温，顺着鸡胸肉纹理将鸡胸肉撕成细丝；准备一个碗，碗中加入准备好的麻油、生抽、香醋、白糖、盐，搅拌料汁使糖和盐尽量溶化，将料汁倒入鸡丝中搅拌均匀。', '这道菜是隔离期间用现有材料做的，有条件可以加入香菜、小葱等进行调味，喜欢吃辣的可以加入辣椒油。', e'./凉拌鸡丝成品.jpg
./凉拌鸡丝焯水.jpg
./凉拌鸡丝_撕.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (305, 0, '荤菜', '鲜香', '大展身手', '33', '红烧猪蹄', '红烧猪蹄营养丰富，味道香，汤汁浓郁、下饭强。', e'猪蹄2 - 3根
香叶2片
姜5片
葱半根
老抽20ml
桂皮1块
冰糖7 - 8粒
料酒30ml
生抽20ml
盐8克
八角4个
食用油30ml', e'冷水锅中放入剁好的猪蹄，加入20ml料酒与葱姜，煮15分钟去掉血腥。
热锅冷油，倒入30ml食用油，放入7 - 8粒冰糖，开小火，熬成糖色，期间用锅铲把冰糖压碎，大概熬2分钟。
熬成糖色后，放入焯过水的猪蹄，继续小火，翻炒猪蹄，直至所有猪蹄两面微黄。
加入香叶2片、桂皮1块、八角4个、生抽20ml、老抽20ml、料酒10ml、姜3片、盐8克，转中火、继续翻炒1分钟。
加入开水或者冷水，水需要没过猪蹄，盖上锅盖，大火烧开，烧开之后关火。
把锅内的食材全部倒入高压锅中，高压15分钟（没有高压锅可放在锅中大火转小火熬制）。
15分钟之后，把高压锅的食材倒入炒锅中，开大火收汁，可用筷子尝下味道、淡的话可以加2 - 3g盐。
大火收汁时长根据锅中的水来算，一般30秒即可。', e'没有高压锅的话，炖煮时间会变长，需注意观察。
收汁时要注意火候和时间，避免烧糊。
尝味道时用筷子比直接用手更卫生。', './红烧猪蹄.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (306, 0, '早餐', '鲜', '轻松上手', '15', '鸡蛋三明治', '这是一款只需10分钟就能制作完成的简易鸡蛋三明治。准备好鸡蛋、吐司、培根等食材，经过简单的处理和组装，就能得到美味的三明治。还可根据个人口味加入芝士、酸黄瓜等食材增添风味。', e'鸡蛋1个
吐司2片
培根2片
黄油10g
蛋黄酱20g
盐1g
黑胡椒2g', e'将吐司切去四边，备用。
把鸡蛋煮熟并捣碎。
将鸡蛋、蛋黄酱、盐、黑胡椒混合。
在锅中加入黄油，煎熟培根。
组装吐司，在两片吐司间加入制作好的鸡蛋酱及培根。
把四边形吐司切成三角形装盘。', e'制作过程中注意控制火候，避免煎培根时煎糊。
加入芝士的话，可在煎培根时一起稍微加热融化，让芝士更好地融入三明治。
酸黄瓜可切成小块后均匀撒在鸡蛋酱中，增加口感的丰富度。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (307, 0, '主食', '', '轻松上手', '40', '电饭煲蒸米饭', '详细介绍了用电饭煲蒸米饭的方法，包括必备原料、计算米水量的指尖量水法、具体操作步骤以及技术总结等内容', e'江南米或北方大米
水', e'清洗米
将米和水按指尖量水法加入电饭煲中
连接电饭煲电源，进入加热模式，等待大约30分钟
待电饭煲自动进入保温模式后
将米在电饭煲中闷10 - 15分钟
盛出米', '不论什么容器，水的量都可用“指尖量水法”确定；水的多少严重影响米饭口感；不同地区一般食用不同品种大米，江南米细长，北方大米短且圆；不同品种米水量不同会极度影响口感；更多信息可参考电饭煲说明书', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (308, 0, '荤菜', '鲜', '得心应手', '17', '冬瓜酿肉', '这道菜荤素搭配，口感鲜嫩爽滑，做法简单。', e'冬瓜200g
猪肉末300g
鸡蛋1个
葱1根（约20g）
葱姜末（姜3 - 4片约30g，取一根葱花中的葱白部分）
胡椒粉5g
生抽10ml
淀粉5g
水淀粉25g（淀粉25g，水50ml）
盐20g', e'冬瓜去皮，切成25cm长3cm厚的片。
将切好的冬瓜放入碗中，放入15g盐，将冬瓜抹匀，放置10分钟。
放置冬瓜的同时，换个碗放入肉末，葱姜末，5g盐，淀粉5g，胡椒粉，生抽，胡椒粉。
使用筷子在肉末中进行顺时针搅拌，搅拌到食材颜色没有明显对比（约2分钟）。
将腌制好的冬瓜（会变软）使用清水洗三遍。
拿出1片冬瓜片卷起来，并把肉塞进去。
放入碟子中摆到碟子的边缘。
打入1个鸡蛋到中间圆圈处。
放入普通铁锅中水烧开后，蒸15分钟，盖上锅盖。
开盖，取出蒸好的冬瓜酿肉。
将冬瓜酿肉碟子的水倒入锅中，放入水淀粉，加入50ml清水倒入锅中烧开。
淋到冬瓜酿肉上。', e'操作时，拿出冬瓜酿肉时注意碟子很烫，小心操作。
不习惯鸡蛋的人可省略放鸡蛋这一步骤，因为可能会有点腥。', e'./冬瓜酿肉成品.jpg
./冬瓜形状.jpg
./腌制好的冬瓜.jpg
./卷肉.jpg
./摆盘.jpg
./打鸡蛋.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (309, 0, '素菜', e'辛辣
鲜香', '得心应手', '8', '榄菜肉末四季豆', '这道菜将四季豆的鲜嫩与五花肉的醇厚、橄榄菜的独特风味相结合，加入小米辣增添辣味，口感丰富，味道鲜香。', e'四季豆220g
五花肉100g
橄榄菜20g
大蒜10g
小米辣10g
酱油2ml
盐2g
鸡精1g
胡椒粉1g
糖0.5g
油20ml（滑锅用）
油10ml', e'将四季豆洗净，撕去筋，切成大小均匀的颗粒备用。
将大蒜拍碎剁成蒜末备用。
将小米辣切成大小均匀的颗粒备用。
将五花肉去皮，剁成肉末备用。
将锅烧热，加入20ml油滑锅，滑好后倒出热油，加入10ml冷油；若没有晾油瓶，也可直接放油，小火煸炒肉末两分钟炒出猪油。
肉末炒香后加入蒜末、橄榄菜和小米辣，炒出香味。
加入四季豆开中火煸炒，至少炒5分钟，确保四季豆熟透。
四季豆炒熟后，从锅边淋入2ml酱油，加入2g盐、1g鸡精、1g胡椒粉和0.5g糖。
将调料翻炒均匀，出锅装盘。', '一定要确保四季豆熟透，防止食物中毒。滑锅可防止肉末粘锅，没有晾油瓶也可不滑锅。', './榄菜肉末四季豆.JPG', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (310, 0, '早餐', '', '轻松上手', '15', '蒸花卷', '蒸花卷是一道简单易做的菜，能补充碳水化合物和膳食纤维，适合作为快手早餐。', e'冷冻花卷5个
水400ml
直径28cm圆碟子
直径20cm蒸架', e'从花卷的包装袋中取出5个花卷。
把花卷平铺在碟子上，尽量不用重叠。
往锅里倒入400ml水，把蒸架放里面，把装花卷的碟子放在蒸架上，盖上锅盖。
开大火加热，直至水沸腾。
转中火加热15分钟。
开盖用手感受花卷的表面温度，如果不够热，就继续盖上盖子加热，否则就可以关火出锅。
碟子取出放凉至50度即可食用。', '操作时，需要注意观察锅里的水不能少于50ml。', '', '5', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (311, 0, '荤菜', e'鲜
酸辣', '大展身手', '40', '老妈蹄花', '红烧猪蹄营养丰富，口感细腻，软烂脱骨，配上酸辣汁简直太香！', e'猪蹄3根
白芸豆200g
当归2g
白胡椒粉5g
姜片30g
蒜末8g
鸡精2g
生抽25g
葱花10g
葱
姜
料酒
生抽
白芷
当归（可选）
鸡精
盐
蒜
小米椒
白胡椒粉
生抽
香醋
花椒油
油泼辣子（可选）', e'200g白芸豆提前一晚清水浸泡备用
准备猪前蹄，买菜的时候让师傅从中间劈开，用喷火枪去除毛囊，拿回家清洗
冷水锅中加入猪蹄、大葱段、姜片、料酒，焯水十分钟，撇去浮沫，捞出洗干净备用
高压锅中放入猪蹄、当归、白芷、白胡椒粉、姜片，上汽后压三十分钟，放入白芸豆，再压十分钟
揭盖后加入盐、鸡精、葱花调味
调制灵魂汁子：放入葱、蒜、小米椒，白胡椒粉、生抽、香醋、油泼辣子、花椒油、猪蹄原汤', e'猪蹄尽量选择猪前蹄，肉多筋多骨头少
白芸豆没有可用海带代替
使用高压锅中途如需加水，只能加热水
制作灵魂汁子时可根据个人口味调整调料用量', e'./result3.jpg
./result1.jpg
./result2.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (312, 0, '汤与粥', '鲜', '得心应手', '5', '勾芡香菇汤', '鲜香菇除了拿来和肉炒外，其实拿来做浓浓的勾芡汤也是非常可口的。', e'鲜香菇2朵
香葱0.5根
食用油10ml
食用盐3g
鸡精3g
生粉10g
开水350ml', e'香菇切片（每片厚度0.5 - 1cm），放入大碗中，倒入2g食用盐浸泡15分钟。
生粉倒入小碗中，加入50ml水，搅拌生粉直至融化没有颗粒（即水淀粉）。
倒掉碗中的盐水，适当去掉香菇本身的水分（方便下一步煎炸）【可选】。
小火，倒入油，待油开始冒小泡（小火30s，看每个锅的功率），倒入香菇，每面煎10s【可选】。
倒入开水300ml，调中火再煮3 - 5分钟。
倒入水淀粉，适当搅拌锅中汤汁后，加入3g盐、3g鸡精，最后撒上葱花出锅。', '可根据个人对香菇嚼劲的喜好调整切片厚度。对于浸泡香菇的盐水倒掉后，去掉香菇多余水分这一步骤可根据实际情况选择是否操作。煎香菇的步骤也可根据个人喜好选择是否进行。', e'./1.jpeg
./2.jpeg
./3.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (313, 0, '素菜', '鲜', '小试牛刀', '3', '鸡蛋火腿炒黄瓜', '这道菜以黄瓜、鸡蛋、火腿为主要食材，简单炒制而成，味道鲜美。', e'黄瓜1根（约200g）
鸡蛋2个
火腿肠1根（约40g）
红尖椒1个（可选）
食用油10ml
生抽3ml
盐2g', e'黄瓜洗净，切半圆形片，备用
火腿切半圆形片，备用
红尖椒（可选）切碎，备用
将鸡蛋打入碗中，搅匀，即为 `鸡蛋液`
热锅里倒5ml食用油
油热后转小火，倒入打散的`鸡蛋液`，用筷子划散，翻炒至鸡蛋结为固体且颜色微微发黄，即为 `半熟鸡蛋`，盛出备用
不用洗锅，往锅内倒入5ml食用油，倒入黄瓜片大火翻炒1分钟
把 `半熟鸡蛋` 倒入锅中，调入2g盐、3ml生抽，立刻倒入火腿片和辣椒碎（可选）翻炒均匀
关火，盛盘', '火腿是咸的，要在调味后才加入，这样不会让火腿也沾上盐', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (314, 0, '主食', '鲜', '大展身手', '60', '手工水饺', '饺子是一道美味的主食，易于根据个人口味调味，适合在美国的同学解馋。', e'面粉200g
冷水150ml
芝麻香油2 - 3ml
瘦肉末250g
肥肉末20g（可不加）
姜3g
葱15g
盐3g
蚝油2ml
香油2ml
生抽2ml
鸡蛋1个
韭菜适量
黑醋10ml（可选）
姜一小块50g（可选）
香油2滴（可选）
大蒜/蒜泥3瓣/人（可选）', e'制作饺子皮：盆中加入面粉和芝麻香油，在面粉中央挖小洞，分4 - 5次加入水搅和，出现碎末状干燥面团时停止加水，压实面团，醒发约45分钟。醒发后搓条、擀条、切块、搓球、压扁，撒面粉，用擀面杖擀平。
拌馅：猪肉去皮切块剁成肉末，葱姜切末放入肉碗搅拌均匀，韭菜洗净切短，与肉沫混合，加入蚝油、生抽、香油、蛋清搅拌均匀，放置30分钟。
包饺子：左手上放面皮，右手用筷子夹馅，沿饺子皮圆周合拢捏实。
煮饺子：烧水至3/4锅高度，大火烧开后放入饺子，调至中火，第一次水冒泡后锅边加50ml冷水（重复两次），第三次水开后加50ml冷水，水开后调小火等60s出锅。', e'煮水饺不盖锅盖，加三次水防止饺子表皮破损。制作过程中，案板、擀面杖和手都要撒面粉防粘。可根据个人口味搭配黑醋、姜丝、香油、蒜泥等作为蘸料，但食用大蒜后需注意清洁口腔。
对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (315, 0, '素菜', '鲜香', '小试牛刀', '18', '烤茄子', '这道菜做法简单方便，味道香极了，成品和烧烤摊的烤茄子差不多。', e'茄子1个（约200g）
食用油20 - 30毫升
酱油4 - 6克
小米椒1个（约20g）
蒜蓉3 - 4瓣
孜然1 - 3克
食用盐0.5 - 2克', e'将酱油、孜然、食用盐、蒜蓉和切碎的小米椒置于碗中，均匀搅拌备用。
茄子洗净，用纸巾擦干表面的水分。
用叉子在茄子的一侧扎4 - 8下。
使用15 - 25ml的食用油涂满茄子表面。
将烤箱温度设置为200℃（打开烤箱风扇 大火），预热2分钟。
将茄子放入烤箱中层或者上层，烤制12 - 15分钟（茄子表面有褶皱，且能按压0.3 - 0.5cm的深度即可）。
取出茄子，用刀茄子上竖着划一个口子。口子居中，上下距1 - 1.5cm。
用小刀或者叉子伸入口子，竖着切割茄子内部。
将口子微微掰开，倒入第一步准备的酱料。
再次将茄子放入烤箱，将烤箱温度设置为200℃，烤制4 - 7分钟。
取出，关闭烤箱电源。', e'茄子表面有水分、未涂满食用油或未使用叉子扎孔可能导致茄子在烤制的过程中爆裂。
第一次用刀划口子的时候，可以直接将茄子竖直切成两半，然后切割出纹路后涂抹上酱料。', './烤茄子.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (316, 0, '荤菜', e'甜
酸', '大展身手', '6', '醉排骨', '醉排骨是福建省福州市特色传统名菜', e'排骨 200g
白砂糖 10g
食用油 500ml
鱼露 5ml
芝麻 5g
番茄酱 5g
香醋 5ml
蒜头 2 粒
葱 1 根
地瓜粉 30g
鸡蛋黄 1 个', e'排骨中加入 5g 地瓜粉和水进行搅拌，清洗 2 - 3 遍后放入大碗备用。
排骨中加入鱼露、地瓜粉、鸡蛋黄充分搅拌。
将排骨一个一个放入锅中（切记不可以整碗倒入），保证每个不要粘在一起。
全部放入后，每 30S 用勺子来回两面翻转瘦肉块，直至排骨表面金黄。
取出排骨，一分钟后倒入油锅中继续炸，直至瘦肉块表面出现焦黄后，取出放入大碗备用。
准备一个小碗，加入蒜末、香醋、白砂糖、鱼露、番茄酱、葱花、芝麻搅拌均匀，倒入 5ml 热油。
将汤汁浇灌入排骨，在充分搅拌后倒入盘中。', '鱼露，又称鱼酱油，是一种广东，福建等地常见的调味品，效果类似于生抽。本次制作过程中，由于疫情原因没有鱼露，只能用老抽代替，所以排骨颜色偏黑，正常是金黄色。', './1.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (317, 0, '水产', '辛辣', '大展身手', '15', '小龙虾的做法', '在家里做的小龙虾，肉质细嫩，鲜嫩多汁，干净卫生。', e'小龙虾2斤
油70毫升
香叶两片
八角一个
桂皮3克
青花椒10克
花椒10克
子弹头辣椒5克
葱一根大葱
姜30克
蒜7瓣大蒜
郫县豆瓣30克
黄豆酱30克
啤酒500毫升
生抽30毫升
盐10克', e'小龙虾刷干净去虾线，葱切2cm葱段，姜蒜切末。
烧油，油微热, 下香叶、八角、桂皮、青花椒、花椒、子弹头辣椒。
香料出香气之后下锅葱姜蒜
葱姜蒜爆香后，加入郫县豆瓣、黄豆酱，炒出红油。
下小龙虾，翻炒至变色。
加入啤酒，等啤酒烧开后加入生抽，盐。
将小龙虾完全煮熟后出锅。', e'饭店应该都是油炸一遍，家庭油炸的话，太浪费了，所以在这个菜谱里用油比炒菜油多一些煎一下，实测同样好吃。
去虾线后的虾肉比不去虾线的虾肉口感差一些，并且小龙虾去虾线对新手是一个挑战，能接受虾线的情况下不去虾线也可以。', './成品.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (318, 0, '素菜', e'咸
鲜
甜
酸', '轻松上手', '5', '凉拌油麦菜', '凉拌油麦菜是一道清爽可口的凉拌菜，制作简单，味道鲜美。', e'油麦菜1颗（约200g）
芝麻酱10ml*份数
酱油5ml*份数
醋15ml*份数
蚝油10ml*份数
白糖5g*份数
香油5ml*份数
蒜2头*份数', e'蒜拍碎切末。
将醋、酱油、芝麻酱、香油、糖、蚝油、蒜末放到碗里搅拌均匀。
油麦菜切段，每段不超过4cm。
把油麦菜放入一个大点的盆里，倒入上述碗中酱料，充分搅拌均匀。', e'芝麻酱可以用花生酱代替。
芝麻酱一定要和油麦菜混合均匀才更好吃。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (319, 0, '素菜', '鲜', '轻松上手', '4', '微波炉鸡蛋羹', '微波炉鸡蛋羹是一个简单易制作的菜，非常适合夜间突然饿了的时候充当夜宵，快捷简单。', e'鸡蛋 2 个 * 份数
水 200ml * 份数
虾皮 10 个 * 份数（可选）
葱 5g *份数（可选）
盐 3g * 份数
酱油（可选）
芝麻油（香油） 1ml（可选）', e'将鸡蛋打入可使用微波炉加热的陶瓷碗中，使用筷子将其打散。
加入水和盐，搅拌均匀。
将虾皮放入碗中，搅拌均匀，保证所有虾皮不会堆积在一起。
葱切碎至边长 0.6±3mm 状，放入碗中搅拌均匀。
将此碗及内容物放入微波炉中，容器表面覆盖保鲜膜或以可微波瓷盘加盖（注意：不得密封，必须留有涨缩量）加热 2 分钟(500W)。
小心地取下保鲜膜或其他覆盖物，然后继续加热 2 分钟。
若微波炉不带旋转式加热盘，将碗缓慢的水平旋转 180 度，以确保内容物加热均匀。
放入芝麻油。
小心地从微波炉中拿出碗（真的很烫）。
如果选择放入酱油，则确保酱油在鸡蛋羹表面流动后能以最薄的形式沾满鸡蛋羹表面即可。', e'鸡蛋 1 个约为 50±5g。若使用其他品种蛋品可按比例增减水量。
一定要确保将鸡蛋打散，否则可能会发生轻度鸡蛋爆炸。
鸡蛋和水不能超过碗容量的 2/3，否则可能发生溢出。', './微波炉鸡蛋羹.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (320, 0, '素菜', '鲜', '得心应手', '78', '包菜炒鸡蛋粉丝', '包菜炒鸡蛋粉丝是中国一道日常生活中常见的菜品', e'包菜半颗
鸡蛋2个
粉丝1把
胡萝卜半根
菜籽油20ml
盐2g
生抽15ml
老抽10ml
蚝油10ml
葱半根
蒜瓣2片
干辣椒5根', e'胡萝卜、包菜切丝备用
粉丝先用冷水浸泡1小时，然后将粉丝放入锅中，加入开水烧至粉丝烫软捞出备用
鸡蛋打入碗中，加入盐后搅拌15秒
葱、蒜、辣椒切成小粒备用
起锅烧油，倒入鸡蛋，打散炒熟盛出
再倒入油，放入葱、蒜、干辣椒翻炒8秒
下胡萝卜、包菜丝儿翻炒30秒
放入粉丝
放调料，生抽15ml，老抽10ml，蚝油10ml，盐2克
放入之前炒好的鸡蛋，翻炒约15秒
出锅摆盘', e'对于使用剩余的食用油，可以考虑重新收集到油壶。
遵循本指南制作流程若发现问题或可改进的流程，请提出Issue或Pull request。', './1.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (321, 0, '主食', '鲜香', '大展身手', '32', '河南蒸面条', '河南蒸面条是一道在河南坊间流行的小吃，先将挂面裹油放入蒸笼蒸熟，再加蔬菜配以调料炒，最后二次蒸制，以达到入味劲道的效果。', e'挂面300g
五花肉350g
蒜薹150g
食用油10 - 15ml
生抽15ml
老抽10ml
蚝油5ml
盐2g
鸡精2g
十三香1g
葱10g
姜5g
蒜10g
料酒5ml
麻油5ml', e'第一次蒸：起锅加7成水，水开，上蒸篦子；将挂面均匀铺开放置，淋5ml油并抹匀，蒸15分钟；将挂面和蒸篦子取出，放置一边，并倒掉锅中的水。
切菜：五花肉切成2mm厚度的肉片；蒜薹切成3cm段；葱切成0.2cm薄片；姜切成1mm x 1mm x 3cm的细丝；蒜放在砧板上拍碎，切成1mm的粒度。
炒制：起锅，烧干水分，加3ml食用油；手持锅柄，摇晃锅，使食用油充分挂满锅的2/3；中火，加入肉片，翻炒1分钟；加入葱姜蒜，料酒，继续翻炒1分钟；将蒜薹段放入锅中，翻炒1分钟；开始调味，加入老抽、生抽、蚝油、盐、鸡精、十三香，翻炒1分钟；加入500ML水，没过蔬菜，炖煮1分钟；将蒸好的挂面放入，不断搅拌3分钟，待挂面全部均匀上色，关火；将搅拌好的挂面和菜，全部倒入额外的盆中。
第二次蒸：起锅，加冷水7成，放上蒸篦子，将拌好的面条和菜，均匀的铺在上面；水开后，大火烧15分钟，出锅；淋上10g的麻油，即可食用。', e'挂面的粗细与口感：细的、圆的（超市大部分都是这种，口感更加劲道）；宽的、扁的（口感比较软）。
下面的量是仅仅够一个人一餐的主食的量！请针对实际调整用料的量！', './河南蒸面条.png', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (322, 0, '汤与粥', '鲜', '轻松上手', '25', '小米粥', '小米含有多种维生素、氨基酸、脂肪和碳水化合物，营养价值较高。每100克小米含蛋白质9.7克、脂肪3.5克，都不低于稻、麦。一般粮食中不含有的胡萝卜素，小米每100克含量0.12毫克，维生素B1的含量位居所有粮食之首。小米含糖也很高，每100克含糖72.8克，产热量比大米高许多。另外，小米也富含维生素B1、B2等。', e'小米100克
水2000克（山泉水最佳）', e'将100克小米放入碗中，用水轻淘一遍（用手搅拌一下，将水倒掉，只是去掉外面的浮灰，不可搓洗）。
水烧开，务必烧开。
水烧开沸腾时，将小米倒入锅内。
搅拌使得小米不会粘连锅底，继续用大火熬6 - 10分钟，注意中间穿插搅拌几次。
改中火、文火熬15 - 20分钟，锅盖要错开一条缝，中间继续搅拌几次，不要糊锅底。', e'这是普通锅熬制（只需30 - 35分钟即可出锅），味道最佳。高压锅和电饭锅省事，不过效果下降，水量要适当减少，一般100克小米 + 1800克水。
小米只需用水去除浮灰，千万不可过分淘，会损失掉小米油的。
千万记住小米需要在水开的时候下锅。
不喜欢放碱，更喜欢原汁原味的小米香。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (323, 0, '素菜', '鲜', '小试牛刀', '3', '莴笋叶煎饼', '莴笋叶煎饼营养丰富且美味，是一道特色美食。', e'莴笋叶50g
鸡蛋2个
食用油30ml
生抽5ml
淀粉15g
鸡精2g', e'将莴笋叶剁碎，加入鸡蛋、生粉、生抽、鸡精搅拌均匀备用。
起锅烧油，倒入莴笋叶浆汁，均匀平铺在锅面上。
第一面炸120S后，翻面再炸60S后出锅。', '选择莴笋叶时可考虑当地蔬菜包中常见的莴笋，也可换成韭菜等。莴笋叶直接焯水凉拌有苦味，做成煎饼可改善口感。', e'./1.jpeg
./2.jpeg
./3.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (324, 0, '荤菜', '辛辣', '大展身手', '25', '血浆鸭', '血浆鸭是湖南武冈特色传统名菜，香、脆可口，由于醋血的作用，不仅鸭骨酥而脆，就是姜和辣椒也变得不辣而甜净。', e'鲜仔鸭肉2000g
鲜鸭血250ml
姜6片（根据个人吃辣喜好程度可多放1 - 3片姜）
蒜仔6瓣
香葱2根
辣椒1000g（根据个人吃辣喜好程度可选青椒，线椒，美人椒等，喜欢吃辣可增加5 - 8个小米辣或朝天椒）
高度白酒50ml + 水150ml（或啤酒200ml或米酒200ml）
生抽10ml
料酒30ml
盐8g
鸡精5g', e'鲜仔鸭肉切成约3cm小块，加料酒、姜片，去除血水。
炒锅烧热，放入约100ml食用油，大火待油烧开，放入腌制好的鲜鸭肉，不断翻炒。
待鸭肉完全变色（肉眼可见泛白），放入酒，再加入200ml开水，刚好淹没鸭肉即可，盖上锅盖中火煮15分钟。
水开之后，打开锅盖放入姜蒜，翻炒一遍，盖上锅盖持续加热10分钟。
打开锅盖放入辣椒，不断翻炒，待至肉眼可见辣椒炒软，放入鲜鸭血，此时需要不断翻炒，确保每块鸭肉和每片辣椒都有鸭血的浸润。
翻炒至肉眼可见鸭血均为黑色，加入盐，鸡精，香葱，（喜欢食用山胡椒油的朋友也可以在此时放入3 - 6滴山胡椒油）再次翻炒一到二次即可。
出锅盛盘，上桌食用。', e'操作时，需要注意观察水位线，调整炉火大小，以防水烧干粘锅。
放入鲜鸭血时，需要不断翻炒搅拌，防止鸭血抱团凝固成块。', e'./血浆鸭(特辣).jpg
./血浆鸭(微辣).jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (325, 0, '荤菜', '鲜香', '大展身手', '120', '猪肉烩酸菜', '猪肉烩酸菜是一道北方名菜，富含蛋白质，简单易做，具有酸菜的特殊风味。', e'猪五花肉或猪肉排骨1500克
东北酸菜1000克
大葱1根
姜100克（50克切段，50克切末）
蒜4瓣
盐10克
生抽酱油15克
五香粉10克
料酒20毫升
大料2颗', e'大葱切段；生姜50克切段，50克切末；大蒜切末，备用。
全部酸菜切丝，用水冲洗2 - 3遍备用（冲洗次数取决于个人口味，喜欢酸味，可以冲洗2遍。害怕酸味，可以冲洗3 - 4遍。不能不冲洗，否则会过酸）。
排骨和五花肉入锅，倒入冷水淹没。放入全部葱段，50克生姜段和料酒20毫升。大火煮开后，等待5分钟。关火，将排骨和五花肉捞出，冷水冲洗掉浮沫，备用。
煮好的五花肉切片或者切块，备用。
将之前的锅洗干净，并且擦干（不然加入油会崩出来）。
锅中加入油，开中火，放入姜蒜末爆香，放入五花肉和排骨。将五花肉和排骨煎至金黄，倒入10克五香粉和15克生抽酱油，用铲子翻动1 - 2分钟。
将冲洗好的酸菜丝加入锅中，翻炒3分钟。
倒入纯净水至刚好没过食材，加入2颗大料，转大火，直到锅中水沸腾。转中火，盖锅盖焖煮。
等待1.5 - 2小时，直至五花肉软烂 （可以用筷子轻松扎穿）。
掀开锅盖，开大火收汤，翻动锅中食材直至锅中剩余水分只覆盖锅底，转小火，准备调味。
调味：加入食用盐10克，搅拌均匀。
关火，出锅。', e'大火收汤时，注意不要糊锅，可以适当翻动来检查水位。
调味的技巧，最后加盐时，可以一点一点加入，搅拌后品尝味道，直到可以接受的口味。', '', '5', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (326, 0, '主食', '鲜', '大展身手', '10', '扬州炒饭', '扬州炒饭是蛋炒饭的升级版，制作时间较长，但制作步骤简单。', e'冷饭500g
鸡蛋2 - 3个
冷冻去皮基围虾10 - 15只
午餐肉罐头150g
青豆30g
胡萝卜30g
玉米粒30g
葱1根
油30 - 40ml
盐12 - 15g', e'胡萝卜切丁0.2cm*0.2cm*0.2cm，备用
午餐肉切丁0.2cm*0.2cm*0.2cm，备用
葱分别取葱白和葱绿，各切成0.25 - 0.5cm的小段，分开备用
在碗中打入鸡蛋液，均匀搅拌，备用
将胡萝卜，青豆，玉米粒煮熟捞出，备用（水别倒）
将虾煮熟，捞出备用（水可以倒了）
热锅热油，第二次倒油需使用20 - 30ml油，等到第二次凉油热了以后，缓慢倒入鸡蛋（控制碗到油直接的流注直径大约在0.5cm）不要搅拌
鸡蛋凝固后立刻捞出，备用
将午餐肉，青豆，胡萝卜，玉米粒，虾倒入锅中翻炒1 - 2分钟，装盘备用
水冲一下锅，将杂物冲干净，保证锅内干净（可以有油但是不能有杂质）
热锅热油(10ml)，将葱白放入爆香
调至小火，放入米饭，用铲子快速砸击米饭并翻炒，保证米饭均匀沾到油且粒粒分明
倒入鸡蛋，继续砸击，使鸡蛋碎开并与米饭充分混合
转大火，倒入其他所有备用配料，快速翻炒1 - 2分钟
撒入盐，并翻炒至充分混合
撒入葱绿，翻炒1分钟
关火，装盘', e'如做完后胳膊酸痛为正常现象，需加强上肢锻炼
超市有青豆，胡萝卜，玉米粒的混合冷冻包装，可以使用这个省去切丁的烦恼，推荐Pams Mixed Veges很便宜，或者类似的都可以用', './veg.png', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (327, 0, '荤菜', e'酸
辣', '大展身手', '30', '无骨鸡爪', '这是一道做法简单但消耗体力和耐力的无骨鸡爪，酸辣开胃，Q弹爽口。', e'鸡爪1kg
姜4片
料酒65g
大葱3段（5cm一段）
大蒜10瓣
小米辣4个少辣，6个中辣，12个大辣（推荐大辣）
洋葱 （半个）
生抽75g = 15g * 5
蚝油30g = 15g * 2
黑醋（推荐陈醋）50g
白糖10g
盐3g
花椒油10ml
香菜3颗
柠檬2颗（以1颗为单位来调整酸度）', e'用剪刀 / 刀把鸡爪上的指甲的部分全部剪掉，包括指甲下面的肉和骨头，让它一点指甲都不剩。
用水把他们洗干净，放一边。
把鸡爪放入大锅中，加入大葱、料酒、姜，加水没过鸡爪。
大火煮开，中途可以把浮末捞起来。
水开100度，沸腾后等10分钟。
关火，捞出来，把水沥干，洗干净，放入盆里。
放入冰箱冷冻层20分钟。
把全部放入不是冷冻层的冰箱，然后分批10个一批拿出来去骨。
从手指最前端开始，每只手指都要用刀划开划到它的手背部分。
再从手背部用刀分划开至整个手臂。
把每只手指关节处都掰一掰。
按着它的手指最前端，往里推，每只手指都一样，先推到中间手掌手背部分。
每只手指皮脱离后，从手掌开始往手臂部分推直到整个脱下来了。
放入碗中，备用。
小米辣切均匀小颗，大蒜、洋葱、香菜切碎。
柠檬对半切开，把柠檬汁挤入鸡爪的容器里。
把全部调料倒入装鸡爪的容器，小米辣、大蒜、洋葱和香菜也放进去。
抓拌均匀。
放入冰箱一个晚上（6个小时）。', e'操作时，需要注意观察沸腾的水位线，如发现低于3/4的食材应加热水至没过食材。
鸡爪去骨教程 ：[bili_89324373958](https://www.bilibili.com/video/BV1t44y117D8?share_source=copy_web)', './无骨鸡爪.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (328, 0, '主食', '鲜', '轻松上手', '22', '汤面', '汤面是许多人喜爱的基础主食，根据个人喜好加入任何自己喜欢的食材，营养全面，固液兼具，材料易得，做法简单。', e'面食材料（手工面条、龙须面、面鱼、泡面面饼、各类规格粉丝等）70 - 230g
菜类材料（牛羊鱼虾等肉类、鸡蛋鸭蛋鹅蛋鸵鸟蛋等蛋类、豆块豆筋豆腐皮等豆制品类、生菜菠菜油麦菜、青椒番茄胡萝卜等蔬菜类）体积大约和面类相当
冷水200 - 400ml
盐、胡椒粉、香油等调味料适量', e'先将菜类材料切成边长不超过4cm的块状。
如有生肉，则先放入冷水中，盖上锅盖，煮沸腾，先捞出上层血沫，再关火，捞出半熟的肉备用。
先大火将水加热至沸腾，后调至中火。
将较难煮熟的食材放入锅中（比如半熟肉类、香菇类等最先放入锅中），沸腾后计时10分钟，特别难熟的大块食材可追加5分钟。
将面食放入锅中，适当搅拌确保面和汤充分接触，使液面保持轻微沸腾，煮5分钟。加入面后液面易产生白色泡沫，可适当抬起锅盖通气或者撤下锅盖。
将易于煮熟的食材如青菜类放入锅中，适当搅拌以充分浸没，煮2 - 5分钟。
关火，随后加入盐、胡椒粉、香油等自己喜欢的调味料，适当搅拌即可出锅食用。', e'操作流程可根据自己喜好更改，多多尝试会有惊喜。
如掌握不好加盐量，可采用少量多次添加的方法，以免过量。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (329, 0, '素菜', '咸', '大展身手', '15', '红烧茄子', '红烧茄子是一道常见的中式菜肴，以茄子为主料，搭配多种蔬菜和调料烹制而成。色泽红亮，口感软糯，味道醇厚。', e'青茄子（份数 * 0.7 个）
青辣椒（份数 * 0.5 个）
洋葱（份数 * 0.3 个）
西红柿 1 个
大葱 半颗
大蒜 3 瓣
鸡蛋 1 个
面粉（青茄子数量 * 150 克）
淀粉（面粉 / 4 克）
盐
酱油（茄子数量 * 7 克，向上取整）', e'1. 青茄子、青辣椒、西红柿、洋葱、大葱洗净。
2. 大葱切 5 毫米宽的葱花，大蒜扒皮并拍碎，西红柿切 6 立方厘米的块，青辣椒、洋葱切 5g 的块。
3. 茄子切菱形块（先切 2 公分厚的片，然后再把片切成 2 公分的条，最后斜刀切块儿...）。
4. 将面粉倒入盆中，依次加入少量水，搅拌均匀，呈粘稠糊状。
5. 加入淀粉，加入 30 克水，搅拌均匀。
6. 将鸡蛋打到盆中，加入（面粉 / 20）克的盐，搅拌均匀。
7. 将茄块倒入面糊中，搅拌使茄块的每一面都能沾上面糊。
8. 开大火，热锅，加入 500 毫升的油，当能看到锅里的油冒出一丝烟时，调至小火，将茄块用筷子夹入到油锅，待所有的茄块下锅之后，调至中火，直到茄块变金黄色时捞出，将油倒出。
9. 加入（份数 * 5）g 的油，放入大蒜、葱花，翻炒 15 秒，放入青辣椒块翻炒 30 秒，放入西红柿翻炒 30 秒。
10. 放入炸好的茄块，加水面高度为锅内食材的 0.8 倍。
11. 放入酱油和（份数 * 3）g 的盐。
12. 等待，直到汤汁呈粘稠状（水位大概为剩余食材高度的 0.2 - 0.3 倍），开盖，盛出菜，关火。', e'在操作的第 4 - 6 步骤中要注意顺序执行，否则会有灾难性错误。对于使用剩余的食用油，可以考虑重新收集到油壶。
切茄子时尽量切得大小均匀，这样炸制时受热更均匀。
炸茄子时注意控制油温，避免炸糊。
煮制过程中要适时搅拌，防止粘锅。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (330, 0, '荤菜', e'鲜
辛辣', '得心应手', '40', '口水鸡', '口水鸡是一道适合夏天吃的肉菜，被红油包裹的鸡肉，红艳鲜亮，冰爽Q弹，鲜美而不腻。', e'半只鸡
辣椒粉20g
花椒30颗（20g）
花生10颗（30g）
葱姜蒜适量
白糖5g
生抽5ml
醋5ml
味精5g
花椒粉5g
香菜5g
食用油20ml', e'1. 姜切片，1颗小葱，15颗花椒备用；
2. 鸡肉洗干净，放入锅中，清水没过鸡肉，放入姜片、小葱和花椒，开大火烧开；
3. 大火烧开后，转中小火20分钟关火；
4. 取出鸡肉，放入冰水中，直至冰凉；
5. 取出鸡肉，切块摆盘子中，备用；
6. 小火把锅烧热，导入花生，烘烤至表皮爆裂。（注意随时翻动，不要糊了）；
7. 一颗葱切成段，蒜拍成末，花椒15颗，花生去皮切碎；
8. 锅内导入油烧热后，放入葱段，花椒和一半蒜末，炒香；
9. 炒至油温8成热，关火，滤出热油；
10. 将热油倒入放辣椒粉的碗中，搅拌，并滤出红油；
11. 红油中放入剩余蒜末、生抽、醋、盐、味精、糖、香油、花椒粉。拌匀放凉；
12. 在鸡肉上撒上花生碎，把红油淋到切好的鸡肉上，撒上香菜。成盘', e'注意制作过程中各调料的用量和火候控制，烘烤花生时要随时翻动防止糊锅，炒香调料时注意油温以免炸糊。
制作过程中可根据个人口味适当调整调料用量。', './口水鸡.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (331, 0, '素菜', '', '得心应手', '8', '茄子炖土豆', '这道菜介绍了茄子炖土豆的做法，包含必备原料和工具、计算食材用量的方法以及详细的操作步骤，还有一些注意事项。', e'茄子（份数*1个，每个约150g）
土豆（份数*1个，每个约150g）
肉（份数*180克）
辣椒50克
酱油（份数*15毫升）
盐（份数*5克）
蒜3瓣', e'将茄子、土豆、辣椒洗净，蒜扒皮并拍碎。
将茄子、土豆切成约6立方厘米的块，辣椒切成5克的小块，肉切成3厘米的丝。
开火，热锅，加入份数*13毫升的油。
当能看到锅里的油冒出一丝烟时，放入辣椒。
煸出辣椒香气后，立刻放入肉，用铲子翻炒30秒。
放入土豆，翻炒30秒。
放入茄子，翻炒30秒。
放入酱油和盐，继续翻炒5分钟。
加入水，水面高度为锅内食材高度的0.9倍，并盖上锅盖。
等待，直到锅内水的高度剩余食材高度的0.1倍时，开盖，放入蒜，搅拌均匀，关火。', e'在操作的第5-7步骤中要注意：在此过程中注意锅底如果没有液体（油或水），则加5毫升的水再继续翻炒。
一份正好够2-3个人食用。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (332, 0, '荤菜', e'鲜
辛辣', '得心应手', '4.8', '尖叫牛蛙', '尖叫牛蛙是一道容易完成的菜，味道鲜美，具有开胃功效，老少皆宜，适合食欲不佳时制作，能吃辣的人制作更佳。', e'牛蛙肉块800g
泡姜20 - 30克
泡椒5 - 10克
野山椒10克
青红辣椒20克
大蒜30 - 50克
豆瓣酱20 - 30克
盐巴15克
胡椒粉10克
生粉30克
啤酒400 - 500ml
料酒10ml
藤椒油5 - 10ml
猪油20ml
食用油200ml
葱花5克', e'牛蛙肉洗净后控干水分，加入10克以上的盐巴和50ml以上的啤酒，用手抓5分钟，去除牛蛙肉的腥味。
然后对着清水冲洗，直至不再流出血水和杂质，控干水分，放到合适的器皿中，准备腌制。
加入5克盐，30克生粉，10ml料酒，5克胡椒粉，用手抓均匀，腌制5 - 10分钟。
将泡姜、泡椒、野山椒切丝或者片，青红辣椒切成圈圈，大蒜拨开即可。
起锅烧热，加入200ml食用油，烧至6成油温，将腌制好的牛蛙倒入，快速过油炸制，10秒钟后捞出。
捞出蛙肉后，控油，并将锅中的热油倒出到碗中，保留30ml，加入20ml猪油。
待油温6成热，加入泡姜、泡椒、野山椒、大蒜，炒出香味，加入豆瓣酱20克，中火翻炒至出红油，倒入400ml啤酒。
然后倒入炸过的牛蛙肉，用勺子推着翻，不要用力搅拌，加入5克胡椒粉，加入5ml藤椒油，中火慢焖3分钟。
加大火力，大火收汁半分钟，加入青红辣椒圈，再煮10秒准备起锅。
盛到盆里，撒上葱花。', e'控干水分的时候可以选择漏勺按压
生粉抓揉的时候要均匀覆盖蛙肉', './尖叫牛蛙.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (352, 0, '素菜', '鲜', '小试牛刀', '4', '上汤娃娃菜', '上汤娃娃菜是一道素菜，也是减肥餐，色香味俱全。', e'娃娃菜700g
金针菇10g
皮蛋一个
午餐肉（火腿肠）适量
葱3g
姜10g
蒜10g
盐
糖
淀粉
蚝油
味精', e'娃娃菜洗净，竖着切开切成段。
葱切小段，蒜切片，姜切小片。
皮蛋切成丁，火腿肠或者午餐肉切成1cm大小的丁。
金针菇洗净撕开。
烧热水，娃娃菜放进去十秒钟出一下水捞出。
热锅凉油，加热锅倒入油过一遍就倒出来，重新倒入一点油。
调至小火加入葱姜蒜，煎炒出香味。
加入300g清水（水量没过娃娃菜即可），放入娃娃菜、金针菇、午餐肉。
加入调味料蚝油、糖、盐、味精烧开。
煮3分钟，煮开后开始装盘，盛出娃娃菜后皮蛋放在上面把汤汁浇上去。', e'根据个人喜好决定是否添加金针菇。
切葱姜蒜时尽量切得大小均匀，便于烹饪时受热均匀。
煮娃娃菜的时间不宜过长，否则口感会变老。
调味时可根据个人口味适当调整盐、糖、蚝油、味精的用量。', './上汤娃娃菜.png', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (333, 0, '汤与粥', '鲜香', '得心应手', '90', '罗宋汤', '罗宋汤是一道源自俄罗斯甜菜汤的汤品，传入上海后有了本土化做法。制作相对简单，适合初学者，具有独特风味。', e'蔬菜高汤（欧芹、胡萝卜、洋葱三件套）
牛肉高汤（可用〇汤宝代替）
牛肉（可选牛腩肉或牛尾肉）250g
番茄（番茄膏5g、番茄罐头2罐）
马铃薯400g
洋葱100g
胡萝卜100g
欧芹100g
包菜200g
红肠100 - 200g
橄榄油5mL
植物油5mL
盐18g
黑胡椒3g', e'切配准备：洋葱、胡萝卜、欧芹切1cm见方小丁；红肠、马铃薯切2cm块；包菜去梗后，手撕至2cm片；牛肉撒盐3g、黑胡椒3g腌制5分钟。
煎制过程：平底锅烧热，加入植物油，煎制牛肉，直至表面焦黄色（可以带生，千万别糊了），取出备用。
烹制过程1（前一小时）：汤锅烧热，加入橄榄油、洋葱丁、胡萝卜丁、欧芹丁，炒至洋葱透明，加入番茄膏、番茄罐头，加入牛肉、马铃薯丁，翻炒均匀，加水没过食材，中火烹制1小时。
烹制过程2（后半小时）：开锅加入包菜丁、红肠丁，搅拌均匀，中火烹制半小时，开盖加入剩余15g盐，混合均匀后盛盘。', e'番茄尽量不用新鲜番茄代替，番茄罐头+番茄膏的组合风味更足。除了胡萝卜、洋葱、欧芹、牛肉是必备食材外，其余可自由搭配。
煎牛肉时注意火候，避免煎糊。
烹制过程中注意观察水量，及时补充。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (334, 0, '素菜', '辛辣', '得心应手', '7', '手撕包菜', '手撕包菜是一道色香味俱全的汉族名菜，属于湘菜系。', e'包菜 1 颗
五花肉 200 g
小米辣 2 根
食用油 60 ml
料酒 5 ml
生抽 5 ml
香醋 5 ml
鸡精 2 g
姜 2 片
蒜头 2 粒
蒜苗 0.5 根
盐 5 g', e'包菜对半切开，去掉中间白色部分。
手撕包菜，碗中放入 2 g 盐，清洗包菜并沥干备用。
姜片、蒜头、小米辣、蒜苗处理后备用。
五花肉切片，清水清洗后备用。
锅中加入 30 ml 食用油，倒入包菜翻炒，大火翻炒 1 分钟后，加入 3 g 盐 ，继续翻炒 2 分钟后取出备用。
锅中加入 30 ml 食用油，倒入五花肉，大火翻炒 1 分钟。
倒入姜片等材料，翻炒 1 分钟。
倒入包菜翻炒后，加入香醋、料酒、鸡精、料酒，大火继续翻炒，2 分钟后出锅。', e'步骤五中，翻炒时间需要根据实际情况做调整，一般是炒到包菜七分熟后即可。七分熟是指包菜已经出水质感变软。
步骤五中，加盐的作用是锁住包菜水分的同时，给包菜上一点味道。
最后一个步骤中，翻炒时间根据实际情况和个人口感做灵活调整。', e'./1.jpeg
./2.jpeg
./3.jpeg
./4.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (335, 0, '主食', '咸', '得心应手', '10', '茄子肉煎饼', '茄子肉煎饼是一道简单易做的饼类主食', e'米粉250g
小麦粉50g
鸡蛋1个
煮熟的腊肉100g
茄子1根（约10 - 15cm长）
食用油10 - 15ml
食盐1 - 2g', e'将茄子去皮后切成片，将腊肉切成片，备用
依次向盆中加入250g米粉、50g面粉和1个鸡蛋
边用筷子搅拌，边加入清水，使米粉、面粉、鸡蛋混合成面糊,当面糊能够附着在茄片、肉片上而不掉落时停止加水，而后将所有茄片和肉片放入面糊中，用面糊充分包裹
平底锅加入食用油10 - 30ml，开小火
用筷子或勺子把裹了面糊的茄片、肉片放入锅中，先煎至两面金黄，再煎3 - 6分钟
撒盐，翻炒均匀，起锅装盘', e'煎的过程中，食用油会变少，可再添加食用油
用小火煎', e'./茄子肉煎饼.jpg
./1茄片肉片.jpg
./2米粉250g.jpg
./3米粉面粉鸡蛋.jpg
./4混合.jpg
./5起锅烧油.jpg
./6开始煎.jpg
./7撒盐准备起锅.jpg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (336, 0, '素菜', e'鲜
甜
酸', '小试牛刀', '6', '虎皮青椒', '虎皮青椒是一道以青椒为主要食材，经过独特烹饪方法制作而成的美食。制作时，先将青椒处理干净并切片，通过特定的调料调配和烹饪步骤，使青椒呈现出虎皮般的色泽，口感鲜美，兼具甜酸等丰富味道。', e'青椒5个
大蒜2 - 3瓣
油20ml
白糖15g
生抽15ml
香醋15ml
盐4g', e'去掉青椒蒂，用自来水冲洗干净。
青椒切长片，平均一个青椒纵向切成3 - 4片即可。
大蒜去皮，切成碎末，体积在2mm x 2mm x 2mm即可。
拿一个小碗倒入20ml油，将大蒜末放入其中。
白糖、生抽、醋、盐全部倒入砵（碗）等容器，搅拌。
将装有蒜末和油的调料1倒入锅中，开火加热5成放入青椒，青椒片不要叠在一起，单独成片放置锅中。
用锅铲不停的按压青椒，合适的时候翻面。
翻炒约2分钟，待青椒表皮出现褶皱时，倒入调料2。
加大火候继续翻炒30s后即可出锅盛入盘中。', e'青椒切长片时注意厚度均匀，便于后续烹饪。
烹饪过程中按压青椒力度要适中，避免压烂。
倒入调料2后加大火候翻炒时间不宜过长，以免调料焦糊影响口感。', './虎皮青椒.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (337, 0, '主食', '鲜', '轻松上手', '20', '西红柿鸡蛋挂面', '西红柿鸡蛋挂面只需简单的食材，快速的操作，不多的厨具，解决不想麻烦、挂面太多、食材简单的所有烦恼', e'挂面1把（50 - 100g）
西红柿1个（约200g）
鸡蛋1 - 2个
盐5g
蚝油5g或鸡精3g
白砂糖2g
酱油5 - 8g
食用油20g
香油5g
小葱
青椒（非线椒）
白醋2g（鸡蛋去腥用）
黑胡椒2g（可加在鸡蛋液中）
白胡椒粉2g（熬臊子用）', e'小葱洗净切成葱花，西红柿切块儿，青椒切成菱形块，生鸡蛋打入小碗并打散（可加2g白醋去腥）；起锅烧热，倒入15 - 20g食用油，待油温到七成热时，倒入蛋液快速划散，鸡蛋滑到凝固后倒入小碗备用，留底油。
锅中留底油，加入葱白、蒜末炒香，加入西红柿块、青椒，待西红柿炒出一点汁水，加入5g酱油和2g白砂糖，翻炒十几秒后加入一碗清水（刚好没过西红柿），煮沸后加入炒好的鸡蛋，加入蚝油5g或者2g鸡精提鲜，中小火收汁，期间搅拌防止粘锅，收汁到一定程度后加一点葱花（剩下的葱绿部分）和香油（不加也可）。
不用洗锅，直接加清水500ml，煮沸加入挂面，挂面煮软后加入100ml清水，再次煮沸后，若面条飘起来了，再加入100ml清水，煮沸后看面条两侧是否呈透明状，透明状则熟了，捞面到臊子碗中，拌面即可。', e'鸡蛋蛋液中可以加入2g黑胡椒味道更好。
熬臊子过程中加入2g白胡椒粉提升香辛口味。
煮面条如果一次性煮熟也可以，多次加水是为了让面条口感劲道，面条不粘黏，技巧在于煮沸就加冷水，循环往复两三次即可。
对于使用剩余的食用油，可以考虑重新收集到油壶。', e'./food.jpg
./pretreatFood.jpg
./fryEgg.jpg
./tomato.jpg
./tomatoNoodle.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (338, 0, '汤与粥', '甜', '大展身手', '150', '腊八粥', '腊八粥，又称七宝五味粥、佛粥、大家饭等，是一种由多样食材熬制而成的粥。主要富含碳水化合物、磷镁元素和各类维生素等，不仅可以补充日常的能量，其中的莲子还有养心安神的作用，适合工作压力大的人食用。', e'饮用水 1L
大米 50g
糯米 50g
薏米 50g
黑米 50g
小米 50g
莲子 25g
绿豆 25g
红豆 25g
花生 25g
黄豆 25g
豌豆 25g
红枣 25g
桂圆 25g
栗子 25g
去壳核桃 25g
葡萄干 25g
红腰豆 25g
冰糖 10 - 25g', e'提前洗净好绿豆、红豆、花生、黄豆、豌豆、红腰豆，并用干净的玻璃碗盛放好，注入 3/4 玻璃碗大小的饮用水，浸泡一夜（或最少 8 小时）。
提前洗净好大米、糯米、薏米、黑米、小米、莲子，并用干净的玻璃碗盛放好，注入 3/4 玻璃碗大小的饮用水，浸泡 3 小时。
将步骤 1 中准备好的盛有绿豆、红豆、花生、黄豆、豌豆、红腰豆的玻璃碗中的水分分离倒出，其余原料倒入粥锅中，加入 1 升饮用水（或漫过食材 1 拇指块），大火煮沸，煮沸后合上锅盖，小火煮 30 分钟。
将步骤 2 中准备好的盛有大米、糯米、薏米、黑米、小米、莲子的玻璃碗中的水分分离倒出，其余原料继续倒入粥锅中，合上锅盖，小火煮 60 分钟。
洗净好红枣、桂圆、栗子、核桃、葡萄干（其中红枣切成小片）、冰糖，倒入锅中，合上锅盖，小火煮 60 分钟。
确认煮出的粥粘稠后即可关火、盛盘、食用。', e'往粥锅加入食材时，应当进行搅拌，使食材原料均匀分布在各处，并注意观察水位线，如发现水位线低于米线及食材应立即补水。
注意控制火候，不要过大，定时搅拌。如果使用普通锅，建议烧开水后再下原料，搅拌到再次烧开改小火，避免锅底烧糊。如果有条件，建议改用高压锅或粥锅。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (339, 0, '荤菜', e'甜
酸', '大展身手', '45', '老式锅包肉', '锅包肉是东北名菜，创始于光绪年间哈尔滨道台府厨师郑兴文之手。老式锅包肉的酸味来源于白醋汁，口味酸甜酥脆。', e'猪通脊肉 300g
大葱 50g
姜 30g
蒜 3 - 4 瓣
胡萝卜 10g
香菜 10g
白醋 40g
白糖 40g
料酒 20ml
盐 8g
味精 5g
土豆淀粉 210g
中筋面粉 70g
小苏打 5g
白熟芝麻 5g
食用油 1000ml', e'1. 处理猪肉：将猪通脊肉切成厚度 8mm 的均匀肉片，去除白色筋膜。用清水冲洗肉片，去除血水。加入小苏打 5g，抓匀，静置 5 分钟。用清水冲洗 1 - 2 次，去除多余小苏打。
2. 腌制肉片：在肉片中加入盐 4g、料酒 5ml，拌匀，腌制 15 分钟。
3. 准备挂浆：方法一：将土豆淀粉 100g 加入 200ml 清水，搅匀，静置 20 分钟。倒出上层 2/3 的清水，保留底部淀粉浆，搅匀至酸奶状。方法二（推荐）：将土豆淀粉 210g 和中筋面粉 70g 混合。少量多次加入清水，搅拌至酸奶状，提起可拉丝，浆糊能在盆中堆积。加入食用油 10ml，小苏打 1g，搅拌均匀。
4. 挂浆：将腌制好的肉片放入浆糊中，拌匀，使每片肉均匀裹上浆。
5. 调制糖醋汁：混合白糖 40g、白醋 40g、盐 4g、味精 5g、米醋 5ml，搅拌均匀，备用。
6. 准备配菜：大葱、姜、胡萝卜切丝，香菜切段，蒜切片。
7. 炸制肉片：第一次炸制：锅中加入食用油，加热至 150℃（五成热）。将肉片逐片放入油中，炸至表面定型，颜色浅黄，约 30 秒，捞出备用。第二次炸制：油温升至 170℃（六成热）。将所有肉片放入油中，炸至外壳金黄酥脆，约 1 分钟，捞出备用。第三次炸制（可选）：油温升至 200℃（七成热）。将肉片快速复炸 10 - 20 秒，增强酥脆度，捞出沥油。
8. 炒制：锅中留 20ml 底油，加热后放入姜丝、蒜片，煸香 10 秒。倒入调好的糖醋汁，大火加热至沸腾，熬至汤汁粘稠，约 30 - 60 秒。放入炸好的肉片、葱丝、胡萝卜丝、香菜段，快速翻炒 3 次，使汤汁均匀裹在肉片上。
9. 出锅装盘：将锅包肉盛入盘中，撒上白熟芝麻，即可上桌。', e'1. 肉片厚度应为 8mm，过厚过薄都会影响口感。
2. 炸制时控制油温，避免外壳过深或不酥脆。
3. 熬糖醋汁时，注意熬至粘稠但不结块，避免变成糖浆。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (340, 0, '荤菜', e'酸甜
醇香', '大展身手', '50', '西红柿牛腩', '西红柿牛腩汤汁浓厚酸甜可口，牛肉软绵醇香，搭配米饭是绝配。', e'西红柿3 - 4个（每个约200g）
牛腩500g
2cm两段葱段、两片姜片，葱花、姜各10g
生抽
白胡椒粉
白糖
料酒/黄酒
八角三小片
食用油20 - 30ml', e'牛腩切条、切块成长宽高均2cm，冷水下锅，开锅煮制2分钟去除血水，捞出冲洗干净。
另起锅2L水烧开，加入2cm两段葱段、两片姜片、八角、料酒/黄酒5 - 10ml，放入焯好的牛肉，盖盖炖制（砂锅1小时，高压锅炖肉模式45分钟），筷子能轻松插透就证明炖好了。
西红柿去皮：西红柿头部滑十字至腰线，筷子/刀叉从果蒂捅入，煤气灶小火，一边转动一边烤，及时拿下来查看，起皮后撕下来，切块，越小越好。撕皮小心烫，去皮后的西红柿特别滑，慢切注意安全。
起锅烧油，油温7成热，葱、姜各10g，番茄下锅，炒透炒出番茄红色，加入煮好的牛腩和原汤，原汤刚刚没过牛肉即可。
根据个人口味放入盐、糖、生抽调味盖盖。
开锅后大火继续炒制3 - 5分钟。
待番茄汁呈中等粘稠程度后关火，散入葱花，盛盘。', e'用火注意安全。
用砂锅/铝锅炖肉时，水开后转中小火/小火。
教程中的番茄去皮方式是目前为止本人实践最快的方式。
绝对不用番茄酱和少加佐料，尽可能还原食材的原味。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (341, 0, '主食', '咸', '得心应手', '10', '蛋炒饭', '蛋炒饭是一道常见的家常美食，以冷饭为主要原料，搭配鸡蛋、火腿、黄瓜、胡萝卜等食材炒制而成。通过合理的操作步骤，可以制作出粒粒分明、香气扑鼻的美味蛋炒饭。', e'冷饭（份数*500ml）
鸡蛋 （份数*1.5 // 1 向下取整）
火腿（份数*2 个）
黄瓜（可选，份数*30g）
胡萝卜（可选，份数*30g）
油（份数*12ml）
盐（份数*4g - 份数*6g）
胡椒粉（份数*8g）
香葱（份数*1 颗）
生抽（份数*10ml）
灯影牛肉丝/午餐肉/腊肠/卤肉...等熟肉（备选）', e'米饭提前用铲子铲成小块
火腿肠、胡萝卜、黄瓜等根据需求切片或者块状
如果家里有熟肉准备好味道更佳
将蛋白，蛋黄分开，分别打入一个大碗里，各自搅匀，注意不要在这一步加盐
大火热锅，待锅里冒烟放入食用油，放入蛋白，待主体凝固后盛出备用
如果油够，则直接放入蛋黄，如果油不够则放入食用油并等其升温到大火热锅
待主体凝固后，将火调至中小火，倒入火腿肠、熟肉，胡萝卜、黄瓜等备料、翻炒 10 秒钟（到爆香）
重新倒入蛋白，翻炒 5s 钟，迅速倒入米饭大火翻炒，为的就是每一粒饭都裹上鸡蛋
翻炒过程中将米饭的块状捣碎、这一步过程会比较长、待米饭全部捣碎再翻炒均匀即可
调至小火、加盐、胡椒粉、生抽
进一步翻炒均匀，能看到一些米饭在锅里有“跳起来”的时候其实就已经差不多了
最后倒入香葱再翻炒 10s
关火、盛入碗中', '使用隔夜的冷饭炒饭最佳，没有冷饭的同学也可以现煮（可以使用冰箱立马给米饭降温），不过要做到“粒粒分明”的口感就需要炒更久。炒饭要做到“粒粒分明”其实就是要将饭炒干。为什么要用隔夜的冷饭是因为隔夜已经流失了一定的水分。对于使用剩余的食用油，可以考虑重新收集到油壶。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (353, 0, '素菜', '鲜', '轻松上手', '10', '蒸箱鸡蛋羹', '蒸箱鸡蛋羹是一道简单快捷易做的菜，制作时长约为15分钟，适用于有家庭蒸箱的厨师。', e'鸡蛋1个
食用盐1g
食用油5ml
生抽6ml（可选）', e'一个鸡蛋放入碗中打散。
向碗中加入鸡蛋体积1.0 - 1.5倍60度纯净水，并且搅拌均匀。
加入食用盐1g。
加入食用油5ml。
过滤蛋液，去掉蛋液中的浮沫（可选）。
确认蒸箱的水源已经补充至足够（若不确定，可把水槽补满）。
将已经完全搅拌均匀的鸡蛋液碗放入蒸箱。
调节至100摄氏度蒸10分钟。
打开蒸箱 （注意：蒸箱在开启时会有蒸气瞬间喷出，注意缓慢开启）。
出锅（可加入生抽调味）。
享用。', e'超出水的添加范围后，水越少口感会变得太弹，水越多会变得太稀。
过滤蛋液可避免蒸出来的蛋有气泡不好看。
蒸箱开启时会有蒸气瞬间喷出，要缓慢开启。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (342, 0, '水产', e'鲜
辛辣', '大展身手', '20', '香煎翘嘴鱼', '香煎翘嘴鱼是一道烹饪过程较为复杂的菜肴，以翘嘴鱼为主料，搭配多种调料精心制作而成。通过独特的开背杀鱼、腌制、晾晒等前期处理，再经过煎制和调味等步骤，做出的香煎翘嘴鱼肉质细腻，口味鲜香微辣。', e'翘嘴鱼2斤
姜20g
葱半根（50克）
蒜4个
香菜适量
老抽2ml
白糖10g
干辣椒4 - 6个
料酒100ml
生抽4ml
盐约50g
食用油100ml
青椒适量', '鱼开背杀好，清洗干净；鱼表面用盐涂抹均匀，倒入料酒约80ml，姜末20g，放入冰箱保鲜层进行腌制1 - 2天；取出腌制好的鱼，用绳挂起晾晒至半干（约1 - 2天）；食用前将鱼用清水清洗，沥干水分；开大火将锅烧热，迅速改小火，锅中放油，将鱼沿锅边划入锅内（先煎鱼背面）；鱼入锅后不要着急移动鱼的位置，煎约30秒后，尝试晃动锅；背面煎约1分钟后，翻面煎约1 - 2分钟，煎至两面金黄；两面都煎好时，把鱼推向锅边一点，放入豆瓣酱炒香味，放入姜蒜；炒出佐料香味后，加入料酒，生抽，老抽，倒入热水，水量和鱼平齐或者少点；改中大火，煮5 - 10分钟，后放入青椒段，白糖，鸡精，十三香，陈醋；改小火2 - 5分钟，放入葱，香菜，即可出锅。', '鱼要开背杀，腌制时只在鱼表面均匀涂抹食盐；腌制1 - 2天，晾晒1 - 2天；煎鱼全程小火，刚入锅时不要移动鱼；青椒段放入后注意观察熟透程度，香菜最后放；注意火候的切换，以及豆瓣酱、白糖的调鲜效果和陈醋的增香效果。对于使用剩余的食用油，可以考虑重新收集到油壶。', './香煎翘嘴鱼.jpeg', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (343, 0, '素菜', '咸', '大展身手', '15', '红烧茄子', '红烧茄子是一道美味的素菜，以茄子为主料，搭配多种蔬菜和调料烧制而成。先将茄子切成菱形块，裹上面糊炸至金黄捞出，再与其他蔬菜一起炒制，加入适量调料煮至汤汁粘稠。', e'青茄子（份数 * 0.7 个）
青辣椒（份数 * 0.5 个）
洋葱（份数 * 0.3 个）
西红柿 1 个
大葱半颗
大蒜 3 瓣
鸡蛋 1 个
面粉（青茄子数量 * 150 克）
淀粉（面粉 / 4 克）
盐
酱油（茄子数量 * 7 克，向上取整）', e'1. 青茄子、青辣椒、西红柿、洋葱、大葱洗净。
2. 大葱切 5 毫米宽的葱花，大蒜扒皮并拍碎，西红柿切 6 立方厘米的块，青辣椒、洋葱切 5g 的块。
3. 茄子切菱形块（先切 2 公分厚的片，然后再把片切成 2 公分的条，最后斜刀切块儿...）。
4. 将面粉倒入盆中，依次加入少量水，搅拌均匀，呈粘稠糊状。
5. 加入淀粉，加入 30 克水，搅拌均匀。
6. 将鸡蛋打到盆中，加入（面粉 / 20）克的盐，搅拌均匀。
7. 将茄块倒入面糊中，搅拌使茄块的每一面都能沾上面糊。
8. 开大火，热锅，加入 500 毫升的油，当能看到锅里的油冒出一丝烟时，调至小火，将茄块用筷子夹入到油锅，待所有的茄块下锅之后，调至中火，直到茄块变金黄色时捞出，将油倒出。
9. 加入（份数 * 5）g 的油，放入大蒜、葱花，翻炒 15 秒，放入青辣椒块翻炒 30 秒，放入西红柿翻炒 30 秒。
10. 放入炸好的茄块，加水面高度为锅内食材的 0.8 倍。
11. 放入酱油和（份数 * 3）g 的盐。
12. 等待，直到汤汁呈粘稠状（水位大概为剩余食材高度的 0.2 - 0.3 倍），开盖，盛出菜，关火。', e'在操作的第 4 - 6 步骤中要注意顺序执行，否则会有灾难性错误。
炸茄子时注意控制油温，避免炸糊。
煮制过程中注意观察汤汁状态，及时调整火候。', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (344, 0, '素菜', '咸', '小试牛刀', '3.5', '椒盐玉米', '这是一道美味的素菜，将解冻后的玉米粒经过多次吸水、裹淀粉、煎制等步骤，最后撒上椒盐和芝麻粒制成。制作过程并不复杂，能轻松做出美味的椒盐玉米。', e'玉米粒350g
淀粉40 - 70g
椒盐粉10g
芝麻粒10g
油适量', e'玉米粒解冻，可温水泡15分钟或灶上开水煮5分钟（带着包装一起煮，撕掉一个口）。
拿出簸箕BoxA垫上吸油纸，倒入解冻好的玉米粒，摇晃直到吸油纸变湿，再倒入簸箕BoxB重复操作，直到玉米表面无明显水滴但保持湿润。
倒入大量淀粉，摇晃使淀粉裹住玉米粒。
开灶放锅，倒入适量油铺满锅底，油热8成，倒入裹淀粉的玉米粒，中火先煎30s不翻炒，然后轻微翻炒3分钟出锅。
撒上3g椒盐和芝麻粒。', e'玉米粒可通过外卖软件买已剥好的，方便快捷。
操作过程中注意保持玉米粒湿润，避免淀粉掉落。
煎制时火候和时间要掌握好，防止玉米粒煎糊。', './椒盐玉米.jpeg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (345, 0, '水产', '甜', '得心应手', '6', '干煎阿根廷红虾', '阿根廷红虾生活在深海，体内含碘、磷及虾青素等微量元素，能增强人体免疫力。其不仅个大肥美，虾肉白如凝脂，口感鲜嫩，味道甜香浓郁。此菜做法简单，能让你享受美味。', e'阿根廷红虾2 - 3只
地中海海盐5g
黑胡椒（研磨装）
白葡萄酒20ml
生抽1ml
香菜3片
柠檬1片
洋葱10g
生姜10g
大蒜10g
橄榄油两调羹', e'提前一天将阿根廷红虾从速冻取出放到冷藏自然解冻，解冻好洗净擦干，用厨房用纸吸干水分（若已开背去虾线则节省此步骤）。
生姜切片，洋葱切小方块，香菜洗净叶茎分离，切碎香菜叶，大蒜压碎切末。
大火热锅，倒入两调羹橄榄油，油温升高后放入生姜片、洋葱块和香菜茎煸炒。
约一分钟后取出生姜、洋葱和香菜茎弃用。
调中大火，放入红虾煎，使虾单面完整接触平底锅，煎约2分钟，期间给每只虾刷一层油。
待底面虾壳微微焦黄时翻面，撒入大蒜碎末，轻微晃动平底锅使受热均匀。
约1分钟后添加20ml白葡萄酒。
再煎1分钟后调中小火，均匀撒上一层盐和黑胡椒。
给每只虾滴上一滴生抽。
撒上香菜叶，装盘，切好柠檬片摆到盘边。', e'柠檬可提升虾的口感，但偏酸，可根据喜好添加或不用。
一定要将解冻好的红虾沥干水分，否则煎制时容易溅油。
煎虾时注意火候和翻面时机，避免煎糊。
趁热吃口感更佳。', './干煎阿根廷红虾.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (351, 0, '素菜', '鲜', '轻松上手', '4', '微波炉鸡蛋羹', '微波炉鸡蛋羹是一道简单易制作的菜，适合夜间突然饿了的时候充当夜宵，快捷简单。', e'鸡蛋 2 个
水 200ml
虾皮 10 个
葱 5g
盐 3g
酱油
芝麻油 1ml', e'将鸡蛋打入可使用微波炉加热的陶瓷碗中，使用筷子将其打散。
加入水和盐，搅拌均匀。
将虾皮放入碗中，搅拌均匀，保证所有虾皮不会堆积在一起。
葱切碎至边长 0.6±3mm 状，放入碗中搅拌均匀。
将此碗及内容物放入微波炉中，容器表面覆盖保鲜膜或以可微波瓷盘加盖（注意：不得密封，必须留有涨缩量）加热 2 分钟(500W)。
小心地取下保鲜膜或其他覆盖物，然后继续加热 2 分钟。
若微波炉不带旋转式加热盘，将碗缓慢的水平旋转 180 度，以确保内容物加热均匀。
放入芝麻油。
小心地从微波炉中拿出碗（真的很烫）。
如果选择放入酱油，则确保酱油在鸡蛋羹表面流动后能以最薄的形式沾满鸡蛋羹表面即可。', e'鸡蛋 1 个约为 50±5g。若使用其他品种蛋品可按比例增减水量。
一定要确保将鸡蛋打散，否则可能会发生轻度鸡蛋爆炸。
鸡蛋和水不能超过碗容量的 2/3，否则可能发生溢出。', './微波炉鸡蛋羹.jpg', '3', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (346, 0, '主食', '鲜香', '得心应手', '15', '豆角焖面', '豆角焖面是一道操作简单、方便美味的懒人美食', e'鲜面条300g
五花肉100g
豆角150g
盐2g
食用油10 - 18ml
鸡精2g
生抽10ml
蚝油5g
十三香1g
老抽5ml
味精1g
热水150ml
葱10g
姜5g
蒜10g', e'将豆角切成5cm - 6cm的小段；将葱切成1cm - 2cm小段；将姜切成1mm x 1mm x 3cm的长条；将蒜拍碎切成1mm的粒度；将五花肉切成2mm厚度的肉片。
将锅烧热，烧去锅内水汽，手放锅内距离锅底10cm处，感觉明显有些许烤手时，加入定量食用油，手持锅柄离灶5cm处摇晃锅，使食用油挂满锅的三分之二（自下而上）；不粘锅忽略此操作，静待3 - 5秒油热即可。
放入全部姜和葱段，翻炒爆香5秒。
放入全部肉片，静置5秒后再翻炒，使肉裹满食用油，不断翻炒至肉片变色，沿锅边均匀淋入生抽，翻炒均匀。
依次加入盐、老抽、蚝油、十三香、鸡精以及全部豆角，翻炒2分钟。
加入准备好的热水。
水开后用勺子舀出锅内二分之一菜汤（不将菜舀出）。
将所有面条平铺在菜的上方。
盖上锅盖，中火焖5分钟。
打开锅盖，将舀出的菜汤用勺子每次一勺均匀撒在面条上。
盖上锅盖，中火焖3分钟。
打开锅盖，将所有蒜、味精均匀撒入。
此时锅内可能还有水，想吃湿一点的关火，否则不用关火。
使用筷子不断翻炒，将菜与肉均匀搅拌，关火。', e'炒肉时注意防止油飞溅，可带上手套或做好防护措施。
对于面条粗细有多种选择，可根据个人喜好挑选。
注意不同类型的锅在加热及倒油后的操作区别。
焖面过程中注意观察锅内情况，根据个人对干湿程度的喜好决定是否关火。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (347, 0, '荤菜', '鲜', '得心应手', '30', '意式烤鸡', '意式烤鸡是一道具有浓郁意大利风味的美食，通过特定的腌制和烤制方法，使鸡腿肉充满鲜香滋味。首先将鸡腿肉用盐、黑胡椒、橄榄油和蒜末涂抹均匀，放入预热至180度的烤箱烤制30 - 40分钟至熟。接着准备好切成碎末的欧芹和挤出的柠檬汁，烤好的鸡肉取出后淋上柠檬汁并撒上欧芹碎。烤制时可淋上蜂蜜或其他烤肉酱提升口感，烤制时间要根据鸡肉大小和厚度调整以确保熟透，因为未全熟的鸡肉可能导致食物中毒和感染细菌。', e'鸡腿肉（根据人数确定用量，通常1 - 2个/人）
盐（2g/人）
黑胡椒（0.5g/人）
橄榄油（5ml/人）
蒜（1瓣/人）
柠檬汁（5ml/人）
欧芹（1根/人）', e'鸡肉的预处理：鸡腿肉涂上盐、黑胡椒、橄榄油和蒜末；放入预热至180度的烤箱中，烤30 - 40分钟或至熟。
佐料的准备：欧芹切成碎末备用；柠檬挤出汁备用。
烤制：烤好的鸡肉取出，淋上柠檬汁；撒上欧芹碎即可。', e'烤制时可以将鸡肉淋上蜂蜜或其他烤肉酱提升口感。
烤箱预热至180度，烤制时间根据鸡肉的大小和厚度而定，需确保鸡肉熟透。
鸡肉必须全熟才能吃，吃未全熟的鸡肉可能会导致食物中毒和感染细菌，如沙门氏菌和福氏杆菌等。', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (348, 0, '饮料', '甜', '轻松上手', '156', '冰粉', '石凉粉，在有些地区也叫作冰粉，是河南省信阳市浉河区的一种著名特色小吃，属于豫菜系。该菜品类似果冻，但因为是天然植物做出来的，所以比果冻更健康，配上薄荷汁、柠檬汁、红豆等调料，清凉解暑。该食物深当地人的喜爱，老少皆宜。', e'冰粉籽200g
过滤豆浆渣的纱布一块
凉白开2000g
薄荷汁10ml / 薄荷粉10g
一次性透明塑料杯（可选）
遇水发光冰块（可选）', e'将凉白开倒入盆中；
将冰粉籽全部用纱布包起来，开口处打结
将包好的冰粉籽放入凉白开中，在凉白开中用力揉搓6分钟
然后将凉白开放置2.5小时，即可成型
随后将石凉粉用勺子装进准备好的一次性透明塑料杯中，加入10ml薄荷汁或者10g薄荷粉（柠檬汁、山楂汁、桑椹汁也可），再放入遇水发光冰块，用勺子慢慢搅拌均匀', '操作时，需要注意观察凉白开的颜色和粘度变化，如颜色过浅或者水不黏，则说明冰粉籽量不足，或者是揉搓力度和时间没有到位。', e'./石凉粉(冰粉)成品1.jpg
./石凉粉(冰粉)成品2.jpg', '5', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (349, 0, '饮料', '甜', '小试牛刀', '20', '耙耙柑茶', '耙耙柑茶是一款制作相对简单的特色饮品，通过合理搭配耙耙柑果肉、茉莉绿茶、冰块以及蔗糖糖浆（可选），能带来独特的口感体验。先泡好茉莉绿茶并冷却过滤，再将耙耙柑果肉与适量茶水等放入搅拌机搅拌均匀，最后点缀上撕碎的果肉即可享用。', e'耙耙柑1 - 2个（200克以上）
茉莉绿茶2 - 4克
冰块60克
蔗糖糖浆10克（可选）', e'称量2 - 4克茶叶置于容器，加入100毫升开水，泡6分钟。
往泡好的绿茶中放入60克冰块冷却，可搅拌加速冷却。
待冰块消失后，将茶叶过滤得到茉莉绿茶茶水约160毫升。
选择一个容量约300毫升的透明玻璃杯。
取出耙耙柑的肉瓣，剥去外皮，取得果肉。
取130克果肉和130毫升茉莉绿茶放入搅拌机中。
倒入10克蔗糖糖浆（可选，如果喜甜可放）。
封盖启动搅拌机，搅拌20秒后将搅拌产物倒入杯中。
取一点果肉撕碎撒在液面上。', e'调配茉莉绿茶时，注意按照推荐比例茶 : 水 : 冰 = 1 - 2 : 50 : 30进行操作，能保证较好的口感。
搅拌时间控制在20秒左右，避免过度搅拌影响饮品的质地。
如果没有蔗糖糖浆，可不添加，直接饮用也别有一番风味。
使用透明玻璃杯便于观察饮品的色泽和分层等。
耙耙柑可以根据实际情况用丑橘等其他容易分离果肉的柑橘替代。
若要配置更大分量，可按照果肉和茶水1 : 1的比例提升用量。', 'citrus - tea.jpg', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (350, 0, '主食', '鲜', '小试牛刀', '21', '蒸卤面', '蒸卤面是一道豫南的非常经典的家常菜，荤素搭档，简单易学。', e'猪五花肉350g
芹菜两根中等大小
鲜面条500g
葱10cm
大蒜5瓣
姜片20g
青椒2个
干红椒3个
花椒20粒
盐10g
五香粉5g
生抽15ml
老抽10ml
食用油（花生油最佳）', e'备料：猪肉去皮，切成2cm * 6cm * 0.5cm薄片备用；芹菜去叶，去掉根部2cm，然后从中对半切开，切成2cm段备用；大蒜去皮切粒备用，葱切0.2cm薄片备用，姜切细丝备用。
预制：炒锅烧热至冒烟后，倒入3ml食用油滑锅后倒出底油；重新加入食用油，加入肉片，葱姜蒜，干红椒，炒1分钟，注意不停匀速翻炒；加入料酒，生抽，老抽，再翻炒1分钟；续入500ml热水。盖上锅盖炖煮3分钟；将芹菜，青椒倒入锅中，加入盐，五香粉调味，盖上锅盖继续炖煮煮3分钟后关火；蒸锅加入1000ml水，烧开上汽后，将面条摊平在笼屉上放入锅中，蒸15分钟；面条蒸熟后取出，用筷子和无情铁手扒拉散开在案板上，室温冷却。
再加工：将面条放入菜锅中搅拌，搅拌方式为一手持筷，一手持锅铲将菜翻至面条上面，以面条以全部均匀上色为搅拌完成标准；将搅拌后的面条再次放在整屉上，再次蒸10分钟关火。', '切割猪肉时，可以让菜市场摊贩帮忙，根据经验，请求时机把握在已切割后未付款之前成功率最高；首次做饭时可以提前备好料防止手忙脚乱，后续熟练后可以并发执行；两次蒸面条时，都要尽量的弄散开，可以避免蒸好后团在一起。面条太长时可以拽断，方便后续搅拌与盛取；取出蒸好的面条时尽量动作轻一些，避免蒸屉翻到面条触水；佐餐时啤酒更配呦！', '', '2', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (354, 0, '荤菜', e'甜
辛辣', '小试牛刀', '50', '甜辣烤全翅', '本甜辣烤全翅使用空气炸锅烹饪并仅使用家中常见调料，低油脂并且不需要成品烧烤酱，一份适合单人食用，食材处理需要15分钟，腌制需要120分钟，烹饪需要50分钟。', e'鸡全翅4个
生抽45ml
老抽15ml
蒜粉10g
胡椒粉5g
糖10g
甜椒粉10g
辣椒粉5g
蚝油15ml
水20ml
油10ml', e'将4个新鲜鸡全翅取出，在翅中两根骨头之间用刀划开表皮，正反面各一刀
将4个鸡全翅放入碗中，加入生抽45ml ， 老抽15ml ， 蒜粉10g ， 胡椒粉5g ， 糖10g ， 甜椒粉10g ，辣椒粉5g ， 蚝油15ml ， 水20ml以及油10ml
用勺子将酱汁均匀的抹在鸡全翅上，尤其是翅中的刀口处，大约花费3分钟
用保鲜膜盖住防油腌制中鸡全翅的碗，放入冰箱冷藏格静置120分钟
取出鸡全翅，锡纸盘中放入鸡全翅4个，将碗中残余酱料均匀倒在鸡全翅上
锡纸盘放入空气炸锅的烤篮上，用200摄氏度烤25分钟
打开空气炸锅，小心取出锡纸盘，将鸡全翅翻面
继续200摄氏度烤25分钟
取出即可食用', e'本例中鸡全翅口感为微辣，需增加辣度请增加辣椒粉用量，但不宜超过30g
鸡全翅指包含翅尖，翅中和翅根的鸡翅
本品效果微焦，如不喜欢焦褐色外观可不向锡纸盘中倒入残余酱汁并每面只烤制20分钟
实际烤制效果请根据自己空气炸锅的功率判断
甜椒粉起增加色泽和风味作用，本身不能作为辣味剂
腌制时间可自由掌控，建议在60分钟到180分钟之间为宜
刚出锅的锡纸盘比较烫，请用夹子夹取或使用湿抹布之类的隔热材料拿取', '', '1', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');
INSERT INTO public.recommend (id, account_id, diet_type, flavor_preference, difficulty, cooking_time, name, "desc", ingredient, step, tip, image, size, ip, create_time, update_time) VALUES (355, 0, '素菜', '鲜', '得心应手', '6', '地三鲜', '地三鲜是一道色香味俱全的传统名菜，选用茄子、土豆和青椒三种蔬菜制作而成。口感丰富，咸香可口，是一道深受大众喜爱的家常菜肴。', e'茄子100g
土豆150g
尖椒3 - 4个
葱3g
姜10g
蒜10g
豆瓣酱20ml
生抽10ml
盐8g
糖10g
淀粉20g
油40ml', e'土豆洗净、去皮。茄子、尖椒洗净。
葱切0.5cm小段。蒜剁碎。姜切沫。
茄子、土豆、尖椒均切成15g的小块。
热锅，加入25ml油。
加入土豆，煎炸大约3分钟，待其到大约8分熟，以显示金黄色为准。
捞出土豆，留下油。
加入茄子，煎炸大约40秒，待其到大约7分熟，以显示金黄色为准。
如果锅内已经没有流动的油，可以考虑补充15ml油。
放入葱、姜。
放入豆瓣酱20ml。
放入生抽10ml。
放入盐8g。
放入糖10g。
放入之前处理的土豆。
放入尖椒。
翻炒1分钟。
放入蒜10g。
加入200ml水和20g淀粉。
待水开后，汤减少一半时，关火盛盘。', e'煎炸土豆和茄子时要注意火候，避免炸糊。
根据个人口味可以适当调整盐、糖的用量。
如果锅内油不够可以适当补充，以保证菜肴的口感。', '', '4', '', '2025-04-15 09:36:31.757', '2025-04-15 09:36:31.757');

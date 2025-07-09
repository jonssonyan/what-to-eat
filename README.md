# 吃啥好呢

个性化菜谱推荐与收藏系统，支持多条件定制、国际化、第三方登录，助你轻松解决“今天吃什么”的难题。

## 主要功能

- 🍽️ 个性化菜谱推荐：支持饮食偏好、口味、烹饪时间、难度等多条件定制
- ⭐ 菜谱收藏夹：一键收藏、管理你的专属菜谱
- 🏷️ 用户称号系统：根据收藏数量自动授予等级称号
- 🌍 国际化支持：中英文切换，界面友好
- 🔒 第三方登录：支持 Google 登录
- 📝 更新日志与反馈：随时查看历史变更，欢迎提出建议
- 📱 移动端适配：良好的移动端体验

## 在线演示

https://eat.jonssonyan.com

![preview](docs/images/preview.png)

## 快速开始

1. 克隆项目

    ```bash
    git clone https://github.com/jonssonyan/what-to-eat.git
    ```

2. 安装依赖

    ```bash
    cd what-to-eat
    pnpm install
    ```

3. 初始化数据库

   从 [sql/init_mysql.sql](sql/init_mysql.sql) 中创建表

4. 配置环境变量

   你需要在根目录下创建 `.env` 文件，参考下方变量：

   ```env
   DATABASE_URL=mysql://USERNAME:PASSWORD@HOST:PORT/DATABASE
   NEXTAUTH_URL=http://localhost:3000
   NEXTAUTH_SECRET=xxx
   GOOGLE_CLIENT_ID=Google OAuth Client ID
   GOOGLE_CLIENT_SECRET=Google OAuth Client Secret
   ```

5. 本地开发

   ```bash
   pnpm dev
   ```

## 其他

Telegram Channel: https://t.me/jonssonyan_channel

你可以在 YouTube 上订阅我的频道: https://www.youtube.com/@jonssonyan

如果这个项目对你有帮助，你可以请我喝杯咖啡:

<img src="https://github.com/jonssonyan/install-script/assets/46235235/cce90c48-27d3-492c-af3e-468b656bdd06" width="150" alt="微信赞赏码" title="微信赞赏码"/>

## 开源协议

[Apache-2.0](LICENSE)

## 致谢

- [HowToCook](https://github.com/Anduin2017/HowToCook)
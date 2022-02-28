# QBox

簡單到不行的匿名問答箱。

https://qbox.bunya.tw

# 系統需求

- Ruby 3.1+
- PostgreSQL 14+
- Node 16+

# 初始化

```
bundle install
yarn
rails db:create db:migrate
```

# 啟動開發伺服器

```
bin/dev
```

# 測試

目前覆蓋率趨近於零...

```
rails test
```

# 部署

設置好 dokku server, 然後:

```
git push dokku master
```

© 2022 QBox

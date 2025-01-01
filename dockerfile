# ベースイメージとしてRuby 3.1.3を使用
FROM ruby:3.1.3

# 作業ディレクトリを設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock ./

# Gemをインストール。キャッシュ効率を上げるため、COPYの後に行う。
RUN bundle install

# ポート3010を公開
EXPOSE 3010

# rails serverコマンドを実行
CMD ["rails", "server", "-b", "0.0.0.0"] 

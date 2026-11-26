# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

movies = [
  {
    title: "テスト映画",
    plot_summary: "映画詳細画面の表示確認用データです。",
    release_date: Date.new(2026, 1, 1),
    director: "テスト監督"
  },
  {
    title: "白熊だけが知っている",
    release_date: Date.new(2011, 11, 20),
    director: "キム・ヘジン",
    plot_summary: "動物園で相次ぐ連続不審死。その事件の唯一の目撃者は、静かに檻の中で暮らす一頭のシロクマだった。人間の深層心理と隠された真相に静かに迫っていく心理サスペンス。"
  },
  {
    title: "アンダルシアの蟻",
    release_date: Date.new(1982, 4, 1),
    director: "クリストファー・スコット",
    plot_summary: "その画家は生涯蟻だけを描き続けた。なぜ蟻なのか、いつから蟻を描き始めたのか、そこにあったのはあまりにも切なく、そして悲しい理由があった。"
  }
]

movies.each do |movie|
  Movie.find_or_create_by!(title: movie[:title]) do |m|
    m.release_date = movie[:release_date]
    m.director = movie[:director]
    m.plot_summary = movie[:plot_summary]
  end
end

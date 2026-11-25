class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :plot_summary, null: false
      t.date :release_date, null: false
      t.string :director, null: false

      t.timestamps
    end

    # 映画タイトル検索で使用するインデックス設定
    add_index :movies, :title
  end
end

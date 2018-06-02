class AddLikeAndDislikeToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :like, :string
    add_column :movies, :dislike, :string
  end
end

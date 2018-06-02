class AddLikeAndDislikeToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :like, :integer
    add_column :movies, :dislike, :integer
  end
end

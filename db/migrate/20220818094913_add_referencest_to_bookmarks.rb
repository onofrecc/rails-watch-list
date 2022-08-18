class AddReferencestToBookmarks < ActiveRecord::Migration[7.0]
  def change
    # add_reference(:products, :supplier, foreign_key: true)
    add_reference(:bookmarks, :movies, foreign_key: true)
    add_reference(:bookmarks, :lists, foreign_key: true)
  end
end

class AddPaperclipToBookmark < ActiveRecord::Migration

  def self.up
    add_attachment :bookmarks, :image
  end

  def self.down
    remove_attachment :bookmarks, :image
  end
end

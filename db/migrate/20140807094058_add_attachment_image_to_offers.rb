class AddAttachmentImageToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :offers, :image
  end
end

class AddSocialtoChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :championships, :social_media, :text
  end
end

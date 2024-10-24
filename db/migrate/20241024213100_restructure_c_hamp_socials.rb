class RestructureCHampSocials < ActiveRecord::Migration[7.0]
  def up
    add_column :championships, :facebook, :string
    add_column :championships, :instagram, :string

    Championship.find_each do |championship|
      if championship.social_media.is_a?(Hash)
        championship.update_columns(
          facebook: championship.social_media[:facebook] || championship.social_media['facebook'], 
          instagram: championship.social_media[:instagram] || championship.social_media['instagram']
        )
      end
    end

    remove_column :championships, :social_media
  end

  def down
    add_column :championships, :social_media, :text

    Championship.find_each do |championship|
      social_media = { facebook: championship.facebook, instagram: championship.instagram }
      championship.update_columns(social_media: social_media)
    end

    remove_column :championships, :facebook, :string
    remove_column :championships, :instagram, :string
  end
end

class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :file
      t.belongs_to :attachable, polymorphic: true

      t.timestamps
    end
  end
end

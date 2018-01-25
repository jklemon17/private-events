class CreateEventInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :event_invites do |t|
      t.references :event, foreign_key: true
      t.references :invitee, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end

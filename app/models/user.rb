# User
class User < ActiveRecord::Base
  has_secure_password

  # --- Relations --------------------------------------------------------->>
  has_many :posts, foreign_key: :author_id
  has_many :comments, through: :posts
  # --- Relations --------------------------------------------------------->>

  # --- Validations ------------------------------------------------------->>
  validates :email,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              on: :create
            }
  # --- Validations ------------------------------------------------------->>

  # --- Callbacks --------------------------------------------------------->>
  after_create :send_invite_email
  # --- Callbacks --------------------------------------------------------->>

  private

  def send_invite_email
    Notifications.invitation(self).deliver
  end
end

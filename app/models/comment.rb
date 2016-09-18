class Comment < ActiveRecord::Base
  # --- Relations --------------------------------------------------------->>
  belongs_to :post, counter_cache: true
  # --- Relations --------------------------------------------------------->>

  # --- Validations ------------------------------------------------------->>
  validates :post_id, presence: true
  validates :body, presence: true
  validates :approved, inclusion: { in: [true, false] }
  # --- Validations ------------------------------------------------------->>

  # --- Scopes ------------------------------------------------------------>>
  scope :approved, ->() { where(approved: true) }
  scope :unapproved, ->() { where(approved: false) }
  # --- Scopes ------------------------------------------------------------>>

  # --- Callbacks --------------------------------------------------------->>
  before_validation :set_default_approved
  # --- Callbacks --------------------------------------------------------->>

  private

  def set_default_approved
    self.approved = false if approved.nil?
  end
end

# Posts
class Post < ActiveRecord::Base
  STATES = %w(draft published scheduled).freeze

  # --- Relations --------------------------------------------------------->>
  has_many :comments
  has_many :approved_comments,
           -> { where('approved_at is not ?', nil) },
           class_name: 'Comment'
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :tags
  # --- Relations --------------------------------------------------------->>

  # --- Validations ------------------------------------------------------->>
  validates :title, presence: true
  validates :state, inclusion: { in: STATES }
  validate :not_spammy, if: :title
  # --- Validations ------------------------------------------------------->>

  # --- Callbacks --------------------------------------------------------->>
  before_save :generate_slug, unless: :slug?
  # --- Callbacks --------------------------------------------------------->>

  # --- Scopes ------------------------------------------------------------>>
  scope :published,  -> { where('published_at is not ?', nil) }
  scope :drafts,     -> { where(published_at: nil) }
  scope :recent,     -> { published.limit(10) }
  scope :scheduled,  -> { where('published_at > ?', Time.now) }
  # --- Scopes ------------------------------------------------------------>>

  private

  def generate_slug
    self.slug = title.parameterize
  end

  def not_spammy
    errors.add(:title, 'is too spammy') if self.title.starts_with?('Top 10 ways to')
  end
end

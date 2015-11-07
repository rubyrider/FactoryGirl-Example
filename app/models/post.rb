class Post < ActiveRecord::Base

  # Title and contents should be present
  validates :title, :contents, :presence => true

  # A post may have
  # more then one author
  #
  # @return [ActiveRecord::Associations::CollectionProxy] Number of authorship
  # has been applied to this post
  has_many :authorships

  # Returns all the authors for specific posts
  #
  # @return [ActiveRecord::Associations::CollectionProxy] List of authors who has published this post.
  has_many :authors, through: :authorships

  # filter published post only
  #
  # @return [ActiveRecord::Relation] This will return all the published posts
  scope :published, -> { where.not(published_at: nil) }

  # filtering archived post
  #
  # @return [ActiveRecord::Relation] This will return all the archived posts
  scope :archived, -> { where(published_at: nil) }

  # filtering only recent
  #
  # @param [Integer] number_of_recent_post The will return the number of recent post for last 4 days
  # @return [ActiveRecord::Relation] This will return all the archived posts
  scope :recent, -> (number_of_recent_post) { published.limit(number_of_recent_post).where(published_at: [Data.today..4.days.ago]) }

  # To publish an unpublished post!
  #
  # @return [Boolean] If publish it will return true, unless false.
  def publish!
    return false unless published_at.nil?

    update_column :published_at, Time.zone.now
  end

  # To archive an published post!
  #
  # @return [Boolean] If it is archived it will return true, unless false.
  def archive!
    return false if published_at.nil?

    update_column :published_at, nil
  end
end

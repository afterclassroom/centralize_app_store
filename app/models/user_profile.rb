class UserProfile < ActiveRecord::Base
	extend FriendlyId
	# Relations
	belongs_to :user
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

  # Use default slug, but you can remove the dash
  def normalize_friendly_id(string)
    super.delete("-")
  end
end

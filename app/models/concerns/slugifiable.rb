module Slugifiable
  def to_slug
    self.name.downcase.gsub(" ", "-")
  end
end

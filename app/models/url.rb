class Url < ActiveRecord::Base
  belongs_to :user
  before_create :generate_short_url




  protected
  def generate_short_url
    self.short_url = Url.count + 1 #note this will create a bug if we delete any records
  end
end

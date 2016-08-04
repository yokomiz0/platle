class VoteEvent < ActiveRecord::Base
  has_many :votess

  before_save :gen_code

  private

  def gen_code
    if self.code.nil?
      self.code = Digest::SHA1.hexdigest(Time.now.to_s)
    end
  end
end

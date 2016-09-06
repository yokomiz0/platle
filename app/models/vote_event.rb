class VoteEvent < ActiveRecord::Base
    has_many :votes

    before_save :gen_code

    private

    def gen_code
        # /events/8a7sd8fj23o7s98df73897324
        if self.code.nil?
            self.code = Digest::SHA1.hexdigest(Time.now.to_s)
        end
    end
end

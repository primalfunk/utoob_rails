class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true
  before_save :check_author

 def check_author
   if self.user.blank?
     self.user = 'anon'
   end
 end

end

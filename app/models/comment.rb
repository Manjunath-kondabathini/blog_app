class Comment < ApplicationRecord
  # Association One to One connection
  belongs_to :user        
  belongs_to :post        
end

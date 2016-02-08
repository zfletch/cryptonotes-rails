class Note < ActiveRecord::Base
  validates :text, allow_nil: false, length: { maximum: 2000 }
end

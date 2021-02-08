class Attachment < ApplicationRecord
  belongs_to :product
  validates :archivo. attachment_presence: true
  has_attached_file :archivo

  do_not_validate_attachment_file_type :archivo #necesitras cambiarse
  
end

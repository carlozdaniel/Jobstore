class Attachment < ApplicationRecord
  belongs_to :product
  validates :archivo, attachment_presence: true
  has_attached_file :archivo, path: ":rails_root/archivos/:id/:style/:filename"

  do_not_validate_attachment_file_type :archivo #necesitras cambiarse
  
end

 
# == Schema Information
#
# Table name: attachments
#
#  id                   :integer         not null, primary key
#  product_id           :integer         not null
#  archivo_file_name    :string
#  archivo_content_type :string
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#


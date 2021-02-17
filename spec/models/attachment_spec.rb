require 'rails_helper'

RSpec.describe Attachment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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


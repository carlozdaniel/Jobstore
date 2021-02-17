class MyEmail < ApplicationRecord
  validates_presence_of :email, message: "olvidaste colocar el correo"
  validates_uniqueness_of :email, message: "este correo ya fue registrado"
  validates_format_of :email, with: Devise::email_regexp, message: "no mandaste un correo"
end

# == Schema Information
#
# Table name: my_emails
#
#  id         :integer         not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

